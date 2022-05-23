class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :teacher
      t.string :branch
      t.string :level
      t.string :frequency
      t.text :comments
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
