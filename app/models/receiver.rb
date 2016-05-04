class Receiver < ActiveRecord::Base
  belongs_to :user
  belongs_to :receive, :class_name => "User"
end
