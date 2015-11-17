class Card < ActiveRecord::Base
  belongs_to :block
  belongs_to :user
  before_validation :set_review_date_as_now, on: :create
  validates :user_id, presence: true
  validates :original_text,
            :translated_text,
            :review_date,
            presence: { message: "Необходимо заполнить поле." }
  validates :user_id, presence: { message: "Ошибка ассоциации." }
  validates :block_id,
            presence: { message: "Выберите колоду из выпадающего списка." }
  validate :texts_are_not_equal

  scope :pending, 
        lambda { where("review_date <= ?", Time.now.rfc3339).order("RANDOM()") }
  scope :repeating, -> { where("quality < ?", 4).order("RANDOM()") }

  protected

  def set_review_date_as_now
    self.review_date = Time.now.rfc3339
  end

  def texts_are_not_equal
    if full_downcase(original_text) == full_downcase(translated_text)
      errors.add(:original_text, "Вводимые значения должны отличаться.")
    end
  end

  def full_downcase(str)
    str.mb_chars.downcase.to_s.squeeze(" ").lstrip
  end
end
