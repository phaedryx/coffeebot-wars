class Arena
  @WIDTH:  640
  @HEIGHT: 640

  constructor: (@canvasID) ->
    @setupContext()

  setupContext: ->
    @canvas = document.getElementById(@canvasID)
    @canvas.height = Arena.HEIGHT
    @canvas.width  = Arena.WIDTH
    @context = @canvas.getContext '2d'
    @context.lineWidth = 2
    @context.DEGREES_PER_RADIAN = 180.0 / Math.PI
    @context.RADIANS_PER_DEGREE = Math.PI / 180.0
    @context.clear = ->
      @save()
      @setTransform(1, 0, 0, 1, 0, 0)
      @clearRect(0, 0, Arena.WIDTH, Arena.HEIGHT)
      @restore()
    @context.d2r = (angle) -> angle * @RADIANS_PER_DEGREE
    @context.r2d = (angle) -> angle * @DEGREES_PER_RADIAN
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
    @context.distance = (x1, y1, x2, y2) ->
      Math.sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1))
    @context.vector = (x, y, angle, length, color) ->
      x1 = x + Math.cos(@d2r(angle)) * length
      y1 = y + Math.sin(@d2r(angle)) * length
      @beginPath()
      @moveTo(x, y)
      @lineTo(x1, y1)
      @closePath()
      @strokeStyle = color
      @stroke()

# animation functions
  animate: =>
    if @run
      @tick()
      requestAnimationFrame(@animate)

  tick: ->
    # battle here

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

exports.Arena = Arena
