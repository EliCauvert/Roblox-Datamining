local parent = script:FindFirstAncestor("SquadsCore").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

function useCurrentSquadMembers()
	-- upvalues: reactModule (ref), useSelector (ref)
	return useSelector(reactModule.useCallback(function(p0)
		return if p0.Squad and p0.Squad.Squad and (p0.Squad.Squad.currentSquad and p0.Squad.Squad.currentSquad.members) then p0.Squad.Squad.currentSquad.members else nil
	end, {}))
end

return useCurrentSquadMembers