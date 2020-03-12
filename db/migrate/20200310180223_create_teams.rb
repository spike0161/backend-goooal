class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :full_name
      t.string :short_name
      t.string :tla
      t.string :crestUrl
      t.string :address
      t.string :phone
      t.string :website
      t.string :email
      t.string :founded
      t.string :club_colors
      t.string :venue

      t.timestamps
    end
  end
end
