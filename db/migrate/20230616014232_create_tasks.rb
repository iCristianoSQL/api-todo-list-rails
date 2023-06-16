class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :user
      t.string :photo
      t.boolean :finished
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
