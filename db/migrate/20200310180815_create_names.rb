class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.string :date_of_birth
      t.string :nationality
      t.string :shirt_number
      t.string :role

      t.timestamps
    end
  end
end
