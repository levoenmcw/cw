class AddUserFb < ActiveRecord::Migration
  def change

add_column :users, :provider, :string
add_column :users, :fb_uid, :string
add_column :users, :fb_name, :string
add_column :users, :oath_token, :string
add_column :users, :oath_expires_at, :datetime


  end
end
