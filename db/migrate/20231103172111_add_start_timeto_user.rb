class AddStartTimetoUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :start_time, :datetime
  end
end
