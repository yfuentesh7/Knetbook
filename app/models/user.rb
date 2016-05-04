class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  validates :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('missing.png')
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_attached_file :header, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('missing.png')
  validates_attachment_content_type :header, :content_type => /\Aimage\/.*\Z/

  acts_as_liker
  has_many :friendships
  has_many :friends, :through => :friendships,
           :source => :friend

  has_many :receivers
  has_many :receiver, :through => :receivers,
           :source => :receive

  has_many :requests
  has_many :request, :through => :requests,
           :source => :request

  # def is_friends(id)
  #   self.friendships.each do |friend|
  #     if friend.friend_id == id && friend.accepted == true
  #       return 1
  #     end
  #     if friend.friend_id == id && friend.accepted == false
  #       return 0
  #     end
  #   end
  #   return -1
  # end

end
