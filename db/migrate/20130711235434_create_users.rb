class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :name
      t.timestamps
    end
    User.create(name: "RT")
    User.create(name: "PG")
    User.create(name: "BS")
    User.create(name: "JH")
  end

  def down
    drop_table :users
  end
end
