local parent = script:FindFirstAncestor("GameDetail").Parent
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)

return function(p1)
	-- upvalues: signalsReactModule (ref), dataHydrationModule (ref)
	return signalsReactModule.useSignalState(dataHydrationModule.Game.getGameInfoStore(false).getGameInfo(p1).data)
end