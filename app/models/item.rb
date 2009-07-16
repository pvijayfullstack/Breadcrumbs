class Item < ActiveRecord::Base

  belongs_to :project
  has_many :breadcrumbs

  NEW_STATUS       = 0
  DONE_STATUS      = 1
  DUP_STATUS       = 2
  WORKING_STATUS   = 3
  TESTING_STATUS   = 4
  ASSIGNED_STATUS  = 5
  NEVERMIND_STATUS = 6

  STATUS_MAP = {
    NEW_STATUS => "new",
    ASSIGNED_STATUS => "assigned",
    DONE_STATUS => "done",
    DUP_STATUS => "dup",
    WORKING_STATUS => "working",
    TESTING_STATUS => "testing",
    NEVERMIND_STATUS => "nevermind"
  }

  STATUS_LIST = [
    ["new", NEW_STATUS], 
    ["assigned", ASSIGNED_STATUS], 
    ["working", WORKING_STATUS],
    ["testing", TESTING_STATUS],
    ["done", DONE_STATUS],
    ["dup", DUP_STATUS],
    ["nevermind", NEVERMIND_STATUS]
  ]

  SIMPLE_EFFORT  = 0
  SMALL_EFFORT   = 1
  MED_EFFORT     = 2
  BIG_EFFORT     = 3
  UNKNOWN_EFFORT = 4

  EFFORT_MAP = {
    SIMPLE_EFFORT => "0-1 hour",
    SMALL_EFFORT => "1-4 hours",
    MED_EFFORT => "4-8 hours",
    BIG_EFFORT => "1-2 days",
    UNKNOWN_EFFORT => "?"
  }

  EFFORT_LIST = [
    ["0-1 hour", 0], 
    ["1-4 hours", 1], 
    ["4-8 hours", 2],
    ["1-2 days", 3],
    ["Unknown Effort", 4]
  ]

  PRIORITY_NOT_SET = 0
  TODAY_PRIORITY = 1
  TOMORROW_PRIORITY = 2
  THS_WEEK_PRIORITY = 3
  ON_DECK_PRIORITY = 4
  WHENEVER_PRIORITY = 5

  PRIORITY_MAP = {
    0 => "not set",
    1 => "today",
    2 => "tomorrow",
    3 => "this week",
    4 => "on deck",
    5 => "whenever"
  }

  PRIORITY_LIST = [
    ["not set", 0], 
    ["today", 1], 
    ["tomorrow", 2], 
    ["this week", 3],
    ["on deck", 4],
    ["whenever", 5]
  ]

  TYPE_LIST = [
      ["Task", "Task"], 
      ["Idea", "Idea"], 
      ["Bug", "Bug"],
      ["Feature", "Feature"],
      ["Question", "Question"]
    ]

  def initialize(params = nil)
    super
    self.status_id = NEW_STATUS
    self.effort_id = UNKNOWN_EFFORT
    self.priority_id = PRIORITY_NOT_SET 
  end

  def self.open_statuses
    "0,3,#{ASSIGNED_STATUS}"
  end
  def self.complete_statuses
    "#{DONE_STATUS},#{DUP_STATUS},#{TESTING_STATUS},#{NEVERMIND_STATUS}"
  end

  def status
    STATUS_MAP[status_id]
  end


  def priority
    PRIORITY_MAP[priority_id] 
  end

  def effort 
    EFFORT_MAP[effort_id] 
  end

  def self.find_others_for_project( item )
    Item.find( :all,
        :conditions => [ 'project_id = ? and id <> ?', 
                        item.project.id, item.id ] )
  end

  def self.find_for_project( project )
    Item.find( :all,
      :conditions => [ 'project_id = ?', 
                        project.id ] )
  end
end
