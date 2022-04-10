class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  after_create :create_profile
  has_one :profile

  private

  def create_profile
    profile = Profile.new
    profile.user_id = id
    profile.save
  end
end
