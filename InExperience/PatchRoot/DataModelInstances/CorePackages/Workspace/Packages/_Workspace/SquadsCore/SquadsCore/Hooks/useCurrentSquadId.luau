local parent = script:FindFirstAncestor("SquadsCore").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

function useCurrentSquadId()
	-- upvalues: reactModule (ref), useSelector (ref)
	return useSelector(reactModule.useCallback(function(p1)
		return if p1.Squad and p1.Squad.Squad and (p1.Squad.Squad.currentSquad and p1.Squad.Squad.currentSquad.squadId ~= "") then p1.Squad.Squad.currentSquad.squadId else nil
	end, {}))
end

return useCurrentSquadId