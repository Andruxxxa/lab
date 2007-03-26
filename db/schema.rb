# This file is autogenerated. Instead of editing this file, please use the
# migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.

ActiveRecord::Schema.define(:version => 6) do

  create_table "devices", :force => true do |t|
    t.column "name", :string, :default => "", :null => false
    t.column "partnumber", :string, :default => "", :null => false
    t.column "serialnumber", :string
    t.column "labnumber", :string, :default => "", :null => false
    t.column "device_id", :integer
    t.column "vendor_id", :integer, :default => 0, :null => false
    t.column "location", :string
    t.column "box_location", :string
    t.column "reservation_id", :integer
    t.column "comment", :text
    t.column "serving_properties_id", :integer
  end

  add_index "devices", ["device_id"], :name => "fk_device_device"
  add_index "devices", ["vendor_id"], :name => "fk_device_vendor"
  add_index "devices", ["reservation_id"], :name => "fk_device_reservation"
  add_index "devices", ["serving_properties_id"], :name => "fk_device_serving_properties"

  create_table "engineers", :force => true do |t|
    t.column "first", :string
    t.column "last", :string
    t.column "middle", :string
    t.column "work_phone", :string
    t.column "cell_phone", :string
    t.column "email", :string
  end

  create_table "groups", :force => true do |t|
    t.column "created_at", :timestamp, :null => false
    t.column "updated_at", :timestamp, :null => false
    t.column "title", :string, :limit => 200, :default => "", :null => false
    t.column "parent_id", :integer, :limit => 10
  end

  add_index "groups", ["parent_id"], :name => "groups_parent_id_index"

  create_table "groups_roles", :id => false, :force => true do |t|
    t.column "group_id", :integer, :limit => 10, :default => 0, :null => false
    t.column "role_id", :integer, :limit => 10, :default => 0, :null => false
    t.column "created_at", :timestamp, :null => false
  end

  add_index "groups_roles", ["group_id", "role_id"], :name => "groups_roles_all_index", :unique => true
  add_index "groups_roles", ["role_id"], :name => "role_id"

  create_table "groups_users", :id => false, :force => true do |t|
    t.column "group_id", :integer, :limit => 10, :default => 0, :null => false
    t.column "user_id", :integer, :limit => 10, :default => 0, :null => false
    t.column "created_at", :timestamp, :null => false
  end

  add_index "groups_users", ["group_id", "user_id"], :name => "groups_users_all_index", :unique => true
  add_index "groups_users", ["user_id"], :name => "user_id"

  create_table "interface_types", :force => true do |t|
    t.column "name", :string, :default => "", :null => false
  end

  create_table "interfaces", :force => true do |t|
    t.column "name", :string, :default => "", :null => false
    t.column "interface_type_id", :integer, :default => 0, :null => false
    t.column "device_id", :integer, :default => 0, :null => false
    t.column "interface_id", :integer
  end

  add_index "interfaces", ["interface_type_id"], :name => "fk_interface_interface_type"
  add_index "interfaces", ["device_id"], :name => "fk_interface_device"
  add_index "interfaces", ["interface_id"], :name => "fk_interface_interface"

  create_table "reservations", :force => true do |t|
    t.column "start", :date
    t.column "end", :date
    t.column "comment", :text
    t.column "engineer_id", :integer
  end

  add_index "reservations", ["engineer_id"], :name => "fk_erservation_engineer"

  create_table "roles", :force => true do |t|
    t.column "created_at", :timestamp, :null => false
    t.column "updated_at", :timestamp, :null => false
    t.column "title", :string, :limit => 100, :default => "", :null => false
    t.column "parent_id", :integer, :limit => 10
  end

  add_index "roles", ["parent_id"], :name => "roles_parent_id_index"

  create_table "roles_static_permissions", :id => false, :force => true do |t|
    t.column "role_id", :integer, :limit => 10, :default => 0, :null => false
    t.column "static_permission_id", :integer, :limit => 10, :default => 0, :null => false
    t.column "created_at", :timestamp, :null => false
  end

  add_index "roles_static_permissions", ["static_permission_id", "role_id"], :name => "roles_static_permissions_all_index", :unique => true
  add_index "roles_static_permissions", ["role_id"], :name => "role_id"

  create_table "roles_users", :id => false, :force => true do |t|
    t.column "user_id", :integer, :limit => 10, :default => 0, :null => false
    t.column "role_id", :integer, :limit => 10, :default => 0, :null => false
    t.column "created_at", :timestamp, :null => false
  end

  add_index "roles_users", ["user_id", "role_id"], :name => "roles_users_all_index", :unique => true
  add_index "roles_users", ["role_id"], :name => "role_id"

  create_table "serving_properties", :force => true do |t|
    t.column "device_id", :integer
    t.column "cpu_count", :integer
    t.column "cpu_type", :string
    t.column "ram", :integer
    t.column "disks_total", :integer
    t.column "disks_layout", :string
    t.column "os", :string
    t.column "admin_login", :string
    t.column "admin_pass", :string
  end

  create_table "static_permissions", :force => true do |t|
    t.column "title", :string, :limit => 200, :default => "", :null => false
    t.column "created_at", :timestamp, :null => false
    t.column "updated_at", :timestamp, :null => false
  end

  add_index "static_permissions", ["title"], :name => "static_permissions_title_index", :unique => true

  create_table "user_registrations", :force => true do |t|
    t.column "user_id", :integer, :limit => 10, :default => 0, :null => false
    t.column "token", :text, :default => "", :null => false
    t.column "created_at", :timestamp, :null => false
    t.column "expires_at", :timestamp, :null => false
  end

  add_index "user_registrations", ["user_id"], :name => "user_registrations_user_id_index", :unique => true
  add_index "user_registrations", ["expires_at"], :name => "user_registrations_expires_at_index"

  create_table "users", :force => true do |t|
    t.column "created_at", :timestamp, :null => false
    t.column "updated_at", :timestamp, :null => false
    t.column "last_logged_in_at", :timestamp, :null => false
    t.column "login_failure_count", :integer, :limit => 10, :default => 0, :null => false
    t.column "login", :string, :limit => 100, :default => "", :null => false
    t.column "email", :string, :limit => 200, :default => "", :null => false
    t.column "password", :string, :limit => 100, :default => "", :null => false
    t.column "password_hash_type", :string, :limit => 20, :default => "", :null => false
    t.column "password_salt", :string, :limit => 10, :default => "1234512345", :null => false
    t.column "state", :integer, :limit => 10, :default => 1, :null => false
  end

  add_index "users", ["login"], :name => "users_login_index", :unique => true
  add_index "users", ["password"], :name => "users_password_index"

  create_table "vendors", :force => true do |t|
    t.column "name", :string, :default => "", :null => false
  end

end