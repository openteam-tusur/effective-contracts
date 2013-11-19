# encoding: utf-8

class Permission < ActiveRecord::Base
  attr_accessible :role, :context_id, :user_id, :email

  extend Enumerize

  belongs_to :user
  belongs_to :context, :polymorphic => true

  validates_presence_of :email, :role
  #validates_presence_of :context_id, :context_type, :if => :role_manager?

  validates_uniqueness_of :context_id, :scope => :email
  validates_email_format_of :email, :message => 'Неверный формат электронной почты'

  def self.validates_presence_of(*attr_names)
    new_attrs = []
    option = {}
    attr_names.each do |attr|
      if attr.class == Hash

        next
      end
      new_attrs << attr if attr != :user
    end
    super new_attrs, option
  end

  def self.validates_uniqueness_of(attr_name, options)
    options.merge!({:scope => [:email, :context_id, :context_type]}) if attr_name == :role
    super attr_name, options
  end


  scope :by_user, ->(_) { order('email') }

  normalize_attribute :email do |value|
    value.present? ? value.downcase : value
  end

  enumerize :role,
    :in => [:administrator, :manager],
    :default => :manager,
    :predicates => { :prefix => true },
    :scope => true

  sso_auth_permission :roles => %w[administrator manager]

  def self.activate_for_user(user)
    where(:email => user.email).update_all :user_id => user.id
  end

  def to_s
    ''.tap do |s|
      s << "&lt;#{user.email}&gt; #{user} &mdash; " if user.present?
      s << "&lt;#{email}&gt; роль не активирована &mdash; " if user.nil?
      s << role_text
      s << " &laquo;#{context}&raquo;" if role_manager?
    end.html_safe
  end

  def title
    ''.tap do |s|
      s << "&lt;#{user.email}&gt; #{user}" if user.present?
      s << "&lt;#{email}&gt; <span class='alert'>роль не активирована</span>" if user.nil?
    end
  end

end

# == Schema Information
#
# Table name: permissions
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  context_id   :integer
#  context_type :string(255)
#  role         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
