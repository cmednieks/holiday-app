class Holiday < ActiveRecord::Base
  has_many :occurrences
  validates :name, presence: true
  validates :country, presence: true
  
  COUNTRIES_HASH = { 'BE' => 'Belgium', 'BG' => 'Bulgaria', 'BR' => 'Brazil', 'CA' => 'Canada',
                   'CZ' => 'Czech Republic', 'DE' => 'Germany', 'ES' => 'Spain', 'FR' => 'France',
                   'GB' => 'Great Britain', 'GT' => 'Guatemala', 'HR' => 'Croatia', 'IT' => 'Italy',
                   'NL' => 'Netherlands', 'NO' => 'Norway', 'PL' => 'Poland', 'SI' => 'Slovenia', 
                   'SK' => 'Slovakia', 'US' => 'United States' }
end
