# ecr_sample_for_CICD

ecr_sample_for_CICD

CICD 用のリポジトリ<br>
https://github.com/umanari145/IaCのaws_cicdのサンプルで簡易的なsource

## ECR への登録

step1 ビルドの image の登録

```
docker build -t my-nginx-app .

```

step2 ECR へのログイン

```
aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.<your-region>.amazonaws.com

```

step3 タグづけ

```
docker tag my-nginx-app:latest <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/my-nginx-app:latest

```

step4 ECR へのプッシュ

```
docker push <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/my-nginx-app:latest

```

https://dev.classmethod.jp/articles/codepipeline-ecs-codedeploy/
