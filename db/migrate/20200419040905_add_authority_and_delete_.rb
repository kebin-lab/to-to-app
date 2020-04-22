class AddAuthorityAndDelete < ActiveRecord::Migration[5.2]
  def change
    add_column :users ,:authority ,:integer
    remove_column :tasks , :authority
  end
end
