# ecr_sample_for_CICD

ecr_sample_for_CICD

CICD 用のリポジトリ<br>
https://github.com/umanari145/IaCのaws_cicdのサンプルで簡易的なsource

## ECR への登録

step1 ビルドの image の登録

```
docker build -t my-web . -f Dockerfile名 --no-cache

```

step2 ECR へのログイン

```
aws ecr get-login-password --region <your-region> | docker login --username AWS --password-stdin <your-account-id>.dkr.ecr.<your-region>.amazonaws.com

```

step3 タグづけ

```
docker tag my-web:latest <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/my-web:latest

```

step4 ECR へのプッシュ

```
docker push <your-account-id>.dkr.ecr.<your-region>.amazonaws.com/my-web:latest

```

https://dev.classmethod.jp/articles/codepipeline-ecs-codedeploy/



## heroku での登録

heroku自体のログイン
```
heroku login
 ›   Warning: heroku update available from 9.1.0 to 9.3.2.
heroku: Press any key to open up the browser to login or q to exit:

# ここでブラウザでログイン

Opening browser to https://cli-auth.heroku.com/auth/cli/browser/****Logging in... done
Logged in as ******@xxxxxx

```

コンテナログイン
```
 heroku container:login
Login Succeeded
```

heroku containerへの登録とpush
```
docker tag my-web:latest registry.heroku.com/<app-name>/web:latest
docker push registry.heroku.com/<app-name>/web:latest
```

コンテナのリリース
```
heroku container:release web -a <app-name>
```

deploy_to_heroku.sh・・herokuログイン後、自動デプロイするためのスクリプト
```
(例)
bash deploy_to_heroku.sh my-web fm-liveworks-dev Dockerfile_apache_php2
```
Dockerfile_apache_php・・httpd+php7.4
Dockerfile_httpd・・生のapacheが入っているのみ。herokuでのコンテナデプロイは成功
Dockerfile_nginx・・生のnginxが入っているのみ。herokuでのコンテナデプロイは成功
