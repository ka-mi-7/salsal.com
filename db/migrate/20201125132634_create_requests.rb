class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.integer :team_id, null: false
      t.integer :recruit_id, null: false
      t.integer :status, null: false, default: 0
  
      t.timestamps
      
      t.index :team_id
      t.index :recruit_id
    end
  end
end
