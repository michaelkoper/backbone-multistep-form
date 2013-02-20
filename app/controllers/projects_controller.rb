class ProjectsController < ApplicationController
  respond_to :json

  def create
    @project = Project.build_for_user(params)
    if @project.save
      flash[:notice] = "Project was successfully created.'"
    end
    respond_with @project
  end

  # Just an idea, instead of localeStorage, saving the current project in Redis in a hash.
  # Not implemented.
  def cache(user)
    "#{user.id}_project"
  end

end
