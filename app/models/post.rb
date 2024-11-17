class Post < ApplicationRecord
  before_validation :strip_whitespace, :only => [:name, :address, :message]

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :message

  private

  def strip_whitespace
    self.name = self.name.strip unless self.name.nil?
    self.address = self.address.strip unless self.address.nil?
    self.message = self.message.strip unless self.message.nil?
  end
end
