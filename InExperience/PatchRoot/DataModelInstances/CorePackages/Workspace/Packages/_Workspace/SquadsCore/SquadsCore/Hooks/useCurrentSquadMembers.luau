local parent = script:FindFirstAncestor("SquadsCore").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

function useCurrentSquadMembers()
	-- upvalues: reactModule (ref), useSelector (ref)
	return useSelector(reactModule.useCallback(function(p1)
		return if p1.Squad and p1.Squad.Squad and (p1.Squad.Squad.currentSquad and p1.Squad.Squad.currentSquad.members) then p1.Squad.Squad.currentSquad.members else nil
	end, {}))
end

return useCurrentSquadMembers