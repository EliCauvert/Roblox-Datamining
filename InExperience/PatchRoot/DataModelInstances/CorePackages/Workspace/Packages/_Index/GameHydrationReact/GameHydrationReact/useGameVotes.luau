local Parent = script:FindFirstAncestor("GameHydrationReact").Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local DataHydrationModule = require(Parent.DataHydration)

return function(p1) --[[ Line: 14 | Named "useGameVotes" ]]
	-- upvalues: ReactModule (copy), DataHydrationModule (copy), SignalsReactModule (copy)
	local Text = tostring(p1)
	
	return SignalsReactModule.useSignalState((ReactModule.useMemo(function() --[[ Line: 17 ]]
		-- upvalues: DataHydrationModule (upval), Text (copy)
		return DataHydrationModule.Game.getVotesStore(false).getVote(Text).data
	end, { Text })))
end