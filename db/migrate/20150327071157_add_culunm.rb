class AddCulunm < ActiveRecord::Migration
  def change
    add_column :events, :builddate, :date
    add_column :events, :soldtime, :datetime
  end
end
