class CreateFootprints < ActiveRecord::Migration[5.1]
  def change
    create_table :footprints do |t|
      t.text :before
      t.text :after
      t.string :action
      t.references :trackable, polymorphic: true
      t.references :actorable, polymorphic: true

      t.timestamps
    end
  end
end
