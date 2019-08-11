class Rblog < ApplicationRecord
  belongs_to :writer, class_name: 'User'
end
