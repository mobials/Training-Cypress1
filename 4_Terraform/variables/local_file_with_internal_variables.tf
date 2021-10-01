variable "psfn" {
    type = string
    default = "file"
}
variable "pnfn" {
    type = number
    description = "File's number"
    sensitive = true
}
variable "extension" {
    type = string
    description = "File's extension. Value accepted: txt, jpg"
    validation = validation {
        condition = anytrue([var.extension == "txt", var.extension == "jpg"])
        error_message = "Extension not supported! Change it to txt or jpg."
    }
}
variable "content" {
}
resource "local_file" "message" {
    filename = "/mnt/c/Users/ivanporta/Desktop/${var.pnfn}-${var.psfn}.${var.extension}"
    content = var.content
}