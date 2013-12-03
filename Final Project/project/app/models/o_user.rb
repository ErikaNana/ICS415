class OUser < ActiveRecord::Base
    attr_accessible :name
    attr_accessible :email
    attr_accessible :password
end
