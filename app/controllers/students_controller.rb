class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]

  def index
    @students = Student.all
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        pdf = WickedPdf.new.pdf_from_string(get_html)
        send_data(pdf, filename: 'Schedule', type: 'application/pdf')
      end
    end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: 'Student was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: 'Student was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
    end
  end

  private

  def set_student
    @student = Student.eager_load(:sections).find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, section_ids: [])
  end

  def get_html
    render_to_string(template: 'students/student_template',
                    orientation: "Landscape",
                    page_size: 'Letter',
                    background: false
    )
  end
end
