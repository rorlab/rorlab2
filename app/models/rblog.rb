class Rblog < ApplicationRecord
  belongs_to :writer, class_name: 'User'

  def poster_image_url
    image_urls = content.match(%r{(http(?:s?):\/\/.*?\.(?:jpeg|jpg|gif|png))}).to_a
    image_urls.size.positive? ? image_urls.first : nil
  end
end
