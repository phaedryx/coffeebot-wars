class War
  constructor: (params) ->
    @arena    = new coffeebotwars.Arena(params.arenaID)
    @botlist  = new coffeebotwars.Botlist(params.botlistID)

exports.War = War
