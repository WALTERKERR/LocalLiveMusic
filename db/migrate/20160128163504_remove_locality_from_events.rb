class RemoveLocalityFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :locality, :string
  end
end
