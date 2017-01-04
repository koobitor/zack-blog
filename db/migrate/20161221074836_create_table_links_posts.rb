class CreateTableLinksPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :links_posts, id: false do |t|
      t.integer :link_id, index: true
      t.integer :post_id, index: true
    end
  end
end
