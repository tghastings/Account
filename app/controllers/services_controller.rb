class ServicesController < ApplicationController
  # GET /services
  # GET /services.json
  def index
     if admin_signed_in?
      @services = Service.all
      @companies = Company.all
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @services }
      end
    else
        redirect_to '/admins/sign_in'
    end    
    
  end

  # GET /services/1
  # GET /services/1.json
  def show
    if admin_signed_in?
    @service = Service.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
    else
        redirect_to '/admins/sign_in'
    end
  end

  # GET /services/new
  # GET /services/new.json
  def new
 if admin_signed_in?
    @service = Service.new
     @companies =  Company.all
      respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
  end
   else
        redirect_to '/admins/sign_in'
    end
  end

  # GET /services/1/edit
  def edit
     if admin_signed_in?
    @service = Service.find(params[:id])
    @companies =  Company.all
    else
          redirect_to '/admins/sign_in'
      end
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(params[:service])

    respond_to do |format|
      if @service.save
        format.html { redirect_to @service, notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: "new" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    @service = Service.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to @service, notice: 'Service was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to services_url }
      format.json { head :ok }
    end
  end
end
