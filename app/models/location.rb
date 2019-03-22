class Location < ApplicationRecord
  def to_s
    ISO3166::Country[country].name
  end
end
