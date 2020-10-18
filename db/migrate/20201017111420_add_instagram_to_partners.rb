class AddInstagramToPartners < ActiveRecord::Migration[6.0]
  def change
    add_column :partners, :instagram, :string
  end
end
