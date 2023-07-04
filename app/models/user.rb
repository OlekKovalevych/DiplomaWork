# frozen_string_literal: true

class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User

  NAME_REGEX = /\A((\s*)([\p{L}|a-z|A-Z]+))+(([',. -]((\s*)([\p{L}|a-z|A-Z]+))+)?((\s*)([\p{L}|a-z|A-Z]+))*)*\z/

  devise :invitable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, invite_for: 30.days

  validates :first_name, presence: true, format: { with: NAME_REGEX }
  validates :last_name, presence: true, format: { with: NAME_REGEX }
  validates :email, presence: true
end
