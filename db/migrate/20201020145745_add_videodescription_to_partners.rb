class AddVideodescriptionToPartners < ActiveRecord::Migration[6.0]
  def change
    add_column :partners, :videodescription, :text
  end
end
