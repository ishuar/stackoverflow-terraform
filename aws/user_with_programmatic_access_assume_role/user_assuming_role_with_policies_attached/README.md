## Solution Type : `Use IAM User to Assume Role with Required Access`

### Execution flow : Step 1

Root module includes `iam-role.tf` file which is responsible for only role creation which allows currently used user with terraform to assume the role. Role also has AWS managed policies [`AmazonEC2FullAccess`,`AmazonVPCFullAccess`] attached to it.

Root module also assumes that the current user has the `IAMFullAccess` policy attached to it in order to create the  role in `iam-role.tf`.

```bash
# in user_assuming_role_with_policies_attached directory
terraform init 
terraform plan # to check the plan
terraform apply -auto-approve
```
### Execution flow : Step 2

[instance_and_sg_creation](./instance_and_sg_creation) directory includes the code for instance and security group creation using the role created in the [Execution flow : Step 1 ](#execution-flow--step-1). 

There are two providers in the [`providers.tf`](./instance_and_sg_creation/providers.tf)

- One for having access to read the role.
- One for assuming the role with `ec2` and `vpc` full permissions.



:sparkles: Feel free to upvote and accept as an answer. :sparkles:

Thank you :thumbsup: