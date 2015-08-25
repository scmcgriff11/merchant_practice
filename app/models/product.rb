class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand
  
  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "100x100#" }, default_url: "/:style_missing.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
end

