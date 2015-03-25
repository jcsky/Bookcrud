class CreateBookstores < ActiveRecord::Migration
  def change
    create_table :bookstores do |t|
      t.string :name
      t.integer :isbn
      t.text :description

      t.timestamps null: false
    end
  end
end
