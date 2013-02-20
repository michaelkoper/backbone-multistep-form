class PagesController < ApplicationController
  def welcome
    @project = Project.new
  end
end
