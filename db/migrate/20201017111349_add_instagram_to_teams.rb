class AddInstagramToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :instagram, :string
  end
end
