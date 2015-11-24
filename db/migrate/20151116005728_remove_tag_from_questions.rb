class RemoveTagFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :tag, :string
  end
end
