# todo_app information

This application is a simple task management tool made of Ruby on Rails.
User can be useful to create simple task, project, and work with deadline and categories.
You also get notifications to your slack channel that you take part in.

## Environments:

  * Ruby: 2.6.5
  * Ruby on Rails: 6.0.3.4
  * Nodejs: v14.14.0
  * Yarn: 1.22.10
  * MySQL: 5.6.51
  * Markup: HTML5 / CSS3
  * Frontend: Javascript
  * Test: RSpec, FactoryBot, Capybara
<<<<<<< HEAD
  * Others: slack-notifier(Gem), bcrypt(Gem), acts-as-taggable-on(Gem)

## Database Design

### users table

| Column             | Type                | Options                    |
|--------------------|---------------------|----------------------------|
| name               | string              | null: false, unique: true  |
| email              | string              | null: false, unique: true  |
| password_digest    | string              | null: false                |

#### Association

- has_many :tasks, dependent: :destroy

### tasks table

| Column             | Type                | Options                    |
|--------------------|---------------------|----------------------------|
| name               | string              | null: false                |
| content            | string              | null: false                |
| deadline           | datetime            | null: false                |
| finished           | boolean             | null: false                |
| user_id            | integer             | foreign_key: true          |
| task_id            | integer             | foreign_key: true          |


#### Association

- belongs_to :user
- belongs_to :project

### projects table

| Column             | Type                | Options                         |
|--------------------|---------------------|---------------------------------|
| name               | string              | null: false, unique: true       |

#### Association

- has_many :tasks
=======
  * Others: slack-notifier(Gem), active_hash(Gem)
>>>>>>> 4cc9564... setting config and edit Gemfile

