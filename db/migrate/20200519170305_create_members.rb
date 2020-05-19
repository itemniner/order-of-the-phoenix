class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :role
      t.string :house
      t.string :patronus

      t.timestamps
    end
  end
end
