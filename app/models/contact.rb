class Contact < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true
  validates :contact_number, presence: true
  validates :subject, presence: true
  validates :message, presence: true


end
