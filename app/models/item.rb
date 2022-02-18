require 'open-uri'
class Item < ApplicationRecord
  before_validation :geocode_location_url

  def geocode_location_url
    if self.location_url.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.location_url)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_url_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_url_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_url_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_base64_uploader :image, ImageUploader

  # Direct associations

  belongs_to :category

  has_many   :purchases,
             :dependent => :destroy

  has_many   :comments,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end

end
