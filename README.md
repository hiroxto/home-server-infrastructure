# home-server-infrastructure

自宅サーバーのインフラ。

## セットアップ

### Taskfileのインストール

タスクランナーに[Taskfile](https://taskfile.dev/)を使っているため，予めインストールする。

### コンテナの設定

`$ task init`を実行すると`.env`の設定とDockerコンテナのビルドが行われる。

`.env`に必要な内容を設定する。

## 使い方

### サービスの起動

`$ task up`で全サービスが起動する。

### サービスの停止

`$ task down`で全サービスが停止する。

### サービスの再起動

`$ task restart`で全サービスが再起動する。

### サービスの状態の確認

`$ task ps`でサービスの状態を表示する。

### サービスのログの表示

`$ task logs`でサービスのログを表示する。
