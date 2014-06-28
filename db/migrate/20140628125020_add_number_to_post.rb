class AddNumberToPost < ActiveRecord::Migration
  def change
    add_column :posts, :number, :integer, default: 0
  end
end
