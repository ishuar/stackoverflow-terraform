/*
!! Important !!
* Currently the AWS secrets(AWS_ACCESS_KEY_ID & AWS_SECRET_ACCESS_KEY) used for authentication to terraform is 
* from the user which has direct AWS managed policy [IAMFullAccess]  attached to it to create role and read policies.
* Need to create the role first so that in our provider config it can be assumed by the current signed in User

? Can be also done via AWS console and directly used with the base provider config.(will remove two provider configs)
*/

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "stackoverflow_assume_role_policy" {

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.arn]
    }
  }
}

resource "aws_iam_role" "stackoverflow" {

  name               = "stackoverflow-ec2-vpc-full-access-role"
  assume_role_policy = data.aws_iam_policy_document.stackoverflow_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ec2_full_access_policy" {

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  role       = aws_iam_role.stackoverflow.name
}

resource "aws_iam_role_policy_attachment" "vpc_full_access_policy" {

  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
  role       = aws_iam_role.stackoverflow.name
}
