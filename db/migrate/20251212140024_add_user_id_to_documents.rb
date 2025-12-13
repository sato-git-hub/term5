class AddUserIdToDocuments < ActiveRecord::Migration[7.2]
  def change
    add_reference :documents, :user, foreign_key: true
  end
end
