class User < ActiveRecord::Base

  has_paper_trail  class_name: 'PapertrailTable'

  self.table_name = "users"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable,  and :omniauthable , :timeoutable
#    devise :ldap_authenticatable,
  #devise :database_authenticatable,
#     :trackable
         #:validatable, :recoverable, :registerable, :rememberable,

  # if running on pmds then use ldap_authenticatable
  #
  # no.. puts " #{`config.database_configuration[RAILS_ENV]["host"]`} "
  puts " #{Rails.configuration.database_configuration[Rails.env]["host"]} "

  # works outside of docker.. if `hostname`.strip =~ /pmds/i then
  if Rails.configuration.database_configuration[Rails.env]["host"] =~ /10.4.1.224/i then
  #     puts 'v2'
    # Include default devise modules. Others available are:
    # :confirmable,  and :omniauthable , :timeoutable, :validatable, :rememberable, :lockable, :registerable, :recoverable
    devise :ldap_authenticatable,
      :trackable
    puts " #{Rails.configuration.database_configuration[Rails.env]["host"]}: ____________ldap-auth  "
  elsif
    devise :database_authenticatable,
      :trackable
    puts " hostname: #{`hostname`.strip}, dbhost : #{Rails.configuration.database_configuration[Rails.env]["host"]} ____________database-auth-notldap"

  end

  #validates :email, presence: true, uniqueness: true, email: true
  validates :email, presence: true, uniqueness: true

  # has_many :surveys, dependent: :destroy


  def to_s
    # show columns contents, not record object like: 	#<Vehicle:0x007f343b3f2890>	2016-06-08
    "#{email},#{name}"
  end

  # validates_presence_of :name
  before_save :assign_role


  def assign_role
    self.role = Role.find_by name: "lr_minimal" if self.role.nil?
  end

  def lr_admin?
    self.role.name == "lr_admin"
  end

  def lr_minimal?
    self.role.name == "lr_minimal"
  end

  def lr_readonly?
    self.role.name == "lr_readonly"
  end

  def lr_create?
    self.role.name == "lr_create"
  end

  def lr_future4?
    self.role.name == "lr_future4"
  end

  def lr_regular?
    self.role.name == "lr_regular"
  end

  def lr_supervisor?
    self.role.name == "lr_supervisor"
  end

  def lr_seller?
    self.role.name == "lr_seller"
  end



  private

  def password_update?
    password.present? || new_record?
  end

  belongs_to :role
end
