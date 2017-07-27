class CreateGoggles < ActiveRecord::Migration[5.1]
  def change
    create_table :goggles do |t|

      t.timestamps
    end
  end
end
