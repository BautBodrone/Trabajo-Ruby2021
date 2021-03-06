class Appointment < ApplicationRecord
  paginates_per 10
  validates :name, presence: true
  validates :name, format: {
    with: /\A[a-zA-Z]+\z/,
    message: 'Only allows letters'
  }
  validates :surname, presence: true
  validates :surname, format: {
    with: /\A[a-zA-Z]+\z/,
    message: 'Only allows letters'
  }
  validates :phone, presence: true, length: { in: 6..6 }, numericality: true
  validates :phone,
           numericality: { only_integer: true }
  validates :date, presence: true
  validates :date, uniqueness: { scope: :professional }
  belongs_to :professional
end
