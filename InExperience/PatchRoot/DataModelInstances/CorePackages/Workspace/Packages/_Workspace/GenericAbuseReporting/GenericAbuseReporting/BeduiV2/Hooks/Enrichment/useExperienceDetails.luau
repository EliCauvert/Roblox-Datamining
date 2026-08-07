local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local dataHydrationModule = require(parent.DataHydration)
local signalsReactModule = require(parent.SignalsReact)

return function(p0) --[[ line: 9 | named "useExperienceDetails" ]]
	-- upvalues: signalsReactModule (ref), dataHydrationModule (ref)
	return signalsReactModule.useSignalState(dataHydrationModule.Game.getGameInfoStore(false).getAndFetchGameInfo(p0).data)
end