class CreateFriends < ActiveRecord::Migration
  def self.up
    create_table :friends do |t|
      t.integer :user_owner_id
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :friends
  end
end
