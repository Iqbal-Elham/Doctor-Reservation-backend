class ChangePatientColumn < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :user, foreign_key: true
    remove_column :reservations, :patient_id
  end
end
