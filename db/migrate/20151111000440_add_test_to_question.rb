class AddTestToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :test, :string
  end
end
