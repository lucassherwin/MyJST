class User < ApplicationRecord
  has_many :jobs
  has_manhy :tasks
end
