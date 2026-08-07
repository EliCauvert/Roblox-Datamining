local t = {
	FFlagUsePlaceInfoController = game:DefineFastFlag("UsePlaceInfoController2", false),
	FFlagUseUniverseVotesController = game:DefineFastFlag("UseUniverseVotesController", false)
}

return {
	Actions = require(script.Actions),
	Flags = t,
	Models = require(script.Models),
	PlaceInfoController = if t.FFlagUsePlaceInfoController then require(script.PlaceInfoController) else nil,
	UniverseVotesController = if t.FFlagUseUniverseVotesController then require(script.UniverseVotesController) else nil,
	Reducers = require(script.Reducers),
	Thunks = require(script.Thunks)
}