class @Project extends Backbone.Model

  validate:
    name:
      required: true
    basic_info:
      required: true
    location:
      required: true
    funding_duration_days:
      required: true
      min: 5
      max: 60
    story:
      required: true
    email:
      type: 'email'

  url: -> app.routes.projects_url + "/" + (@id || '')

  initialize: (opts) ->
    @set(JSON.parse(localStorage.getItem('project')))

  clearLocalStorage: ->
    localStorage.setItem('project', null)
