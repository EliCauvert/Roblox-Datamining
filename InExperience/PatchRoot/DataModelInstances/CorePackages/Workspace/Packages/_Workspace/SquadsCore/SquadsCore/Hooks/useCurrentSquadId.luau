local parent = script:FindFirstAncestor("SquadsCore").Parent
local reactModule = require(parent.React)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector

function useCurrentSquadId() --[[ line: 7 ]]
	-- upvalues: reactModule (ref), useSelector (ref)
	return useSelector(reactModule.useCallback(function(p0) --[[ line: 8 ]]
		return if p0.Squad and p0.Squad.Squad and (p0.Squad.Squad.currentSquad and p0.Squad.Squad.currentSquad.squadId ~= "") then p0.Squad.Squad.currentSquad.squadId else nil
	end, {}))
end

return useCurrentSquadId