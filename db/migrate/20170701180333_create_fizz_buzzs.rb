class CreateFizzBuzzs < ActiveRecord::Migration[5.0]
  def change
    create_table :fizz_buzzs do |t|
      t.bigint :number, index: true
      t.boolean :favourite, default: false

      t.timestamps
    end
  end
end
