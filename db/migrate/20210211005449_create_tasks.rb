class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string    :name,                null: false
      t.string    :content,             null: false
      t.datetime  :deadline,            null: false
      t.boolean   :finished,            null: false, default: false
      t.timestamps
    end
  end
end
