local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local DependenciesModule = require(Squads.dependencies)
local NetworkingSquads = DependenciesModule.NetworkingSquads
local NetworkStatus = DependenciesModule.RoduxNetworking.Enum.NetworkStatus
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local HooksModule = require(Parent.SquadsCore.Hooks)
local UseCurrentSquadIdFunction = HooksModule.useCurrentSquadId
local UseIsExperienceInviteRetryBlockedFunction = HooksModule.useIsExperienceInviteRetryBlocked
local GetSquadExperienceInviteStoreFunction = require(Parent.SquadsCore.Stores).GetSquadExperienceInviteStore
local FFlagUseSignalsForSquadExperienceInviteStatus = DependenciesModule.SharedFlags.FFlagUseSignalsForSquadExperienceInviteStatus
local FFlagUseSignalsForSquadExperienceInvite = DependenciesModule.SharedFlags.FFlagUseSignalsForSquadExperienceInvite

local function _(p1) --[[ Line: 20 | Named "getCurrentSquadId" ]]
	local Squad = p1.Squad and p1.Squad.Squad
	
	return Squad and (Squad.currentSquad and Squad.currentSquad.squadId)
end

local function selectHasCurrentSquadId(p1): boolean --[[ Line: 25 ]]
	local Squad = p1.Squad and p1.Squad.Squad
	
	return (Squad and (Squad.currentSquad and Squad.currentSquad.squadId)) ~= nil
end

local function selectIsCreateExperienceInviteFetching(p1): boolean --[[ Line: 29 ]]
	-- upvalues: NetworkingSquads (copy), NetworkStatus (copy)
	local Squad = p1.Squad and p1.Squad.Squad
	local SquadId = Squad and (Squad.currentSquad and Squad.currentSquad.squadId)
	
	return SquadId ~= nil and NetworkingSquads.CreateExperienceInvite.getStatus(p1, SquadId) == NetworkStatus.Fetching
end

local function selectHasInFlightOrExistingInvite(p1): boolean --[[ Line: 35 ]]
	-- upvalues: NetworkingSquads (copy), NetworkStatus (copy)
	local Squad = p1.Squad and p1.Squad.Squad
	local SquadId = Squad and (Squad.currentSquad and Squad.currentSquad.squadId)
	
	return if SquadId then NetworkingSquads.CreateExperienceInvite.getStatus(p1, SquadId) == NetworkStatus.Fetching or p1.Squad.Squad.currentExperienceInvite ~= nil else false
end

return function() --[[ Line: 47 | Named "useIsExperienceInvitePending" ]]
	-- upvalues: UseCurrentSquadIdFunction (copy), UseIsExperienceInviteRetryBlockedFunction (copy), FFlagUseSignalsForSquadExperienceInviteStatus (copy), UseSelectorFunction (copy), selectHasCurrentSquadId (copy), FFlagUseSignalsForSquadExperienceInvite (copy), selectIsCreateExperienceInviteFetching (copy), UseSignalStateFunction (copy), GetSquadExperienceInviteStoreFunction (copy), selectHasInFlightOrExistingInvite (copy), NetworkingSquads (copy), NetworkStatus (copy)
	local UseIsExperienceInviteRetryBlockedResult = UseIsExperienceInviteRetryBlockedFunction((UseCurrentSquadIdFunction()))
	
	if not FFlagUseSignalsForSquadExperienceInviteStatus then
		return UseSelectorFunction(function(p1): boolean --[[ Line: 68 ]]
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
		end) or UseIsExperienceInviteRetryBlockedResult
	end
	local UseSelectorResult = UseSelectorFunction(selectHasCurrentSquadId)
	local UseSelectorResult1_1 = nil
	
	if FFlagUseSignalsForSquadExperienceInvite then
		local UseSelectorResult1 = UseSelectorFunction(selectIsCreateExperienceInviteFetching)
		local UseSignalStateResult = UseSignalStateFunction(GetSquadExperienceInviteStoreFunction(false).getHasCurrentExperienceInvite)
		UseSelectorResult1_1 = UseSelectorResult1 or UseSignalStateResult
	else
		UseSelectorResult1_1 = UseSelectorFunction(selectHasInFlightOrExistingInvite)
	end
	local UseSignalStateResult = UseSignalStateFunction(GetSquadExperienceInviteStoreFunction(false).getIsExperienceInvitePending)
	
	return UseSelectorResult and (UseSignalStateResult or UseSelectorResult1_1) or UseIsExperienceInviteRetryBlockedResult
end