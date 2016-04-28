class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('missing.png')
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
