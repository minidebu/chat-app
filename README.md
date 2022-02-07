# テーブル設計

## users テーブル

| Column             | Type   | Option     |
| -------------------| ------ | ---------- |
| name               | string | null:false |
| email              | string | null:false |
| encrypted_password | string | null:false |

### Association
has_many :room_users
has_many :rooms, through: :room_users
has_many :messages 

## rooms テーブル

| Column | Type   | Option     |
| ------ | ------ | ---------- |
| name   | string | null:false |

### Association
has_many :room_users
has_many :users, through: :room_users
has_many :messages

## room_users テーブル

| Column | Type       | Option                       |
| ------ | ---------- | ---------------------------- |
| user   | references | null:false, foreign_key:true |
| room   | references | null:false, foreign_key:true |

### Association
belongs_to :user
belongs_to :room

## messages テーブル
| Columns | Type       | Option
| ------- | ---------- | ---------------------------- |
| content | string     | null:false                   |
| user    | references | null:false, foreign_key:true |
| room    | references | null:false, foreign_key:true |

### Association
belongs_to :user
belongs_to :room