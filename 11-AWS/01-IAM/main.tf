resource "aws_iam_user" "user" {
  name = "user-created-by-terraform"
  tags = {
    Description = "Test"
  }
}

resource "aws_iam_policy" "adminPolicy" {
  name = "AdminUsers"
  policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "user-adminPolicy" {
    user = aws_iam_user.user.name
    policy_arn = aws_iam_policy.adminPolicy.arn
}