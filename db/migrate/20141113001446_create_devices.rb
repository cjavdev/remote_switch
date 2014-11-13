class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.belongs_to :user, index: true
      t.string :name

      t.timestamps
    end
  end
end
