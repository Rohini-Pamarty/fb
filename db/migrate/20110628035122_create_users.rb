class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :city
      t.string :sex
      t.date :birthday
      t.text :abount_me
      t.string :email_id
      t.string :phone_no
      t.date :last_login
      t.integer :page_views
      t.boolean :conditions
      t.string :email_id_confirmation
      t.string :domain
      t.integer :age
      t.integer :card_number
      t.string :payment_type
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
