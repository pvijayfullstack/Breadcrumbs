class Task < ActiveRecord::Base
  belongs_to :project
  has_many :breadcrumbs

  NEW_STATUS = 0
  DONE_STATUS = 1

  REPLACED_BY_STATUS = 1
  
  STATUS_LIST = [ "new", "done" ]
                  
  def initialize(params = nil)
    super
    self.status_id = NEW_STATUS
  end

  def status
    STATUS_LIST[self.status_id]
  end

  def self.build_status_list
    status_list = [
      ["new", NEW_STATUS], 
      ["done", DONE_STATUS]
    ]

    status_list
  end

  def self.find_others_for_project( task )
    tasks = Task.find( :all,
      :conditions => [ 'project_id = ? and id <> ?', 
                        task.project.id, task.id ] )
    tasks
  end
end
