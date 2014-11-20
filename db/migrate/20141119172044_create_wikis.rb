class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, index: true
      t.boolean :private

      t.timestamps null: false
    end
  end
end
