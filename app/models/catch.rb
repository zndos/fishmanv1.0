class Catch < ApplicationRecord
  belongs_to :profile

  # validates :name, :weight, presence: true
  # validate :datepast


  def datepast
    if date and (date > Date.today)
      errors.add(:date, "date must be past")
    end
  end
end
