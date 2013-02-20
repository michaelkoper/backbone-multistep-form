class ProjectStepsController < ApplicationController
  include Wicked::Wizard

  steps :basic, :rewards, :story

  def show
    case step
    when :basic
      # ...
    end
    render_wizard
  end
end
