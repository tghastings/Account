class CompaniesController < ApplicationController
  # GET /companies
  # GET /companies.json
 
 
  def index
   if admin_signed_in?
      @companies = Company.all 

      respond_to do |format|
       format.html # index.html.erb
        format.json { render json: @companies }
      end
   else 
       if user_signed_in? 
    redirect_to :controller => "companies", :action => "show", :id => current_user.company_id
  else
    redirect_to "/users/sign_in"
  end
end
end
  # GET /companies/1
  # GET /companies/1.json
  def show
   if user_signed_in?
     unless current_user.company_id == params[:id]
       redirect_to root_path
     end
  end
  if user_signed_in? or admin_signed_in? 
      @company = Company.find(params[:id])
      @services = @company.services
      @users = @company.users
        respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @company }
        end
    else 
      redirect_to root_path
    end
end
  # GET /companies/new
  # GET /companies/new.json
  def new
    if admin_signed_in?
      @company = Company.new
      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @company }
      end
     else 
         if user_signed_in? 
      redirect_to :controller => "companies", :action => "show", :id => current_user.company_id
    else
      redirect_to "/users/sign_in"
    end
  end
end

  # GET /companies/1/edit
  def edit
    
    @company = Company.find(params[:id])
     if admin_signed_in?
     else 
        if user_signed_in? 
      unless current_user.company_id == params[:id]
        redirect_to root_path
      end
      else 
        redirect_to root_path
      end
    end
    
  end
    

  # POST /companies
  # POST /companies.json
  def create
        unless admin_signed_in?
          redirect_to root_path
        end
    
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render json: @company, status: :created, location: @company }
      else
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /companies/1
  # PUT /companies/1.json
  def update
    @company = Company.find(params[:id])
    
    if admin_signed_in?
     else 
        if user_signed_in? 
      unless current_user.company_id == params[:id]
        redirect_to root_path
      end
      else 
        redirect_to root_path
      end
    end

    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    unless admin_signed_in?
      redirect_to root_path
    end
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
      format.json { head :ok }
    end
  end
end
