class ChangeFriends < ActiveRecord::Migration
  def self.up
	execute "ALTER TABLE friends ADD FOREIGN KEY (user_owner_id) references users(id);"
  end

  def self.down
  end
end
