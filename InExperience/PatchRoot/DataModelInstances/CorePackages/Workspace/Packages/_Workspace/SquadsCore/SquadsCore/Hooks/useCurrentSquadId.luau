local Parent = script:FindFirstAncestor("SquadsCore").Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

function useCurrentSquadId()
	-- upvalues: ReactModule (copy), UseSelectorFunction (copy)
	return (UseSelectorFunction((ReactModule.useCallback(function(p1)
		return if p1.Squad and p1.Squad.Squad and p1.Squad.Squad.currentSquad and p1.Squad.Squad.currentSquad.squadId ~= "" then p1.Squad.Squad.currentSquad.squadId else nil
	end, {}))))
end

return useCurrentSquadId