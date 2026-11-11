local Flags = {
	FFlagUsePlaceInfoController = game:DefineFastFlag("UsePlaceInfoController2", false),
	FFlagUseUniverseVotesController = game:DefineFastFlag("UseUniverseVotesController", false)
}

return {
	Actions = require(script.Actions),
	Flags = Flags,
	Models = require(script.Models),
	PlaceInfoController = if Flags.FFlagUsePlaceInfoController then require(script.PlaceInfoController) else nil,
	UniverseVotesController = if Flags.FFlagUseUniverseVotesController then require(script.UniverseVotesController) else nil,
	Reducers = require(script.Reducers),
	Thunks = require(script.Thunks)
}