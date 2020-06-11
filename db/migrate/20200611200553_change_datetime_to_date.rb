class ChangeDatetimeToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :created_at, :date
  end
end
