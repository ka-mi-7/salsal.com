class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :leader_name, null: false
      t.string :phone_number, null: false
      t.string :email, null: false
      t.integer :level_type, null: false
      t.string :password_digest, null: false
      t.string :image

      t.timestamps
    end
  end
end
