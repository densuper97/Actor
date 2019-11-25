class Actor < ApplicationRecord
  belongs_to :user
  has_many :country, through: :citizenships
  has_many :visas
  mount_uploaders :photos, PhotoUploader
  mount_uploaders :videos, VideoUploader
  serialize :photos, JSON
  serialize :videos, JSON

  def append_videos(actor_params)                          
    appended_videos = actor_params[:videos].map do |video|
      uploader = VideoUploader.new(self)             
      uploader.store! video                              
      uploader
    end
    self.videos = self.videos + appended_videos          
  end

  def append_photos(actor_params)
    appended_photos = actor_params[:photos].map do |photo|
      uploader = PhotoUploader.new(self)
      uploader.store! photo
      uploader
    end
    self.photos = self.photos + appended_photos
  end

  def full_name
    [last_name, first_name, middle_name].join(" ")
  end

  def simple_full_name
    [first_name, last_name].join(" ")
  end

  def parse_name(name)
    self.last_name, self.first_name, self.middle_name = name.split(" ")
  end

  def is_confirmed?
    self.confirmed == 'Y' ? true : false
  end

  def is_confirming?
    self.confirmed == 'P' ? true : false
  end

  def confirm_status
    self.is_confirming? ? :confirming : (self.is_confirmed? ? :confirmed : :unconfirmed)
  end

  def email
    User.find(self.user_id).email
  end

  

    #def set_success(format, opts)
    #  self.success = true
    #end
end
