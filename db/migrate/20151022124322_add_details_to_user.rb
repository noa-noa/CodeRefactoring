class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :introduction, :text
    add_column :users, :speed_score, :integer, :default => 0
    add_column :users, :readable_score, :integer, :default => 0
    add_column :users, :row_score, :integer, :default => 0
    add_column :users, :recyclable_score, :integer, :default => 0
    add_column :users, :total, :integer, :default => 0
  end
end
