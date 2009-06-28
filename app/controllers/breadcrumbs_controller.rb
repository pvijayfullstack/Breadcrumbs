class BreadcrumbsController < ApplicationController
  # GET /breadcrumbs
  # GET /breadcrumbs.xml
  def index
    @breadcrumbs = Breadcrumb.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @breadcrumbs }
    end
  end

  # GET /breadcrumbs/1
  # GET /breadcrumbs/1.xml
  def show
    @breadcrumb = Breadcrumb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @breadcrumb }
    end
  end

  # GET /breadcrumbs/new
  # GET /breadcrumbs/new.xml
  def new
    @breadcrumb = Breadcrumb.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @breadcrumb }
    end
  end

  # GET /breadcrumbs/1/edit
  def edit
    @breadcrumb = Breadcrumb.find(params[:id])
  end

  # POST /breadcrumbs
  # POST /breadcrumbs.xml
  def create
    @breadcrumb = Breadcrumb.new(params[:breadcrumb])

    respond_to do |format|
      if @breadcrumb.save
        flash[:notice] = 'Breadcrumb was successfully created.'
        format.html { redirect_to(@breadcrumb) }
        format.xml  { render :xml => @breadcrumb, :status => :created, :location => @breadcrumb }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @breadcrumb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /breadcrumbs/1
  # PUT /breadcrumbs/1.xml
  def update
    @breadcrumb = Breadcrumb.find(params[:id])

    respond_to do |format|
      if @breadcrumb.update_attributes(params[:breadcrumb])
        flash[:notice] = 'Breadcrumb was successfully updated.'
        format.html { redirect_to(@breadcrumb) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @breadcrumb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /breadcrumbs/1
  # DELETE /breadcrumbs/1.xml
  def destroy
    @breadcrumb = Breadcrumb.find(params[:id])
    @breadcrumb.destroy

    respond_to do |format|
      format.html { redirect_to(breadcrumbs_url) }
      format.xml  { head :ok }
    end
  end
end
