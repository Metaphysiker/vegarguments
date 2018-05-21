class ArgumentsController < ApplicationController
  before_action :set_argument, only: [:publishargument, :show, :edit, :update, :destroy]
  before_action :allowed?, only: [:edit, :update, :destroy, :adminpanel]

  def adminpanel
    @arguments = Argument.all
  end

  def submittranslation

  end


  def publishargument

    if @argument.published == true
      @argument.update(published: false)
    else
      @argument.update(published: true)
    end

    redirect_to adminpanel_path
  end
  # GET /arguments
  # GET /arguments.json
  def index
    @arguments = Argument.published
  end

  # GET /arguments/1
  # GET /arguments/1.json
  def show
  end

  # GET /arguments/new
  def new
    @argument = Argument.new
  end

  # GET /arguments/1/edit
  def edit
  end

  # POST /arguments
  # POST /arguments.json
  def create
    @argument = Argument.new(argument_params)

    respond_to do |format|
      if @argument.save
        format.html { redirect_to @argument, notice: 'Argument was successfully created.' }
        format.json { render :show, status: :created, location: @argument }
      else
        format.html { render :new }
        format.json { render json: @argument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arguments/1
  # PATCH/PUT /arguments/1.json
  def update
    respond_to do |format|
      if @argument.update(argument_params)
        format.html { redirect_to @argument, notice: 'Argument was successfully updated.' }
        format.json { render :show, status: :ok, location: @argument }
      else
        format.html { render :edit }
        format.json { render json: @argument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arguments/1
  # DELETE /arguments/1.json
  def destroy
    @argument.destroy
    respond_to do |format|
      format.html { redirect_to arguments_url, notice: 'Argument was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def allowed?
      if current_user.nil? || current_user.role != "admin"
        redirect_to root_path
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_argument
      #@argument = Argument.find(params[:id])
      @argument = Argument.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def argument_params
      params.require(:argument).permit(:title, :question, :quickanswer, :longanswer, :kind, :argument_id)
    end
end
