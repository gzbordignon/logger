class Log < ApplicationRecord
  belongs_to :cond
  belongs_to :tech
  belongs_to :user
end
