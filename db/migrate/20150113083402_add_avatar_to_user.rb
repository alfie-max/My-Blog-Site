class AddAvatarToUser < ActiveRecord::Migration
  def change
    remove_attachment :users, :avatar
    add_column :users, :avatar, :string
  end
end
