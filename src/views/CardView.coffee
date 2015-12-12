class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'
  imgURLTemplate: _.template 'background-image:url(img/cards/<%= rankName %>-<%= suitName %>.png)'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.attr 'style', @imgURLTemplate @model.attributes
    #@$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
