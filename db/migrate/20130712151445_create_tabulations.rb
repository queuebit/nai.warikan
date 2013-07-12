class CreateTabulations < ActiveRecord::Migration
  def up
    create_table "tabulations" do |t|
      t.integer "user_id"
      t.integer "guest_id"
      t.timestamps
    end
    Tabulation.create(user_id: 1, guest_id: 2)
    Tabulation.create(user_id: 2, guest_id: 1)
    Tabulation.create(user_id: 1, guest_id: 2)
  end

  def down
    drop_table :tabulations
  end
end
