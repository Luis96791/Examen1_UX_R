class CreateRecordings < ActiveRecord::Migration[5.1]
  def change
    create_table :recordings do |t|
      #t.reference :location
      t.integer :temp
      t.string :status

      t.references :location, foreign_key: true

      t.timestamps
      
    end
  end
end
