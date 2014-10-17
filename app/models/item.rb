# -*- encoding : utf-8 -*-
class Item < ActiveRecord::Base
  mount_uploader :logo, LogoUploader
  has_many :comments
  has_many :scores
  belongs_to :landing_picture
end
