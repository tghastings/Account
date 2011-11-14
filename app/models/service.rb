class Service < ActiveRecord::Base
  attr_accessible :name, :company_id
  belongs_to :company
end
