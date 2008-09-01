class CreateInterestForms < ActiveRecord::Migration
  def self.up
    create_table :interest_forms do |t|
      t.string :email, :ip, :user_agent
      t.timestamps 
    end
  end

  def self.down
    drop_table :interest_forms
  end
end
