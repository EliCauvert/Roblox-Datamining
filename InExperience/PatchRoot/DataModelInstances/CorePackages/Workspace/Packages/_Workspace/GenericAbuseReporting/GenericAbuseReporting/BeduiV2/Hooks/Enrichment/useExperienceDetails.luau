local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local dataHydrationModule = require(parent.DataHydration)
local signalsReactModule = require(parent.SignalsReact)

return function(p1)
	-- upvalues: signalsReactModule (ref), dataHydrationModule (ref)
	return signalsReactModule.useSignalState(dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(p1).data)
end