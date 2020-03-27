class DropFollowingRelationship < ActiveRecord::Migration[6.0]
  def change
        drop_table :following_relationships
  end
end
