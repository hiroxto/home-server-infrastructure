# home-server-infrastructure

自宅サーバーのインフラ。

## セットアップ

### miseのインストール

タスクランナーに[mise](https://mise.jdx.dev/)を使っているため，予めインストールする。

リポジトリを取得したら`$ mise trust`を実行し，`mise.toml`のタスクを使えるようにする。

### コンテナの設定

`$ mise run init`を実行するとDockerコンテナのビルドが行われる。

`.env`に必要な内容を設定する。

## 使い方

### サービスの起動

`$ mise run up`で全サービスが起動する。

### サービスの停止

`$ mise run down`で全サービスが停止する。

### サービスの再起動

`$ mise run restart`で全サービスが再起動する。

### サービスの状態の確認

`$ mise run ps`でサービスの状態を表示する。

### サービスのログの表示

`$ mise run logs`でサービスのログを表示する。
