class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.references :team, foreign_key: true
      t.references :follow, foreign_key: {to_table: :recruits}

      t.timestamps
      
      t.index [:team_id, :follow_id], unique: true   
    end
  end
end
