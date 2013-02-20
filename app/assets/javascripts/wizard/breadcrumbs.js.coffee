class @BreadcrumbsView extends Backbone.View
  template: '#project-wizard-breadcrumbs'

  initialize: (opts)->
    @template = _.template($(@template).html())
    @stepsView = opts['stepsView']

  render: ->
    $(@el).html(@template())
    @

  setActive: (id)->
    @.$("li a[data-view=#{id}]").parent().addClass('active').siblings().removeClass('active')
