class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|
      t.belongs_to :collaborator, index: true
      t.belongs_to :wiki, index: true

      t.timestamps null: false
    end
  end
end
