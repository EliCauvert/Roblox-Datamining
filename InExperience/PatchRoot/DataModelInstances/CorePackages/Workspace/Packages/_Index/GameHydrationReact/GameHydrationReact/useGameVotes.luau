local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)

return function(p1)
	-- upvalues: reactModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local var1 = tostring(p1)
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: dataHydrationModule (copy), var1 (ref)
		return dataHydrationModule.Game.getVotesStore(false).getVote(var1).data
	end, { var1 }))
end