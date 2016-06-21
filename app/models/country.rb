class Country < ActiveRecord::Base
  has_many :holidays
  has_many :days, through: :holidays
  COUNTRIES_HASH = { 'BE' => 'Belgium', 'BG' => 'Bulgaria', 'BR' => 'Brazil', 'CA' => 'Canada',
                   'CZ' => 'Czech Republic', 'DE' => 'Germany', 'ES' => 'Spain', 'FR' => 'France',
                   'GB' => 'Great Britain', 'GT' => 'Guatemala', 'HR' => 'Croatia', 'IT' => 'Italy',
                   'NL' => 'Netherlands', 'NO' => 'Norway', 'PL' => 'Poland', 'SI' => 'Slovenia', 
                   'SK' => 'Slovakia', 'US' => 'United States' }
  COUNTRIES_ABBRV = COUNTRIES_HASH.keys
end
