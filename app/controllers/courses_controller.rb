class CoursesController < ApplicationController
  def index
    @courses = Course.by_position
  end

  def show
    @course = Course.find(params[:id])
    if @course.active?
      redirect_to(@course.active_section)
    else
      @follow_up = @course.follow_ups.build
      km.record('Viewed Inactive Course', { 'Course Name' => @course.name })
    end
  end
end
