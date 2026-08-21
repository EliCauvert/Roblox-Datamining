local dependenciesModule = require(script:FindFirstAncestor("Squads").dependencies)
local networkingSquads = dependenciesModule.NetworkingSquads
local networkStatus = dependenciesModule.RoduxNetworking.Enum.NetworkStatus
local useSelector = dependenciesModule.Hooks.useSelector

return function() --[[ line: 8 | named "useIsExperienceInvitePending" ]]
	-- upvalues: useSelector (ref), networkingSquads (ref), networkStatus (ref)
	return useSelector(function(p0) --[[ line: 9 ]]
		-- upvalues: networkingSquads (copy), networkStatus (copy)
		local squad = p0.Squad and p0.Squad.Squad
		local squadId = squad and (squad.currentSquad and squad.currentSquad.squadId)
		
		return if squadId then if squad and squad.currentExperienceInviteStatus then true else networkingSquads.CreateExperienceInvite.getStatus(p0, squadId) == networkStatus.Fetching or squad and squad.currentExperienceInvite else false
	end)
end