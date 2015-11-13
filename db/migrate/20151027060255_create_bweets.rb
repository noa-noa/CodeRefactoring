class CreateBweets < ActiveRecord::Migration
  def change
    create_table :bweets do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
