class ChangeCompanyIDtoInt < ActiveRecord::Migration
  def up
    change_column :users, :company_id, :integer 
  end

  def down
  end
end