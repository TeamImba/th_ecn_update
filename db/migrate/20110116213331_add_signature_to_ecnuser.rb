class AddSignatureToEcnuser < ActiveRecord::Migration
  def self.up
    add_column :ecnusers, :signature_file_name, :string
    add_column :ecnusers, :signature_content_type, :string
    add_column :ecnusers, :signature_file_size, :integer
  end

  def self.down
    remove_column :ecnusers, :signature_file_size
    remove_column :ecnusers, :signature_content_type
    remove_column :ecnusers, :signature_file_name
  end
end
