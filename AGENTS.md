# Repository Guidelines

## プロジェクト構成

このリポジトリは自宅サーバー向けの Docker Compose 構成を管理します。
`compose.yaml` が各種サービスの定義です。

空のマウント先ディレクトリは `.gitkeep` で維持します。

## ビルド・検証・開発コマンド

Docker Compose と [Task](https://taskfile.dev/) が必要です。

- `task --list`: 利用可能なタスクを表示する
- `task init`: 環境設定を作成し、イメージを取得・ビルドする
- `task build`: Docker イメージをビルドする
- `task up`: 全サービスをバックグラウンドで起動する
- `task ps`: コンテナの状態を確認する
- `task logs`: 指定サービスのログを追跡する
- `task down`: Compose スタックを停止・削除する
- `docker compose config --quiet`: `compose.yaml` の構文と構成を検証する

`task`コマンドの後ろに`--`で引数を指定できます。
- 例: `task logs -- nginx`: Nginxコンテナのログを確認する

## テスト方針

ユニットテストは存在しません。
ホスト側のデバイスとマウント先を利用できる環境では、`task up` と `task ps` で起動状態を確認してください。
`compose.yaml`は本番環境向けのデバイスをハードコーディングしているため`/dev/px4video*` や `/mnt/dtv` が開発環境に存在するとは限りません。

安全に検証可能なテスト
- `docker compose config --quiet`: `compose.yaml` の構文を検証する
- `docker compose pull --dry-run`: イメージを変更した場合に実施する

## コミットとプルリクエスト

- 1 つのコミットでは 1 つの意図に絞る
- コミットメッセージのプレフィックスには `feat:`，`fix:`，`delete:`，`docs:`，`ci:` のような短い Conventional Commits 形式を使用する。
- コミットメッセージは何を変更するかを日本語で簡潔に書く
- コミット前に差分を確認し，実際の変更内容に沿ったメッセージにする。
- PR 作成時は `.github/pull_request_template.md` の構成に従い，テンプレートの見出しを維持して本文を埋める。

## 関連リポジトリ

- [hiroxto/infrastructure](https://github.com/hiroxto/infrastructure): 自宅サーバー、ドメイン、Cloudflare などを Terraform で管理する。
- [hiroxto/home-server-infrastructure-docker](https://github.com/hiroxto/home-server-infrastructure-docker): `home-server-infrastructure` で使用する Docker イメージの Dockerfile と，GitHub Container Registry へデプロイするための設定を管理します。
