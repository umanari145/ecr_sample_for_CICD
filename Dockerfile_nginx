# ベースイメージとしてNginxを使用
FROM nginx:alpine

# 作業ディレクトリを設定
WORKDIR /usr/share/nginx/html

# カスタムのHTMLファイルをコピー
COPY src/index.html .
COPY nginx/default.conf.template /etc/nginx/conf.d/default.conf.template

# Nginxを起動
CMD /bin/sh -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'
