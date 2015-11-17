class User < ActiveRecord::Base
  has_secure_password
  has_many :blocks, dependent: :destroy
  has_many :cards, dependent: :destroy
  belongs_to :current_block, class_name: "Block"

  class << self
    def authenticate(email, password)
      user = find_by_email(email)
      user && user.authenticate(password)
    end
  end

  def cards_for_review
    if current_block.nil?
      cards_from_any_block
    else
      cards_from_current_block
    end
  end

  private

  def cards_from_current_block
    current_block.cards.pending || current_block.cards.repeating
  end

  def cards_from_any_block
    cards.pending || cards.repeating
  end
end
