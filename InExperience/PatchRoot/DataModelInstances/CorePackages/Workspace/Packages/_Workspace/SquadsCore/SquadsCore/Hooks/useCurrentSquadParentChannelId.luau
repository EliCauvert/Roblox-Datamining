local parent = script:FindFirstAncestor("SquadsCore").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

function useCurrentSquadParentChannelId()
	-- upvalues: reactModule (ref), useSelector (ref)
	return useSelector(reactModule.useCallback(function(p1)
		return if p1.Squad and p1.Squad.Squad and (p1.Squad.Squad.currentSquad and p1.Squad.Squad.currentSquad.parentChannelId ~= "") then p1.Squad.Squad.currentSquad.parentChannelId else nil
	end, {}))
end

return useCurrentSquadParentChannelId