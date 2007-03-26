class Vendor < ActiveRecord::Base
  has_many  :devices
  validates_uniqueness_of :name
end