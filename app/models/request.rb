class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :request, :class_name => "User"
end
