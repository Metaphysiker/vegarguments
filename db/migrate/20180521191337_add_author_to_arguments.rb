class AddAuthorToArguments < ActiveRecord::Migration[5.1]
  def change
    add_column :arguments, :author, :string, default: ""
  end
end
