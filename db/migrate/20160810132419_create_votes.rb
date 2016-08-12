class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer  :user_id
      t.references :voteable, polymorphic: true
      t.integer  :value, default: 0

      t.timestamps(null: false)
    end
  end
end
