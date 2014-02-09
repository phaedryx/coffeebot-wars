class Arena
  @WIDTH:  640
  @HEIGHT: 640

  constructor: (@canvasID) ->
    @setupCanvas()

  setupCanvas: ->
    @canvas = document.getElementById(@canvasID)
    @canvas.height = Arena.HEIGHT
    @canvas.width  = Arena.WIDTH

class Botlist
  constructor: (botlistID) ->
    @listnode = document.getElementById(botlistID)

class CoffeebotWar
  constructor: (params) ->
    @arena    = new Arena(params.arenaID)
    @botlist  = new Botlist(params.botlistID)

window.CoffeebotWar = CoffeebotWar
