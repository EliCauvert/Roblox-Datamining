local Parent = script:FindFirstAncestor("SquadsCore").Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector

function useCurrentSquadParentChannelId() --[[ Line: 7 ]]
	-- upvalues: ReactModule (copy), UseSelectorFunction (copy)
	return (UseSelectorFunction((ReactModule.useCallback(function(p1) --[[ Line: 8 ]]
		return if p1.Squad and p1.Squad.Squad and p1.Squad.Squad.currentSquad and p1.Squad.Squad.currentSquad.parentChannelId ~= "" then p1.Squad.Squad.currentSquad.parentChannelId else nil
	end, {}))))
end

return useCurrentSquadParentChannelId