# DB 設計

# users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
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
| produsname         | string              | null: false             |
| price              | integer             | null: false             |
| text               | text                | null: false             |
| user               |references           | foreign_key: true       |

## Association

- belongs_to :user
- belongs_to    :purchase

## address table

| Column            | Type               | Options                   |
|--------------------|---------------------|-------------------------|
| postcode           | string              | null: false             |
| prefecture_id      | integer             | null: false             |
| block              | string              | null: false             |
| city               | string              | null: false             |
| building           | string              | null: false             |
| phone_number       | string              | null: false             |

## Association

- belongs_to :user
- belongs_to :items
- has_one    :purchase

# purchases table

| Column            | Type               | Options                   |
|--------------------|---------------------|-------------------------|
| user               |references           | foreign_key: true       |
| item               |references           | foreign_key: true       |

## Association
- belongs_to :user
- belongs_to :items
- belongs_to :address