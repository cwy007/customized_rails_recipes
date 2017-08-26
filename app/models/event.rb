class Event < ApplicationRecord
  mount_uploader :logo, EventLogoUploader
  mount_uploaders :images, EventImageUploader  # NOTE mount_uploaders plural
  serialize :images, JSON

  include RankedModel
  ranks :row_order

  has_many :registrations, :dependent => :destroy

  has_many :tickets, :dependent => :destroy, :inverse_of => :event
  accepts_nested_attributes_for :tickets, :allow_destroy => true, :reject_if => :all_blank

  has_many :attachments, :class_name => "EventAttachment", :dependent => :destroy  # NOTE :class_name 指出真正的model
  accepts_nested_attributes_for :attachments, :allow_destroy => true, :reject_if => :all_blank

  belongs_to :category, :optional => true

  validates_presence_of :name, :friendly_id

  validates_uniqueness_of :friendly_id
  validates_format_of :friendly_id, :with => /\A[a-z0-9\-]+\z/

  before_validation :generate_friendly_id, :on => :create

  STATUS = ["draft", "public", "private"]
  validates_inclusion_of :status, :in => STATUS

  def to_param
    self.friendly_id
  end

  scope :by_status, ->(s){ where( :status => s ) }
  scope :by_category, ->(c){ where( :category_id => c ) }

  scope :only_public, -> { where( :status => "public" ) }
  scope :only_available, -> { where( :status => ["public", "private"] ) }

  protected

  def generate_friendly_id
    self.friendly_id ||= SecureRandom.uuid
  end

end
