class AddStatusToChores < ActiveRecord::Migration[7.0]
  def change
    add_column :chores, :status, :string
  end
end
