local parent = script:FindFirstAncestor("GameHydrationReact").Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local dataHydrationModule = require(parent.DataHydration)

return function(p0) --[[ line: 14 | named "useGameVotes" ]]
	-- upvalues: reactModule (ref), dataHydrationModule (ref), signalsReactModule (ref)
	local var3 = tostring(p0)
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 17 ]]
		-- upvalues: dataHydrationModule (copy), var3 (ref)
		return dataHydrationModule.Game.getVotesStore(false).getVote(var3).data
	end, { var3 }))
end