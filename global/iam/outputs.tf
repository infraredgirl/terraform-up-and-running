output "neo_arn" {
  value       = aws_iam_user.example[0].arn
  description = "The ARN for the user Neo"
}

output "all_arns" {
  value       = aws_iam_user.example[*].arn
  description = "The ARNs for all users"
}
