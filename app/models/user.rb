# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "40x40>" },
                    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar,
           :content_type => ["image/jpeg", "image/gif", "image/png", "image/jpg" ]

  # def user_params
  #   params.require(:user).permit(:avatar)
  # end
end
