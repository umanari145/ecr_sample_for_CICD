# ベースイメージとしてNginxを使用
FROM nginx:alpine

# 作業ディレクトリを設定
WORKDIR /usr/share/nginx/html

# カスタムのHTMLファイルをコピー
COPY src/index.html .
COPY nginx/default.conf /etc/nginx/conf.d/

# Nginxを起動
CMD ["nginx", "-g", "daemon off;"]
