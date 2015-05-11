class BrewsController < ApplicationController


   def index
     @brews = Brew.find(:all)

     respond_to do |format|
       format.html { render :action => 'list' }
       format.xml  { render :xml => @brews }
       format.json { render :json => @brews }
       format.js
     end

   end

  def admin
     @brews = Brew.find(:all)

     respond_to do |format|
       format.html { render :action => 'admin' }
       format.xml  { render :xml => @brews }
       format.json { render :json => @brews }
       format.js
     end

   end


   def list
     @brews = Brew.find(:all)
   end
   def show
     @brew = Brew.find(params[:id])

     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @brew }
       format.json { render :json => @brew }
     end

   end
   def new
     @brew = Brew.new

     respond_to do |format|
       format.html # new.html.erb
       format.xml  { render :xml => @brew }
       format.json { render :json => @brew }
     end

   end
   def create
     @brew = Brew.new(params[:brew])
     before_save
     $stderr.puts params.inspect
     respond_to do |format|
       if @brew.save
         flash[:notice] = "Brew was successfully created."
         format.html { redirect_to @brew }
         format.xml  { render :xml => @brew, :status => :created, :location => @brew }
         format.json { render :json => @brew, :status => :created }

       else
         format.html { render :action => "new" }
         format.xml  { render :xml => @brew.errors, :status => :unprocessable_entity }
         format.json { render :json => @brew.errors, :status => :unprocessable_entity }
       end
     end
   end
   def edit
     @brew = Brew.find(params[:id])
   end
   def update
     @brew = Brew.find(params[:id])
     before_save
     $stderr.puts params.inspect
     respond_to do |format|
       if @brew.update_attributes(params[:brew])
         flash[:notice] = "Brew was successfully updated."
         format.html { redirect_to @brew }
         format.xml  { head :ok }
         format.json { render :json => @brew, :status => :created }
       else
#         flash[:notice] = "Not successfully updated"
         format.html { render :action => "edit" }
         format.xml  { render :xml => @brew.errors, :status => :unprocessable_entity }
         format.json { render :json=> @brew.errors, :status => :unprocessable_entity }
       end
     end
   end
   def destroy
     @brew = Brew.find(params[:id])
     @brew.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'index' }
      format.xml  { head :ok }
      format.json { head :no_content, status: :ok }
    end
   end

   def before_save
     @brew.level = @brew.level.to_f
     if @brew.filled_at.nil?
       @brew.filled_at = Time.now
     end
     @brew.state = "normal" if @brew.state.nil?
   end

   def show_coffee_analytics
     @ca = CoffeeAnalytic.find(params[:id])
   end
   def show_analytics_usages
     @au = AnalyticUsage.find(params[:id])
   end
end
