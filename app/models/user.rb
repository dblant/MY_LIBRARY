class User < ActiveRecord::Base
    validates_uniqueness_of :username, case_sensitive: false
    validates_presence_of :username
    has_secure_password
    has_many :books

end