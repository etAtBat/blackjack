class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: (data) ->
    if @isDealer
      if @maxScore() >= 17 and @maxScore() <= 21
        if data > @maxScore() or @maxScore() > 21 then alert("YOU WIN!")else
          if data == @maxScore() then alert("TIE!") else alert("YOU LOSE!")
      else if @minScore() >= 17
        if data > @minScore() or @minScore() > 21 then alert("YOU WIN!") else
          if data == @minScore() then alert("TIE!") else alert("YOU LOSE!")
      else
        @add(@deck.pop())
        @hit(data)


    else
      @add(@deck.pop())
      if @minScore() > 21
        console.log('you lose')
    @last()

  stand: ->
    if @maxScore() > 21
      score = @minScore()
    else
      score = @maxScore()#choosing between hands

    @trigger('stand', score)


  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  maxScore: ->
    @minScore() + 10 * @hasAce()

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]
