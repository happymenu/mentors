# -*- encoding : utf-8 -*-
class LandingPicture < ActiveRecord::Base
  mount_uploader :logo, LogoUploader
end
