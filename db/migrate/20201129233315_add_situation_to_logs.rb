class AddSituationToLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :logs, :situation, :boolean, default: false
  end
end
