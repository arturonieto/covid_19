class Country < ApplicationRecord
has_many :regions
has_many :suburbs, :through => :regions
end
