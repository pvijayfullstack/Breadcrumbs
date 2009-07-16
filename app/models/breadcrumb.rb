class Breadcrumb < ActiveRecord::Base
  belongs_to :task
  belongs_to :item

  OPEN_STATUS = 0
  CLOSED_STATUS = 1

  STATUS_LIST = [ "open", "closed" ]

  def initialize(params = nil)
    super
    self.status_id = OPEN_STATUS
  end

  def status
    STATUS_LIST[self.status_id]
  end

  def open?
    self.status_id == OPEN_STATUS
  end

  def self.find_open
    self.find_status(OPEN_STATUS)
  end

  def self.find_closed
    self.find_status(CLOSED_STATUS)
  end

  def self.find_status(status)
    find_all_by_status_id(status)
  end

  def self.build_status_list
    status_list = [
      ["open", OPEN_STATUS], 
      ["closed", CLOSED_STATUS]
    ]

    status_list
  end

end
