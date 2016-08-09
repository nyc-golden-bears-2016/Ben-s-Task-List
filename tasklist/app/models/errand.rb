class Errand < ApplicationRecord
  belongs_to :user
  validates :description, presence: true

  def toggle_completeness
    self.toggle!(:completed)
  end
end
