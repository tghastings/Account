class Company < ActiveRecord::Base
  attr_accessible :name, :phone
  has_many :services, :dependent => :destroy
  has_many :users, :dependent => :destroy
end
