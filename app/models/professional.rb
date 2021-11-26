class Professional < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :name, format: {
    with: /\A[a-zA-Z]+\z/,
    message: 'Only allows letters'
  }
  has_many :appointments,dependent: :destroy
end
