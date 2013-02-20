class @BasicStepView extends Backbone.View
  template: '#project-wizard-step-1'
  className: 'step'

  initialize: ->
    @template = _.template($(@template).html())

  render: ->
    $(@el).html(@template(@model))

    @
