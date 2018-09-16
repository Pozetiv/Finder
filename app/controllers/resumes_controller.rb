class ResumesController < ApplicationController
  before_action :find_params, only: [:edit, :update, :destroy, :show]
  before_action :authenticate_user!, except: [:index, :show]

  def new
    @resume = current_user.build_resume
  end

  def create
    @resume = current_user.build_resume(resumes_params)
    if @resume.save
      redirect_to @resume, success: 'Created your resume'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @resume.update_attributes(resumes_params)
      redirect_to @resume, success: 'Updated'
    else
      render :edit
    end
  end

  def show; end

  def destroy
    if @resume.destroy
      redirect_to root_path, success: 'Resume deleted'
    else
      redirect_to root_path, danger: "Cann't destroy your resume"
    end
  end

  private

  def resumes_params
    params.require(:resume).permit( :position, :location, :telefon, :email, :linked_in,
      :body, :first_name, :last_name, :photo, educations_attributes: [:id, :_destroy,
      :started, :finished, :academy_name, :profession, :body],
      career_summary_attributes:[:id, :_destroy, :position, :company_name,
      :address, :body, :started, :fineshed] )
  end

  def find_params
    @resume = Resume.find(params[:id])
  end
end
