variable "bucket_name" {
  description = "Name of the bucket"
  type = string
}

variable "kms_master_key_id" {
  description = "AWS KMS master key ID used for the SSE-KMS encryption"
  type = string
}