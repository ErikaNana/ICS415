class User < ActiveRecord::Base
    #attr_protected :uid, :provider, :name
    has_many :courses
    def self.create_with_omniauth(auth)
        #get the provider and uid key from auth and query the database, and if not there initializes a new user
        #tap returns the new user
        where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
              user.provider = auth.provider
              user.uid = auth.uid
              user.name = auth.info.name
              user.save!
         end
    end
end