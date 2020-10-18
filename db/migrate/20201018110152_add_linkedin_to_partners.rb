class AddLinkedinToPartners < ActiveRecord::Migration[6.0]
  def change
    add_column :partners, :linkedin, :string
  end
end
