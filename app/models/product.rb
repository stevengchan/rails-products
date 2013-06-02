class Product < ActiveRecord::Base
	validates :name, :description, :pricing, :presence => true
	validates :pricing, :numericality => true
end
