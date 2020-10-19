class AddAdditionalColumnsTo < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :employee_name, :string
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :phone_number, :string,limit: 15
    add_column :users, :role, :string
  end
end
