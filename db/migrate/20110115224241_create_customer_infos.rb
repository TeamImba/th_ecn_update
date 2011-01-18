class CreateCustomerInfos < ActiveRecord::Migration
  def self.up
    create_table :customer_infos do |t|
      t.string :cust_id, :default => "", :limit => 30
      t.string :th_pn, :default => "", :limit => 30

      t.timestamps
    end
  end

  def self.down
    drop_table :customer_infos
  end
end
