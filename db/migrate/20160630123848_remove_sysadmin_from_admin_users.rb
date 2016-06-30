class RemoveSysadminFromAdminUsers < ActiveRecord::Migration
  def change
    remove_column :admin_users, :sysadmin, :boolean
  end
end
