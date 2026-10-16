local Parent = script:FindFirstAncestor("GameDetail").Parent
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)

return function(p1) --[[ Line: 9 | Named "useGameInfo" ]]
	-- upvalues: SignalsReactModule (copy), DataHydrationModule (copy)
	return SignalsReactModule.useSignalState(DataHydrationModule.Game.getGameInfoStore(false).getGameInfo(p1).data)
end