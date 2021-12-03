class CreateFishInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :fish_infos do |t|
      t.date       :day,        null: false
      t.string     :fish_size,  null: false
      t.string     :fish_num,   null: false
      t.text       :memo,       null: false
      t.references :fish_name,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
