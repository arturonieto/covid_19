class Region < ApplicationRecord
  belongs_to :country
  has_many :suburbs
  has_many :daily_reports
end
