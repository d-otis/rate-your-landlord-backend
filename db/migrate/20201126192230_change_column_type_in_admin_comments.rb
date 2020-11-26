class ChangeColumnTypeInAdminComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :active_admin_comments, :resource_id, type=:bigint
    add_column :active_admin_comments, :resource_id, :uuid
    add_index :active_admin_comments, [:resource_type, :resource_id], name: 'index_active_admin_comments_on_resource_type_and_resource_id'
    
    remove_column :active_admin_comments, :author_id, type=:bigint
    add_column :active_admin_comments, :author_id, :uuid
    add_index :active_admin_comments, [:author_type, :author_id], name: 'index_active_admin_comments_on_author_type_and_author_id'
  end
end
