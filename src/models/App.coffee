# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    that = @
    @get('playerHand').on('stand', (data) ->
      that.get('dealerHand').first().flip()
      that.get('dealerHand').hit(data)
      #new game
      #remove cards from dealer and player
      if(that.get('deck').length < 7)
        console.log(that.get('deck').models)
        test = new Deck()
        that.get('deck').reset(test.models);
        console.log(that.get('deck').models)
      that.get('playerHand').reset([that.get('deck').pop(), that.get('deck').pop()])
      that.get('dealerHand').reset([that.get('deck').pop().flip(), that.get('deck').pop()])
      #re-creates playerhand and dealerhand by invoking deck.dealplayer
      #score values reset
      #re-deal new hands
    )
