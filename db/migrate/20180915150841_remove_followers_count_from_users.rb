class RemoveFollowersCountFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :followers_count, :integer
  end
end
