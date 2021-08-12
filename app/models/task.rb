class Task < ApplicationRecord
  belongs_to :user

  after_initialize do
    self.status ||= false
  end
end
