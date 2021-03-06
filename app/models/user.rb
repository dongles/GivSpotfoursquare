class User < ActiveRecord::Base
  validates :access_token, :presence => true
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.access_token = auth['credentials']['token']
    end
  end
end
