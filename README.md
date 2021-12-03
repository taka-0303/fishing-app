## usersテーブル

| Column            | Type   | Option                    |
| ----------------- | ------ | ------------------------- |
| email             | string | null: false, unique: true |
| encrypted_password| string | null: false               |
| nickname          | string | null: false               |

### Association
has_many :fish_kinds
has_many :rankings
has_one :profile

## fish_kindsテーブル

| Column            | Type       | Option                        |
| ----------------- | ---------- | ----------------------------- |
| fish_name         | string     | null: false, unique: true     |
| fish_size         | string     | null: false                   |
| fish_quantity     | string     | null: false                   |
| place             | string     | null: false                   |
| user              | references | null: false, foreign_key: true|

### Association
belongs_to :user
has_many :rankings

## rankingsテーブル

| Column            | Type       | Option                        |
| ----------------- | ---------- | ----------------------------- |
| user              | references | null: false, foreign_key: true|
| fish_kind         | references | null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :fish_kind

## profilesテーブル

| Column            | Type       | Option                        |
| ----------------- | ---------- | ----------------------------- |
| field_id          | integer     | null: false, unique: true     |
| text              | text       | null: false                   |
| user              | references | null: false, foreign_key: true|

### Association
belongs_to :user

