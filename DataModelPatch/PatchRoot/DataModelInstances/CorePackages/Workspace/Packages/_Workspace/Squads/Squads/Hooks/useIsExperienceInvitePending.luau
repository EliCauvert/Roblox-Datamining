local DependenciesModule = require(script:FindFirstAncestor("Squads").dependencies)
local NetworkingSquads = DependenciesModule.NetworkingSquads
local NetworkStatus = DependenciesModule.RoduxNetworking.Enum.NetworkStatus
local UseSelectorFunction = DependenciesModule.Hooks.useSelector

return function()
	-- upvalues: UseSelectorFunction (copy), NetworkingSquads (copy), NetworkStatus (copy)
	return (UseSelectorFunction(function(p1): boolean
		-- upvalues: NetworkingSquads (upval), NetworkStatus (upval)
		local Squad = p1.Squad and p1.Squad.Squad
		local SquadId = Squad and (Squad.currentSquad and Squad.currentSquad.squadId)
		
		if not SquadId then
			return false
		elseif Squad and Squad.currentExperienceInviteStatus then
			return true
		else
			local Status = NetworkingSquads.CreateExperienceInvite.getStatus(p1, SquadId)
			local CurrentExperienceInvite = Squad and Squad.currentExperienceInvite
			
			return if Status == NetworkStatus.Fetching or CurrentExperienceInvite then true else false
		end
	end))
end