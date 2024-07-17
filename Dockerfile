# Dockerfile

FROM ruby:3.2.3

# 必要なパッケージをインストール
RUN apt-get update -qq && apt-get install -y postgresql-client build-essential cron

# アプリケーションディレクトリの作成
RUN mkdir /manegement

# 作業ディレクトリの設定
WORKDIR /manegement

# GemfileとGemfile.lockをコピー
COPY Gemfile /manegement/Gemfile
COPY Gemfile.lock /manegement/Gemfile.lock

# Bundlerを最新バージョンに更新し、gemをインストール
RUN gem update --system && bundle install

# アプリケーションのソースコードをコピー
COPY . /manegement

# entrypoint.shをコピーして実行可能にする
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Procfileのための必要なツールをインストール
RUN gem install foreman

# エントリーポイントの設定
ENTRYPOINT ["entrypoint.sh"]

# アプリケーションが使用するポートを公開
EXPOSE 3000

# デフォルトのコマンドを設定
CMD ["foreman", "start"]
