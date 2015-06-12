class Sound < ActiveRecord::Base
  has_attached_file :soundfile, :styles => {}
  validates_attachment_content_type :soundfile, :content_type => /\Aaudio\/(mp3|wav|aac|x-m4a)\Z/
end
