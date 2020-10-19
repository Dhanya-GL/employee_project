class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :status
      t.references :user, foreign_key: true
      t.integer :project_lead_id
      t.timestamps
    end
  end
end
