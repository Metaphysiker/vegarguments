class AddUrlsToArguments < ActiveRecord::Migration[5.1]
  def change
    add_column :arguments, :urls, :string, array: true, default: []
  end
end
