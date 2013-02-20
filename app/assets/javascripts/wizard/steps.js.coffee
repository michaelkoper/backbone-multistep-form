class @StepsView extends Backbone.View
  template: '#project-wizard-steps'

  events:
    'click a.next':   'nextStep'
    'click a.prev':   'prevStep'
    'click a.submit': 'onClickSubmit'
    'submit form':    'onSubmitForm'

  initialize: ->
    @_currentView = null
    @_currentStep = 0
    @steps = []
    @stepViews = {}
    @template = _.template($(@template).html())

    @model.bind 'invalid', @onInValidModel, @

  render: ->
    $(@el).html(@template())
    @

  addStep: (id, step)->
    @steps.push(id)
    @stepViews[id] = step
    @.$('#steps').append(step.render().el)

  setBreadCrumbsView: (view)-> @breadCrumbsView = view
  start: -> @showCurrentStep()

  nextStep: ->
    @_currentStep++
    app.router.navigate("steps/#{@steps[@_currentStep]}", {trigger:true})

  prevStep: ->
    if @_currentStep > 0
      @_currentStep--
    app.router.navigate("steps/#{@steps[@_currentStep]}", {trigger:true})

  onClickSubmit: (e)-> @.$('form').submit()

  onSubmitForm: (e)->
    e.preventDefault()

    @.$('.invalid').removeClass('invalid')

    data = Backbone.Syphon.serialize(@)

    @model.save data['project'],
      success: (model)-> model.clearLocalStorage()
      error: (model, response)=>
        errors = $.parseJSON(response.responseText).errors
        @onInValidModel(model, errors)

  onInValidModel: (model, errors)->
    localStorage.setItem('project', JSON.stringify(model.attributes))
    _.each errors, (value, key)->
      @.$("#project_#{key}").addClass('invalid')

  showCurrentStep: ->
    $('.step').hide()
    @.$('a.button').hide()
    $(@stepViews[@steps[@_currentStep]].el).show()
    unless @_currentStep == 0
      @.$('a.prev').show()
    unless @_currentStep == @steps.length - 1
      @.$('a.next').show()
    if @_currentStep == @steps.length - 1
      @.$('a.submit').show()
    @breadCrumbsView.setActive(@steps[@_currentStep])

  showStep: (id)->
    @_currentStep = @steps.indexOf(id)
    @showCurrentStep()
