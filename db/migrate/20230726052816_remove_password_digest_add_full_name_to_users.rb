class RemovePasswordDigestAddFullNameToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :password_digest, :string
    add_column :users, :full_name, :string
  end
end
