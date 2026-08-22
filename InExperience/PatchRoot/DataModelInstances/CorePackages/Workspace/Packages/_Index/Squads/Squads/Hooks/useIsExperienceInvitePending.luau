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

local function _(p0) --[[ line: 20 | named "getCurrentSquadId" ]]
	local squad = p0.Squad and p0.Squad.Squad
	
	return squad and (squad.currentSquad and squad.currentSquad.squadId)
end

local function selectHasCurrentSquadId(p1) --[[ line: 25 ]]
	local squad = p1.Squad and p1.Squad.Squad
	
	return (squad and (squad.currentSquad and squad.currentSquad.squadId)) ~= nil
end

local function selectHasInFlightOrExistingInvite(p2) --[[ line: 31 ]]
	-- upvalues: networkingSquads (ref), networkStatus (ref)
	local squad = p2.Squad and p2.Squad.Squad
	local squadId = squad and (squad.currentSquad and squad.currentSquad.squadId)
	
	return if squadId then if networkingSquads.CreateExperienceInvite.getStatus(p2, squadId) ~= networkStatus.Fetching then p2.Squad.Squad.currentExperienceInvite ~= nil else true else false
end

return function() --[[ line: 43 | named "useIsExperienceInvitePending" ]]
	-- upvalues: fFlagSquadExperienceInviteRetryAfter (ref), useCurrentSquadId (ref), useIsExperienceInviteRetryBlocked (ref), fFlagUseSignalsForSquadExperienceInviteStatus (ref), useSelector (ref), selectHasCurrentSquadId (ref), selectHasInFlightOrExistingInvite (ref), useSignalState (ref), getSquadExperienceInviteStore (ref), networkingSquads (ref), networkStatus (ref)
	local var9 = if fFlagSquadExperienceInviteRetryAfter then useIsExperienceInviteRetryBlocked(if fFlagSquadExperienceInviteRetryAfter then useCurrentSquadId() else nil) else false
	
	return if fFlagUseSignalsForSquadExperienceInviteStatus then useSelector(selectHasCurrentSquadId) and (useSignalState(getSquadExperienceInviteStore(false).getIsExperienceInvitePending) or (useSelector(selectHasInFlightOrExistingInvite) or var9)) else useSelector(function(p3) --[[ line: 58 ]]
		-- upvalues: networkingSquads (copy), networkStatus (copy)
		local squad = p3.Squad and p3.Squad.Squad
		local squadId = squad and (squad.currentSquad and squad.currentSquad.squadId)
		
		return if squadId then if squad and squad.currentExperienceInviteStatus then true else networkingSquads.CreateExperienceInvite.getStatus(p3, squadId) == networkStatus.Fetching or squad and squad.currentExperienceInvite else false
	end) or var9
end