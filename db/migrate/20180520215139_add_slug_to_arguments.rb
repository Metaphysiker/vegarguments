class AddSlugToArguments < ActiveRecord::Migration[5.1]
  def change
    add_column :arguments, :slug, :string, unique: true
  end
end
