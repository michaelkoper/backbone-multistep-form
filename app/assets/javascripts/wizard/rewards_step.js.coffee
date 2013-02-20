class @RewardsStepView extends Backbone.View
  template: '#project-wizard-step-2'
  className: 'step'

  initialize: ->
    @template = _.template($(@template).html())

  render: ->
    $(@el).html(@template(@model))
    @
