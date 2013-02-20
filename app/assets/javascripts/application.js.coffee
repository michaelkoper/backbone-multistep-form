#= require jquery
#= require jquery_ujs
#= require underscore
#= require backbone
#= require backbone.validation
#= require backbone.syphon
#= require_tree .
#= require_self

class WizardRoutes extends Backbone.Router

  routes:
    '':          'index'
    'steps/:id': 'loadStep'

  index: ->
    unless @stepsView?
      @initializeStepsView()

  loadStep: (id)->
    unless @stepsView?
      @initializeStepsView()
    @stepsView.showStep(id)

  initializeStepsView: ->
    app.project = new Project()
    @stepsView = new StepsView({model:app.project})
    breadCrumbsView = new BreadcrumbsView({stepsView:@stepsView})
    @stepsView.setBreadCrumbsView(breadCrumbsView)
    $('body > header').append(breadCrumbsView.render().el)
    $('#step_views').append(@stepsView.render().el)
    @stepsView.addStep('basic', new BasicStepView({model:app.project}))
    @stepsView.addStep('rewards', new RewardsStepView({model:app.project}))
    @stepsView.addStep('story', new StoryStepView({model:app.project}))

  start: -> @stepsView.start()

$(document).ready ->
  app.router = new WizardRoutes()
  Backbone.history.start()
  app.router.start()