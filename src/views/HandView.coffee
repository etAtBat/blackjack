class window.HandView extends Backbone.View
  className: 'hand'

  template: _.template '<h2 style="color:white"><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    if @collection.minScore() == @collection.maxScore()
      @$('.score').text(@collection.minScore())
    else
      @$('.score').text("if Ace counted as one: "+@collection.minScore() + ", if Ace counted as eleven: " + @collection.maxScore())
