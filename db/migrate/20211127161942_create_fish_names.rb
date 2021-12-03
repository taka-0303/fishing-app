class CreateFishNames < ActiveRecord::Migration[6.0]
  def change
    create_table :fish_names do |t|
      t.string     :fish_kind, null: false
      t.references :user,      null: false, foreign_key: true

      t.timestamps
    end
  end
end
