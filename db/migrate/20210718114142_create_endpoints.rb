class CreateEndpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :endpoints do |t|
      t.string :infoType
      t.string :path
      t.string :verb
      t.integer :code
      t.json :headers
      t.string :body

      t.timestamps
    end
    add_index :endpoints, :path
    add_index :endpoints, :verb
    add_index :endpoints, [:path, :verb], unique: true
  end
end
