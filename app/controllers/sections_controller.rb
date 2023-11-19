class SectionsController < ApplicationController
  before_action :set_section, only: %i[show edit update destroy]

  def index
    @sections = Section.all
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save
        format.html { redirect_to section_url(@section), notice: 'Section was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @section.update(section_params)
        format.html { redirect_to section_url(@section), notice: 'Section was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @section.destroy

    respond_to do |format|
      format.html { redirect_to sections_url, notice: 'Section was successfully destroyed.' }
    end
  end

  private

  def set_section
    @section = Section.eager_load(:teacher, :subject, :classroom).find(params[:id])
  end

  def section_params
    params.require(:section).permit(:teacher_id, :subject_id, :classroom_id, :duration, :start_time,
                                    assign_days_of_week: [])
  end
end
