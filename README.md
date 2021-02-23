## furimaのER図

## users テーブル

| Column           | Type   | Options                     |
| --------------   | ------ | --------------------------  |
| nickname         | string | NOT NULL                    |
| email            | string | NOT NULL, foreign_key: true |
| password         | string | NOT NULL                    |
| last_name        | string | NOT NULL                    |
| first_name       | string | NOT NULL                    |
| last_name_kana   | string | NOT NULL                    |
| first_name_kana  | string | NOT NULL                    |
| birth_year       | string | NOT NULL                    |
| birth_month      | string | NOT NULL                    |
| birthday         | string | NOT NULL                    |

### Association
- has_many :items
- has_many :purchases
- has_one :shipping_address


## items テーブル

| Column          | Type       | Options            |
| --------------  | ---------- | -----------------  |
| product_name    | string     | NOT NULL           |
| introduction    | text       | NOT NULL           |
| category        | string     | NOT NULL           |
| condition       | string     | NOT NULL           |
| delivery_fee    | string     | NOT NULL           |
| delivery_source | string     | NOT NULL           |
| days_to_ship    | string     | NOT NULL           |
| selling_price   | string     | NOT NULL           |
| user            | references | foreign_key: true  |

### Association
- belongs_to :user
- has_one :purchase
- has_one :shipping_address


## purchases テーブル

| Column       | Type       | Options            |
| -----------  | ---------- | -----------------  |
| user         | references | foreign_key: true  |
| item         | references | foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item


## shipping_addresses テーブル

| Column         | Type       | Options            |
| -------------- | ---------- | -----------------  |
| post_code      | string     | NOT NULL           |
| prefectures    | string     | NOT NULL           |
| municipality   | string     | NOT NULL           |
| address        | string     | NOT NULL           |
| building_name  | string     |                    |
| phone_num      | string     | NOT NULL           |
| user           | references | foreign_key: true  |
| item           | references | foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :item