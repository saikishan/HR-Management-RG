class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t| 
      t.string :name
      t.string :desigination
      t.integer :age
      t.date :date_of_joining
      t.belongs_to :team, foreign_key: true 
      t.timestamps
    end
  end
end
