local parent = script:FindFirstAncestor("GameDetail").Parent
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)

return function(p0) --[[ line: 9 | named "useGameInfo" ]]
	-- upvalues: signalsReactModule (ref), dataHydrationModule (ref)
	return signalsReactModule.useSignalState(dataHydrationModule.Game.getGameInfoStore(false).getGameInfo(p0).data)
end