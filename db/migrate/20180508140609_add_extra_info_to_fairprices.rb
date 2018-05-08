class AddExtraInfoToFairprices < ActiveRecord::Migration[5.2]
  def change
    add_column :fairprices, :extraInfo, :string
  end
end
