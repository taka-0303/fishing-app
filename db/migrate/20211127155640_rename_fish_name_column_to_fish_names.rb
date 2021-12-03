class RenameFishNameColumnToFishNames < ActiveRecord::Migration[6.0]
  def change
    rename_column :fish_names, :fish_name, :fish_kind
  end
end
