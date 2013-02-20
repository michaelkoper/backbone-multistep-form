class @StoryStepView extends Backbone.View
  template: '#project-wizard-step-3'
  className: 'step'

  initialize: ->
    @template = _.template($(@template).html())

  render: ->
    $(@el).html(@template(@model))
    @