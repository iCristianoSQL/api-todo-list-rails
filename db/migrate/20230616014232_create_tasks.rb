class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :user, null: false, limit: 11
      t.string :photo
      t.boolean :finished, default: false
      t.string :title, null: false, limit: 8
      t.text :description, null: false, limit: 255

      t.timestamps
    end
  end
end