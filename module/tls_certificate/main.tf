resource "tls_private_key" "my_private_key" {
  algorithm = var.private_key_algorithm
  rsa_bits  = var.private_key_rsa_bits
}

resource "tls_self_signed_cert" "my_certificate" {
  key_algorithm   = var.certificate_key_algorithm
  private_key_pem = tls_private_key.my_private_key.private_key_pem
  subject {
    common_name = var.certificate_common_name
  }
}
