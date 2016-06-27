class AddSysadminToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :sysadmin, :boolean
  end
end
