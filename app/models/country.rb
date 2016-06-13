class Country < ActiveRecord::Base
  has_many :holidays
  has_many :days, through: :holidays
  COUNTRIES = ['BE', 'BG', 'BR', 'CA', 'CZ', 'DE', 'ES', 'FR', 'GB', 'GT', 'HR', 'IT', 'NL', 'NO', 'PL', 'SI', 'SK', 'US']
end
