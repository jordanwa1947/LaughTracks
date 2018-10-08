class DropComedianId < ActiveRecord::Migration[5.2]
  def change
    remove_column :specials, :comedian_id
  end
end
