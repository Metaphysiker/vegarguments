class AddArgumentReferenceToArguments < ActiveRecord::Migration[5.1]
  def change
    add_reference :arguments, :argument, foreign_key: true
  end
end
