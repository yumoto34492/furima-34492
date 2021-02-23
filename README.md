## furimaのER図

## users テーブル

| Column             | Type   | Options                |
| ----------------   | ------ | ---------------------  |
| nickname           | string | NOT NULL               |
| email              | string | NOT NULL, unique: true | <!-- unique: true 一意性のみで同じ値は保存できない -->
| encrypted_password | string | NOT NULL               | <!-- Deviseのデフォルトのパスワード -->
| last_name          | string | NOT NULL               |
| first_name         | string | NOT NULL               |
| last_name_kana     | string | NOT NULL               |
| first_name_kana    | string | NOT NULL               |
| birthday           | date   | NOT NULL               | <!-- date型は、年、月、日をまとめて取得可能 -->


### Association
- has_many :items
- has_many :purchases
<!-- ユーザーと住所は関連付けない -->


## items テーブル

| Column             | Type       | Options            |
| -----------------  | ---------- | -----------------  |
| product_name       | string     | NOT NULL           |
| introduction       | text       | NOT NULL           |
| category_id        | integer    | NOT NULL           | <!-- active_hashで実装のするため、単数形＋「_id」とする -->
| condition_id       | integer    | NOT NULL           |
| delivery_fee_id    | integer    | NOT NULL           |
| delivery_source_id | integer    | NOT NULL           |
| days_to_ship_id    | integer    | NOT NULL           |
| selling_price      | integer    | NOT NULL           |
| user               | references | foreign_key: true  |

### Association
- belongs_to :user
- has_one :purchase
<!-- アイテムと住所は関連付けない -->


## purchases テーブル

| Column       | Type       | Options            |
| -----------  | ---------- | -----------------  |
| user         | references | foreign_key: true  |
| item         | references | foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_addresses
<!-- 住所をは購入する都度入力するため、ユーザーとアイテムとは紐付けない -->

## shipping_addresses テーブル

| Column         | Type       | Options            |
| -------------- | ---------- | -----------------  |
| post_code      | string     | NOT NULL           |
| prefectures    | string     | NOT NULL           |
| municipality   | string     | NOT NULL           |
| address        | string     | NOT NULL           |
| building_name  | string     |                    |
| phone_num      | string     | NOT NULL           |
| purchases      | references | foreign_key: true  |

### Association
- belongs_to :purchases