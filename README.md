# demo Java application

## prerequisites
1. Create openID connector by using this Doc  (you can use same role if it is already created for https://github.com/kashifmehmood-engr/demo-IAC)
https://docs.github.com/en/actions/security-for-github-actions/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services
2. Create role and trust policy mentioned in above doc. This role will by used by github to connect to aws
4. Create github secrets to be used in workflow for-example I have created `AWS_ACCOUNT_ID` , `AWS_REGION` , `REPOSITORY` ,`GH_IAM_ROLE` ,`EKS_CLUSTER` ,`ECR_REGISTRY_URL`

## How to run workflow
1. Workflow will run automatically when you push the code to main branch

