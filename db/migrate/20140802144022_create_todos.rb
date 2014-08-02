class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :what
      t.integer :urgency
      t.integer :priority

      t.timestamps
    end
  end
end
