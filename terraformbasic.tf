//==================================================1st May 2024=========================================//
variable "original_string" {
  default = "Montreal College Information Technology"
}
variable "input_string" {
  type    = string
  default = "upper LOWER"
}
# Function 1: Length of the string
output "string_length" {
  value = length(var.original_string)
}

# Function 2: Uppercase the string
output "uppercase_string" {
  value = upper(var.original_string)
}

# Function 3: Lowercase the string
output "lowercase_string" {
  value = lower(var.original_string)
}

# Function 4: Replace "Hello" with "Hi"
output "replaced_string" {
  value = replace(var.original_string, " ", "")
}

# Function 5: Concatenate with another string
variable "additional_string" {
  default = " from Terraform"
}

output "concatenated_string" {
  value = "${var.original_string}${var.additional_string}"
}

# Function 6: Substring - Extract "World" from the string
output "substring_example" {
  value = substr(var.original_string, 6, -1)
}

# Function 7: Split the string by space into a list
output "split_example" {
  value = split(" ", var.original_string)
}

# Function 8: Join a list of strings into a single string with a separator
variable "string_list" {
  default = ["Montreal", "College","Information","Technology"]
}
output "reverse_examplesecond"{
  value=reverse(var.string_list)
}
output "join_example" {
  value = join(" ", var.string_list)
}

# Function 9: Trim leading and trailing whitespace
variable "whitespace_string" {
  default = "  Trimmed String  "
}

output "trimmed_string" {
  value = trim(var.whitespace_string," ")
}


output "reverse_example" {
  value = join("", reverse(split("", var.original_string)))
}

locals {
  contains_keyword = contains(split(" ", var.original_string), "MCIT")
}
output "contains_keyword_output"{
    value=local.contains_keyword
}

output "string_contains_no_sample" {
  value = local.contains_keyword ? "String contains 'Mcit'" : "String does not contain 'Mcit'"
}

output "string_contains_sample" {
  value = local.contains_keyword ? "String contains 'Montreal'" : "String does not contain 'Montreal'"
}
