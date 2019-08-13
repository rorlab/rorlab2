class Rblog < ApplicationRecord
  belongs_to :writer, class_name: 'User'

  def image_urls
    content.scan(%r{(http(?:s?):\/\/.*?\.(?:jpeg|jpg|gif|png))}).flatten
  end

  def random_image_url
    image_urls.sample
  end
end
