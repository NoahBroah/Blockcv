class AddVerifiedToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :verified, :boolean, default: false
  end
end
