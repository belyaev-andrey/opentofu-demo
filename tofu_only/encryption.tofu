terraform {

  encryption {
    key_provider "pbkdf2" "foo" {
      passphrase = "sdsdsadsdADADASDASDSsddsdfsdfwewfeffwfew"
      key_length = 32
      hash_function = "sha256"
    }

    method "unencrypted" "s" {}

    method "aes_gcm" "sd" {
      keys = key_provider.pbkdf2.foo
    }

    state {
      method = method.aes_gcm.sd
    }

    plan {
      method = method.unencrypted.s
    }

  }

}