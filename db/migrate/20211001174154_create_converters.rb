class CreateConverters < ActiveRecord::Migration[6.1]
  def change
    create_table :converters do |t|

      t.timestamps
    end
  end
end
