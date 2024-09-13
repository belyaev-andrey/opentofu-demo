variable "ssh_username" {
  default = "Administrator"
}
variable "ssh_host" {
  type = string
}
variable "ssh_domain" {
  default = "hetzner.labs.intellij.net"
}

source null null {
  communicator = "ssh"

  ssh_host       = "${var.ssh_host}.${var.ssh_domain}"
  ssh_username   = var.ssh_username
  ssh_timeout    = "1m"
  ssh_agent_auth = true
}

locals {
  powershell_execute_command = "powershell -ExecutionPolicy Bypass \"$ErrorActionPreference = 'Stop'; $global:ProgressPreference='SilentlyContinue'; $env:Path = [Environment]::GetEnvironmentVariable('PATH', 'Machine'); & { . {{ .Vars }}; &'{{ .Path }}'; exit $LastExitCode }\""
}

build {
  sources = [
    "source.null.null"
  ]
  provisioner "powershell" {
    inline = ["mkdir -f \"C:\\packer-ps-lib\""]
  }
  provisioner "file" {
    source      = "${path.root}/../../windows/scripts/lib/"
    destination = "C:\\packer-ps-lib\\"
  }
  provisioner "powershell" {
    execute_command = local.powershell_execute_command
    scripts         = [
      "${path.root}/../../windows/scripts/ProcessHacker.ps1",
      "${path.root}/../../windows/scripts/install-containers-feature.ps1",
    ]
  }
  provisioner "windows-restart" {
    restart_timeout = "15m"
  }
  provisioner "powershell" {
    execute_command  = local.powershell_execute_command
    environment_vars = [
      "ACCESS_MODE=internal",
      "LOCATION=hetzner",
      "PS_LIB=C:\\packer-ps-lib",

      "INSTALLATION_DIR=C:\\Tools",
      "BUILD_TOOLS_DIR=C:\\Tools",

      "BUILDAGENT_DIR=C:\\BuildAgent",

      "CYGWIN=autoconf binutils cpio diffutils file gawk gcc-core make m4 rsync unzip zip",

      "JAVA_VERSIONS=corretto:17:x64,corretto:11:x64,corretto:8:x64",

    ]
    scripts = [
      "${path.root}/../../windows/scripts/trust_JetBrains_CA.ps1",
      "${path.root}/../../windows/scripts/symsrv-allow-symbols-download-under-service.ps1",
      "${path.root}/../../windows/scripts/disableWindowsUpdateService.ps1",
      "${path.root}/../../windows/scripts/disableMeltdownSpectreFixes.ps1",
      "${path.root}/../../windows/scripts/disableOneDrive.ps1",
      "${path.root}/../../windows/scripts/disableCortana.ps1",
      "${path.root}/../../windows/scripts/disablePrintSpooler.ps1",
      "${path.root}/../../windows/scripts/disableTelemetry.ps1",
      "${path.root}/../../windows/scripts/fix-temporary-aspnet-files.ps1",

      "${path.root}/../../windows/scripts/SysinternalsSuite_in_tools.ps1",

      "${path.root}/../../windows/scripts/rsync.ps1",

      "${path.root}/../../windows/scripts/Subversion.ps1",
      "${path.root}/../../windows/scripts/Mercurial.ps1",
      "${path.root}/../../windows/scripts/Git.ps1",
      "${path.root}/../../windows/scripts/Git-disable-autogc.ps1",
      "${path.root}/../../windows/scripts/Git-crlf-input.ps1",

      "${path.root}/../../windows/scripts/gpg.ps1",
      "${path.root}/../clion/windows/cygwin.ps1",

      "${path.root}/../../windows/scripts/chocolatey.ps1",

      "${path.root}/../../windows/scripts/7z.ps1",
      "${path.root}/../../windows/scripts/Depends.ps1",
      "${path.root}/../../windows/scripts/ExplorerSuite.ps1",
      "${path.root}/../../windows/scripts/Far.ps1",
      "${path.root}/../../windows/scripts/GoogleChrome.ps1",
      "${path.root}/../../windows/scripts/InternetExplorer.ps1",
      "${path.root}/../../windows/scripts/Notepad2.ps1",
      "${path.root}/../../windows/scripts/TreeSizeFree.ps1",
      "${path.root}/../../windows/scripts/WinDBG.ps1",
      "${path.root}/../../windows/scripts/WinSCP.ps1",
      "${path.root}/../../windows/scripts/totalcmd.ps1",

      "${path.root}/../../windows/scripts/cmake.ps1",
      "${path.root}/../../windows/scripts/python3.ps1",
      "${path.root}/../../windows/scripts/JDKs.ps1"
    ]
  }
  provisioner "windows-restart" {
    restart_timeout = "15m"
  }

  provisioner "file" {
    source      = "${path.root}/../../windows/configs/"
    destination = "C:\\Tools"
  }

  provisioner "powershell" {
    execute_command  = local.powershell_execute_command
    environment_vars = [
      "ACCESS_MODE=internal",
      "LOCATION=hetzner",
      "PS_LIB=C:\\packer-ps-lib",

      "INSTALLATION_DIR=C:\\Tools",
      "BUILD_TOOLS_DIR=C:\\Tools",

      "BUILDAGENT_DIR=C:\\BuildAgent",

      "BUILDUSER_ADMIN_RIGHTS=true",
      "BUILDAGENT_SERVER_URL=https://buildserver.labs.intellij.net",
      "AGENT_NAME=intellij-windows-hw-hetzner-${var.ssh_host}",

      "AUTHORIZED_KEYS_USERNAMES=builduser,Administrator",
    ]
    scripts = [

      "${path.root}/../../windows/scripts/buildagent.ps1",
      "${path.root}/../../windows/scripts/buildagent_set_server_url.ps1",
      "${path.root}/../../windows/scripts/buildagent_set_agent_name.ps1",
      "${path.root}/../../windows/scripts/buildagent_make_admin.ps1",
      "${path.root}/../../windows/scripts/buildagent_image_version.ps1",
      "${path.root}/../../windows/scripts/buildagent_allow_performance_monitoring.ps1",

      "${path.root}/../../windows/scripts/enable_long_paths.ps1",

      "${path.root}/../../windows/scripts/put-hetzner-authorized-keys.ps1",
      "${path.root}/windows/put-iji-authorized-keys.ps1",

      "${path.root}/../../windows/scripts/windows_exporter.ps1",
      "${path.root}/../../windows/scripts/windows_exporter-buildAgent.ps1",
      "${path.root}/../../windows/scripts/windows_exporter-smartctl.ps1",
      "${path.root}/../../windows/scripts/osquery.ps1",
      "${path.root}/../../windows/scripts/fix-ssh-agent.ps1",
    ]
  }
  provisioner "powershell" {
    execute_command  = local.powershell_execute_command
    environment_vars = [
      "ACCESS_MODE=internal",
      "LOCATION=hetzner",
      "PS_LIB=C:\\packer-ps-lib",

      "INSTALLATION_DIR=C:\\Tools",
      "BUILD_TOOLS_DIR=C:\\Tools",

      "BUILDAGENT_DIR=C:\\BuildAgent",

      "BUILDUSER_NAME=builduser",

    ]
    scripts = [
      "${path.root}/../../windows/scripts/buildagent_properties.ps1",
    ]
  }
  provisioner "windows-restart" {
    restart_timeout = "15m"
  }
}