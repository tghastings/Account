class Service < ActiveRecord::Base
  attr_accessible :name
  belongs_to :company
end
