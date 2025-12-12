class CreateDocuments < ActiveRecord::Migration[7.2]
  def change
    create_table :documents do |t|
      t.string :title
      t.string :article_about
      t.text :article
      t.string :article_tag

      t.timestamps
    end
  end
end
