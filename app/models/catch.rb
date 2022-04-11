class Catch < ApplicationRecord
  belongs_to :profile
  broadcasts_to :profile
end
