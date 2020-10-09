class CreateTestDbModels < ActiveRecord::Migration[6.0]
  def change
    create_table :test_db_models do |t|
      t.string 'Name'
      t.timestamps
    end
  end
end
