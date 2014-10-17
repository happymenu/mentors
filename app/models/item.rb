# -*- encoding : utf-8 -*-
class Item < ActiveRecord::Base
  mount_uploader :logo, LogoUploader
end
