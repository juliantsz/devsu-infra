variable "name" {
  type = string
  description = "Name of the repository"
}

variable "image_tag_mutability" {
  type = string
  description = "The tag mutability setting for the repository. Must be one of: MUTABLE or IMMUTABLE"
}

variable "tags" {
  type = map(string)
  description = "A map of tags to assign to the resource."
}