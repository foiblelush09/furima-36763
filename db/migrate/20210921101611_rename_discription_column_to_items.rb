class RenameDiscriptionColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :discription, :description
  end
end
