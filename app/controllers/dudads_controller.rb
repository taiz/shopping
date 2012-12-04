class DudadsController < ApplicationController
  # GET /dudads
  # GET /dudads.json
  def index
    @dudads = Dudad.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dudads }
    end
  end

  # GET /dudads/1
  # GET /dudads/1.json
  def show
    @dudad = Dudad.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dudad }
    end
  end

  # GET /dudads/new
  # GET /dudads/new.json
  def new
    @dudad = Dudad.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dudad }
    end
  end

  # GET /dudads/1/edit
  def edit
    @dudad = Dudad.find(params[:id])
  end

  # POST /dudads
  # POST /dudads.json
  def create
    @dudad = Dudad.new(params[:dudad])

    respond_to do |format|
      if @dudad.save
        format.html { redirect_to @dudad, notice: 'Dudad was successfully created.' }
        format.json { render json: @dudad, status: :created, location: @dudad }
      else
        format.html { render action: "new" }
        format.json { render json: @dudad.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dudads/1
  # PUT /dudads/1.json
  def update
    @dudad = Dudad.find(params[:id])

    respond_to do |format|
      if @dudad.update_attributes(params[:dudad])
        format.html { redirect_to @dudad, notice: 'Dudad was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @dudad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dudads/1
  # DELETE /dudads/1.json
  def destroy
    @dudad = Dudad.find(params[:id])
    @dudad.destroy

    respond_to do |format|
      format.html { redirect_to dudads_url }
      format.json { head :ok }
    end
  end
end
