# アプリ名
釣りすぎ君。

# 概要
釣果記録アプリ
魚の種類ごとに釣果を登録できる
詳細には今まで釣った数と最大サイズが表示される

# 制作背景
趣味の釣りでアプリを作りたいと思い既存のアプリを参考にしながら考えました。
釣ったことのある魚の一覧と釣った総数を見れるアプリはなかったので差別化として実装しました。

# 工夫したポイント
魚の名前と釣果情報のテーブルを分けることによって情報を取り出しやすくした。

# 今後の課題
ランキングをつけるために正規表現をしっかり設定することによって
種類ごとに大きさや数のランキングをつけることができる。

フロントの実装が不得意ということがわかったので今後の課題としたい。

アプリを作る上で、設計、要件定義がしっかりできていなくやり直すことがあった。
コードを書くことより重要なことだと感じたので、今後作るとしたらしっかりと
設計を練りたいと思います。

# DB設計

## usersテーブル


| Column            | Type   | Option                    |
| ----------------- | ------ | ------------------------- |
| email             | string | null: false, unique: true |
| encrypted_password| string | null: false               |
| nickname          | string | null: false               |


### Association
has_many :fish_names
has_many :rankings
has_one :profile

## fish_names

| Column            | Type       | Option                        |
| ----------------- | ---------- | ----------------------------- |
| fish_kind         | string     | null: false                   |
| user              | references | null: false, foreign_key: true|

### Association
has_many :fish_infos
belongs_to :user

## fish_infosテーブル

| Column            | Type       | Option                        |
| ----------------- | ---------- | ----------------------------- |
| day               | date       | null: false                   |
| fish_size         | string     | null: false                   |
| fish_num          | string     | null: false                   |
| memo              | text       | null: false                   |
| fish_name         | references | null: false, foreign_key: true|


### Association
belongs_to :fish_name
has_many :rankings

## rankingsテーブル

| Column            | Type       | Option                        |
| ----------------- | ---------- | ----------------------------- |
| user              | references | null: false, foreign_key: true|
| fish_name         | references | null: false, foreign_key: true|
| fish_info         | references | null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :fish_name
belongs_to :fish_info

## profilesテーブル

| Column            | Type       | Option                        |
| ----------------- | ---------- | ----------------------------- |
| field             | string     | null: false,                  |
| text              | text       | null: false                   |
| career            | string     | null: false                   |
| user              | references | null: false, foreign_key: true|

### Association
belongs_to :user

