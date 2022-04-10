class Profile < ApplicationRecord
  belongs_to :user
  has_many :catches

  def to_s
    "#{lastname} #{name}"
  end
end
