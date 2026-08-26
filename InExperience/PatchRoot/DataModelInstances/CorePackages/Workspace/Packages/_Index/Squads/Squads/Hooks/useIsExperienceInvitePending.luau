local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local dependenciesModule = require(squads.dependencies)
local networkingSquads = dependenciesModule.NetworkingSquads
local networkStatus = dependenciesModule.RoduxNetworking.Enum.NetworkStatus
local useSelector = dependenciesModule.Hooks.useSelector
local useSignalState = require(parent.SignalsReact).useSignalState
local hooksModule = require(parent.SquadsCore.Hooks)
local useCurrentSquadId = hooksModule.useCurrentSquadId
local useIsExperienceInviteRetryBlocked = hooksModule.useIsExperienceInviteRetryBlocked
local getSquadExperienceInviteStore = require(parent.SquadsCore.Stores).GetSquadExperienceInviteStore
local fFlagUseSignalsForSquadExperienceInviteStatus = dependenciesModule.SharedFlags.FFlagUseSignalsForSquadExperienceInviteStatus
local fFlagSquadExperienceInviteRetryAfter = require(parent.SquadsCore.Flags).FFlagSquadExperienceInviteRetryAfter

local function _(p1)
	local squad = p1.Squad and p1.Squad.Squad
	
	return squad and (squad.currentSquad and squad.currentSquad.squadId)
end

local function selectHasCurrentSquadId(p1)
	local squad = p1.Squad and p1.Squad.Squad
	
	return (squad and (squad.currentSquad and squad.currentSquad.squadId)) ~= nil
end

local function selectHasInFlightOrExistingInvite(p1)
	-- upvalues: networkingSquads (ref), networkStatus (ref)
	local squad = p1.Squad and p1.Squad.Squad
	local squadId = squad and (squad.currentSquad and squad.currentSquad.squadId)
	
	return if squadId then if networkingSquads.CreateExperienceInvite.getStatus(p1, squadId) ~= networkStatus.Fetching then p1.Squad.Squad.currentExperienceInvite ~= nil else true else false
end

return function()
	-- upvalues: fFlagSquadExperienceInviteRetryAfter (ref), useCurrentSquadId (ref), useIsExperienceInviteRetryBlocked (ref), fFlagUseSignalsForSquadExperienceInviteStatus (ref), useSelector (ref), selectHasCurrentSquadId (ref), selectHasInFlightOrExistingInvite (ref), useSignalState (ref), getSquadExperienceInviteStore (ref), networkingSquads (ref), networkStatus (ref)
	local var1 = if fFlagSquadExperienceInviteRetryAfter then useIsExperienceInviteRetryBlocked(if fFlagSquadExperienceInviteRetryAfter then useCurrentSquadId() else nil) else false
	
	return if fFlagUseSignalsForSquadExperienceInviteStatus then useSelector(selectHasCurrentSquadId) and (useSignalState(getSquadExperienceInviteStore(false).getIsExperienceInvitePending) or (useSelector(selectHasInFlightOrExistingInvite) or var1)) else useSelector(function(p1)
		-- upvalues: networkingSquads (copy), networkStatus (copy)
		local squad = p1.Squad and p1.Squad.Squad
		local squadId = squad and (squad.currentSquad and squad.currentSquad.squadId)
		
		return if squadId then if squad and squad.currentExperienceInviteStatus then true else networkingSquads.CreateExperienceInvite.getStatus(p1, squadId) == networkStatus.Fetching or squad and squad.currentExperienceInvite else false
	end) or var1
end