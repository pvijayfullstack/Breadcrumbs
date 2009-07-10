class ItemsController < ApplicationController

  def quick_add
    @project = Project.find(params[:project_id])
    @item = Item.new
    @item.project = @project
    @item.description = params[:description]
    @item.type= params[:type]
    @item.notes = params[:notes]
    @item.status_id = params[:status_id]
    @item.effort_id = params[:effort_id]
    @item.priority_id = params[:priority_id]

    @item.save!
    redirect_to project_path(@project)
  end

  # GET /items
  # GET /items.xml
  def index
    @items = Item.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @items }
    end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @item }
    end
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])

    @status_list = Item::STATUS_LIST
    @project_list = Project.find(:all).collect {|p| [ p.name, p.id ] }
    @item_list = Item.find_others_for_project( @item ).collect {|i| [ i.description, i.id ] }
    @effort_list = Item::EFFORT_LIST
    @priority_list = Item::PRIORITY_LIST
    @type_list = Item::TYPE_LIST
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])

    respond_to do |format|
      if @item.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@item) }
        format.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        format.html { redirect_to(@item.project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to(items_url) }
      format.xml  { head :ok }
    end
  end
end
