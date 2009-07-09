class Task < ActiveRecord::Base
  belongs_to :project
  has_many :breadcrumbs

  NEW_STATUS = 0
  DONE_STATUS = 1
  DUP_STATUS = 2
  WORKING_STATUS = 3
  TESTING_STATUS = 4
  ASSIGNED_STATUS = 5
  NEVERMIND_STATUS = 6

  SIMPLE_EFFORT = 0
  SMALL_EFFORT = 1
  MED_EFFORT = 2
  BIG_EFFORT = 3

  TODAY_PRIORITY = 0
  TOMORROW_PRIORITY = 1
  THS_WEEK_PRIORITY = 2
  ON_DECK_PRIORITY = 3
  WHENEVER_PRIORITY = 4

  STATUS_LIST = [ "new", "done", "dup", "working", "testing", "assigned", "nevermind" ]
  PRIORITY_LIST = [ "today", "tomorrow", "this week", "on deck", "whenever" ]
                  
  def initialize(params = nil)
    super
    self.status_id = NEW_STATUS
    self.effort_id = SMALL_EFFORT
  end

  def self.open_statuses
    "0,3,#{ASSIGNED_STATUS}"
  end
  def self.complete_statuses
    "#{DONE_STATUS},#{DUP_STATUS},#{TESTING_STATUS},#{NEVERMIND_STATUS}"
  end

  def status
    STATUS_LIST[self.status_id]
  end

  def open_breadcrumb_count
    breadcrumbs.find_open.size
  end

  def total_breadcrumb_count
    breadcrumbs.size
  end

  def self.build_status_list
    status_list = [
      ["new", NEW_STATUS], 
      ["assigned", ASSIGNED_STATUS], 
      ["working", WORKING_STATUS],
      ["testing", TESTING_STATUS],
      ["done", DONE_STATUS],
      ["dup", DUP_STATUS],
      ["nevermind", NEVERMIND_STATUS]
    ]

    status_list
  end

  def self.build_effort_list
    effort_list = [
      ["big", BIG_EFFORT ], 
      ["med", MED_EFFORT],
      ["small", SMALL_EFFORT],
      ["simple", SIMPLE_EFFORT]
    ]

   effort_list 
  end

  def self.build_priority_list
    priority_list = [
      ["today", TODAY_PRIORITY], 
      ["tomorrow", TOMORROW_PRIORITY],
      ["this week", THIS_WEEK_PRIORITY],
      ["on deck", ON_DECK_PRIORITY],
      ["whenever", WHENEVER_PRIORITY],
      ["not assigned", nil ]
    ]

   priority_list 
  end

  def self.find_others_for_project( task )
    Task.find( :all,
        :conditions => [ 'project_id = ? and id <> ?', 
                        task.project.id, task.id ] )
  end

  def self.find_for_project( project )
    Task.find( :all,
      :conditions => [ 'project_id = ?', 
                        project.id ] )
  end

end
