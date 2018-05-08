class AddExtraInfoToHonestbees < ActiveRecord::Migration[5.2]
  def change
    add_column :honestbees, :extraInfo, :string
  end
end
