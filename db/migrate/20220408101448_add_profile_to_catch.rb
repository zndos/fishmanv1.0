class AddProfileToCatch < ActiveRecord::Migration[7.0]
  def change
    add_reference :catches, :profile, index: true
  end
end
