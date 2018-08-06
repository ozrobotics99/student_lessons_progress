class ProgressesController < ApplicationController
  before_action :set_progress, only: [:show, :edit, :update, :destroy]

  # GET /progresses
  # GET /progresses.json
  def index
    @progresses = Progress.all
  end

  # GET /progresses/1
  # GET /progresses/1.json
  def show
  end


  def update_student_progress

    @student = Student.find(params[:id])

    if !@student.progress.nil?
      @progress = @student.progress
      redirect_to edit_progress_path(@progress)
    else
      redirect_to "/new_progress/#{@student.id}"
    end

  end

  # GET /progresses/new
  def new_progress

    @student = Student.find(params[:id])
    @progress = Progress.new
    @progress.student = @student

  end

  # GET /progresses/new
  def new

    @student = Student.find(params[:student_id])
    if !@student.progress.nil?
      redirect_to edit_progress_path(@student)
    else
      @progress = Progress.new
    end

  end

  # GET /progresses/1/edit
  def edit

  end

  # POST /progresses
  # POST /progresses.json
  def create

    @student = Student.find(params[:progress][:student_id])
    @progress = Progress.new
    @progress.lesson = Lesson.first
    @progress.student = @student

    respond_to do |format|
      if @progress.save
        format.html { redirect_to "/students/#{@student.id}", notice: 'Progress was successfully created.' }
        format.json { render :show, status: :created, location: @progress }
      else
        format.html { render :new }
        format.json { render json: @progress.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /progresses/1
  # PATCH/PUT /progresses/1.json
  def update

    @current_lesson = @progress.lesson

    next_lesson = @current_lesson.next(@current_lesson)

    @progress.lesson = next_lesson

    respond_to do |format|
      if @progress.update(progress_params)
        format.html { redirect_to "/students/#{@progress.student.id}", notice: 'Progress was successfully updated.' }
        format.json { render :show, status: :ok, location: @progress }
      else
        format.html { render :edit }
        format.json { render json: @progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /progresses/1
  # DELETE /progresses/1.json
  def destroy
    @progress.destroy
    respond_to do |format|
      format.html { redirect_to progresses_url, notice: 'Progress was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_progress
      @progress = Progress.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def progress_params
      params.require(:progress).permit(:lesson_id, :student_id)
    end
end
