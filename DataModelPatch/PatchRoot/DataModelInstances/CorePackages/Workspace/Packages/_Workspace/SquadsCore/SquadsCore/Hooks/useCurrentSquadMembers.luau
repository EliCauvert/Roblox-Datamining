local Parent = script:FindFirstAncestor("SquadsCore").Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

function useCurrentSquadMembers()
	-- upvalues: ReactModule (copy), UseSelectorFunction (copy)
	return (UseSelectorFunction((ReactModule.useCallback(function(p1)
		return if p1.Squad and p1.Squad.Squad and p1.Squad.Squad.currentSquad and p1.Squad.Squad.currentSquad.members then p1.Squad.Squad.currentSquad.members else nil
	end, {}))))
end

return useCurrentSquadMembers