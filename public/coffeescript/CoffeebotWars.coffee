class Arena
  @WIDTH:  640
  @HEIGHT: 640
  @ROBOT_RADIUS: 16
  @DEGREES_PER_RADIAN: 180.0 / Math.PI
  @RADIANS_PER_DEGREE: Math.PI / 180.0

  constructor: (@canvasID) ->
    @setupCanvas()
    @setupContext()
    @angle = 0

  setupCanvas: ->
    @canvas = document.getElementById(@canvasID)
    @canvas.height = Arena.HEIGHT
    @canvas.width  = Arena.WIDTH

  setupContext: ->
    @context = @canvas.getContext '2d'
    @context.lineWidth = 2
    @context.clear = ->
      @save()
      @setTransform(1, 0, 0, 1, 0, 0)
      @clearRect(0, 0, Arena.WIDTH, Arena.HEIGHT)
      @restore()
    @context.d2r = (angle) -> angle * Arena.RADIANS_PER_DEGREE
    @context.r2d = (angle) -> angle * Arena.DEGREES_PER_RADIAN
    @context.circle = (x, y, radius, color) ->
      @beginPath()
      @arc(x, y, radius, 0, Math.PI*2, true)
      @closePath()
      @strokeStyle = color
      @stroke()
    @context.filledCircle = (x, y, radius, color) ->
      @beginPath()
      @arc(x, y, radius, 0, Math.PI*2, true)
      @closePath()
      @fillStyle = color
      @fill()
    @context.vector = (x, y, angle, length, color) ->
      xp = x + Math.cos(@d2r(angle)) * length
      yp = y + Math.sin(@d2r(angle)) * length
      @beginPath()
      @moveTo(x, y)
      @lineTo(xp, yp)
      @closePath()
      @strokeStyle = color
      @stroke()


# animation functions
  animate: =>
    if @run
      @tick()
      requestAnimationFrame(@animate)

  tick: ->
    @context.clear()
    @context.circle(320,320, 16, 'red')
    @context.vector(320,320, @angle, 16, 'red')
    @angle += 1

  play: ->
    @run = true
    @animate()

  pause: ->
    @run = false

  stop: ->
    @run = false
    @reset()

  reset: ->
    @context.clear()

# math helper functions
  getRandomInt: (min, max) -> Math.floor(Math.random() * (max - min + 1) + min)


class Botlist
  constructor: (botlistID) ->
    @listnode = document.getElementById(botlistID)


class CoffeebotWar
  constructor: (params) ->
    window.arena    = new Arena(params.arenaID)
    @botlist  = new Botlist(params.botlistID)

window.CoffeebotWar = CoffeebotWar
