# DB 設計

# users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false,unique: true|
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| last_name          | string              | null: false             |
| first_name         | string              | null: false             |
| last_name_kana     | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birthday           | date                | null: false             |

## Association
 * has_many :items
 * has_many :purchases

 ## items table

| Column            | Type               | Options                   |
|--------------------|---------------------|-------------------------|
| product_name       | string              | null: false             |
| price              | integer             | null: false             |
| info               | text                | null: false             |
| user               | references          | foreign_key: true       |
| category_id        | integer             | null: false             |
| prefecture_id      | integer             | null: false             |
| day_to_ship_id     | integer             | null: false             |
|product_condition_id| integer             | null: false             |
| shipping_charge_id | integer             | null: false             |

## Association

belongs_to :user
has_one    :purchase

## addresses table

| Column            | Type               | Options                   |
|--------------------|---------------------|-------------------------|
| postcode           | string              | null: false             |
| prefecture_id      | integer             | null: false             |
| block              | string              | null: false             |
| city               | string              | null: false             |
| building           | string              |                         |
| phone_number       | string              | null: false             |
| purchase           |references           | foreign_key: true       |

## Association


- belongs_to    :purchase

# purchases table

| Column            | Type               | Options                   |
|--------------------|---------------------|-------------------------|
| user               |references           | foreign_key: true       |
| item               |references           | foreign_key: true       |

## Association
- belongs_to :user
- belongs_to :item
- has_one    :address