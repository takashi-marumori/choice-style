# テーブル設計

## users テーブル

|column            |Type   |Options                  |
|------------------|-------|-------------------------|
|nickname          |string |null: false              |
|email             |string |null: false, unique: true|
|encrypted_password|string |null: false              |
|date              |date   |null: false              |

### Association
- has_many :posts

## posts テーブル

|column            |Type      |Options                  |
|------------------|----------|-------------------------|
|memo              |text      |                         |
|user_id           |references|null: false              |
|season            |integer   |null: false,ActiveHash   |
|gender            |integer   |null: false,ActiveHash   |
|clothes           |integer   |null: false,ActiveHash   |
|image             |          |ActiveStorage            |

### Association
- belongs_to :user