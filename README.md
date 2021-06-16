# DB 設計

# users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |

## Association
 * has_many :items
 * has_one  :address
 * has_many :purchase

 ## items table

| Column            | Type               | Options                   |
|--------------------|---------------------|-------------------------|
| produsname         | string              | null: false             |
| price              | string              | null: false             |
| text               | string              | null: false             |
| user               |references           | foreign_key: true       |
|image               |references           | foreign_key: true       |

## Association

- belongs_to :user
- has_one    :address
- has_one    :purchase

## address table

| Column            | Type               | Options                   |
|--------------------|---------------------|-------------------------|
| postcode           | string              | null: false             |
|prefecture_id       | string              | null: false             |
| block              | string              | null: false             |
| city               | string              | null: false             |

## Association

- belongs_to :user
- belongs_to :items
- has_one    :purchase

# purchase table

| Column            | Type               | Options                   |
|--------------------|---------------------|-------------------------|
| user_id            |references           | foreign_key: true       |