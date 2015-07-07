class AddStateToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :state, :string, :default => 'Pending'
  end
end
