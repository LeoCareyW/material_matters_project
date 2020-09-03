class AddRoleToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :role, :string
  end
end
