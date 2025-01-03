resource "google_compute_security_policy" "default" {
  name = "default-policy"
  # ...
}

resource "aws_iam_policy" "policy" {
  policy = ""
}
