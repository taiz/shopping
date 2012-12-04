class CreateDudads < ActiveRecord::Migration
  def change
    create_table :dudads do |t|
      t.string :name

      t.timestamps
    end
  end
end
