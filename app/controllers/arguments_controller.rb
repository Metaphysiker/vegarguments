class ArgumentsController < ApplicationController
  before_action :set_argument, only: [:submitsuggestion, :publishargument, :show, :edit, :update, :destroy]
  before_action :allowed?, only: [:edit, :update, :destroy, :adminpanel]

  def adminpanel
    @arguments = Argument.all
    @questions = Question.all
    @unpublishedarguments = Argument.unpublished
    @unpublishedquestions = Question.unpublished
  end

  def submittranslation

  end

  def search
    search = params[:search]

    if search.nil? || search.empty?
      #@arguments = Argument.published
      @questions = Question.all
      @arguments = Argument.none
    else
      #@arguments = Argument.published.where("question ILIKE ? OR quickanswer ILIKE ? OR longanswer ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
      #@pdfs = Pdf.search_title_file_name_url(search)
      #@arguments = Argument.published.basic_argument_search_for(search)
      #results = PgSearch.multisearch(search)
      #arguments = results.where(searchable_type: "Argument")
      #questions = results.where(searchable_type: "Question")
      #arguments_ids = arguments
      questions = Question.published.basic_search_for(search)
      @arguments = Argument.published.basic_search_for(search)

      questions = questions + Question.find(@arguments.pluck(:question_id).uniq)
      @questions = questions.uniq

    end

    respond_to do |format|
      format.html { render partial: "searchresults" }
    end
  end

  def submitsuggestion
    original = @argument
    @argument = original.dup

    render "new"
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
    #@arguments = Argument.published
    @questions = Question.all
    @arguments = Argument.none

    respond_to do |format|
      format.html
      format.csv { send_data Argument.all.to_csv, filename: "arguments-#{Date.today}.csv" }
      format.json
      format.pdf do
        @arguments = Argument.all
        render pdf: "arguments-#{Date.today}.csv",
        template: "arguments/pdf.html.erb",
        layout: 'pdf.html'
      end
    end

  end

  # GET /arguments/1
  # GET /arguments/1.json
  def show
    @title = @argument.title
  end

  # GET /arguments/new
  def new
      @argument = Argument.new
      @question = params[:question]
    logger.debug @question
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
        format.html { redirect_to @argument, notice: 'Argument was successfully created. Moderation will take 2-3 days.' }
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

  def impressum

  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_argument
      #@argument = Argument.find(params[:id])
      @argument = Argument.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def argument_params
      params.require(:argument).permit(:argument, :title, :question_id, :author, :language, :url)
    end
end
