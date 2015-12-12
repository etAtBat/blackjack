class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    #@$el.attr('class','covered')
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
