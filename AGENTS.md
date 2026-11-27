# Repository Guidelines

## プロジェクト構成

このリポジトリは自宅サーバー向けの Docker Compose 構成を管理する。
`compose.yaml` が各種サービスの定義である。

空のマウント先ディレクトリは `.gitkeep` で維持する。

## ビルド・検証・開発コマンド

Docker Compose と [mise](https://mise.jdx.dev/) が必要である。

- `mise tasks`: 利用可能なタスクを表示する
- `mise run init`: イメージを取得・ビルドする
- `mise run build`: Docker イメージをビルドする
- `mise run up`: 全サービスをバックグラウンドで起動する
- `mise run ps`: コンテナの状態を確認する
- `mise run logs`: 指定サービスのログをリアルタイムで表示する
- `mise run down`: Compose スタックを停止・削除する
- `docker compose config --quiet`: `compose.yaml` の構文と構成を検証する

`mise run <タスク名>` の後ろに引数を指定すると、実行するコマンドの末尾に追加される。
- 例: `mise run logs nginx`: Nginx コンテナのログを確認する

## テスト方針

ユニットテストは存在しない。
ホスト側のデバイスとマウント先を利用できる環境では、`mise run up` と `mise run ps` で起動状態を確認する。
`compose.yaml` には本番環境向けのデバイスやディレクトリを直接記述しているため、`/dev/px4video*` や `/mnt/dtv` は開発環境に存在するとは限らない。

安全に実行できる検証:
- `docker compose config --quiet`: `compose.yaml` の構文を検証する
- `docker compose pull --dry-run`: イメージを変更した場合に実施する

## コミットとプルリクエスト

- 1 つのコミットでは 1 つの意図に絞る。
- コミットメッセージのプレフィックスには `feat:`、`fix:`、`delete:`、`docs:`、`ci:` のような短い Conventional Commits 形式を使用する。
- コミットメッセージは何を変更するかを日本語で簡潔に書く。
- コミット前に差分を確認し、実際の変更内容に沿ったメッセージにする。
- PR 作成時は `.github/pull_request_template.md` の構成に従い、テンプレートの見出しを維持して本文を埋める。

## 関連リポジトリ

- [hiroxto/infrastructure](https://github.com/hiroxto/infrastructure): 自宅サーバー、ドメイン、Cloudflare などを Terraform で管理する。
- [hiroxto/home-server-infrastructure-docker](https://github.com/hiroxto/home-server-infrastructure-docker): `home-server-infrastructure` で使用する Docker イメージの Dockerfile と、GitHub Container Registry へデプロイするための設定を管理する。
