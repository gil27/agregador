class AddContactFieldsToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :email, :string
    add_column :ideas, :telefone, :string
    add_column :ideas, :twitter, :string
    add_column :ideas, :facebook, :string
  end
end
