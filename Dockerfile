# ベースイメージとしてNginxを使用
FROM nginx:alpine

# 作業ディレクトリを設定
WORKDIR /usr/share/nginx/html

# カスタムのHTMLファイルをコピー
COPY index.html .

# ポート80を開放
EXPOSE 80

# Nginxを起動
CMD ["nginx", "-g", "daemon off;"]
