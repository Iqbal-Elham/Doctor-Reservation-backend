class ChangeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :appointment_time, :time
    add_column :reservations, :appointment_date, :date
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
