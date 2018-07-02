class Corgi < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  belongs_to :user, optional: true
  has_many :line_items

  mount_uploader :image, ImageUploader
  serialize :image, JSON # If you use SQLite, add this line

  validates :name, :size, :price, :color, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum aloud. "}
  validates :name, length: { maximum: 140, too_long: "%{count} characters is the maximum aloud. "}
  validates :price, length: { maximum: 7 }

  SIZE = %w{ Small Medium Large X-Large }
  COLOR = %w{ Black White Navy Blue Red Clear Satin Yellow Seafoam }

  private

  def not_refereced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
end
