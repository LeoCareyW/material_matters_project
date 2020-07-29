class CreateGatherings < ActiveRecord::Migration[6.0]
  def change
    create_table :gatherings do |t|
      t.string :title
      t.string :category
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
