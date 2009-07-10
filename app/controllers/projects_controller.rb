class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])
    @item = Item.new
    @item_types = Item::TYPE_LIST
    @priority_list = Item::PRIORITY_LIST
    @effort_list = Item::EFFORT_LIST
    @status_list = Item::STATUS_LIST

    if @project.parent
      @parent = Project.find(@project.parent)
    end

    if params[:task_status_to_display]
      status_list = params[:task_status_to_display].split(',') 
      @tasks = Task.find( :all, :conditions => ['project_id = ? and status_id in (?)', @project.id, status_list] )
      session[:task_status_to_display] = params[:task_status_to_display]
    elsif session[:task_status_to_display]
      status_list = session[:task_status_to_display].split(',') 
      @tasks = Task.find( :all, :conditions => ['project_id = ? and status_id in (?)', @project.id, status_list] )
    else
      @tasks = @project.tasks
    end

    @sl = params[:task_status_to_display] 
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        flash[:notice] = 'Project was successfully created.'
        format.html { redirect_to(@project) }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:notice] = 'Project was successfully updated.'
        format.html { redirect_to(@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
end
