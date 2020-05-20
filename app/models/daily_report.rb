class DailyReport < ApplicationRecord
  belongs_to :country
  belongs_to :region
  belongs_to :suburb
end
