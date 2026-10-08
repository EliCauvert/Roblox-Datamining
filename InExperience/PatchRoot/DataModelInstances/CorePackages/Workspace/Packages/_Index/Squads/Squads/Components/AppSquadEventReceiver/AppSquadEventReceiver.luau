local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local experienceService = require(parent.ExperienceService).ExperienceService
local appSquadTopBannerEventReceiverModule = require(script.Parent.AppSquadTopBannerEventReceiver)
local dependenciesModule = require(squads.dependencies)
local react = dependenciesModule.React
local roduxSquads = dependenciesModule.RoduxSquads
local squadEventReceiverModule = require(parent.SquadsCore.SquadEventReceiver)
local getSquadExperienceInviteStore = require(parent.SquadsCore.Stores).GetSquadExperienceInviteStore
local useSignalState = require(parent.SignalsReact).useSignalState
local useDispatch = dependenciesModule.Hooks.useDispatch
local useSelector = dependenciesModule.Hooks.useSelector
local useCanAccessPartyModule = require(squads.Hooks.useCanAccessParty)
local currentSquadUpdated = roduxSquads.Actions.CurrentSquadUpdated
local fFlagUseSignalsForSquadExperienceInvite = dependenciesModule.SharedFlags.FFlagUseSignalsForSquadExperienceInvite

return function(_)
	-- upvalues: useDispatch (ref), react (ref), fFlagUseSignalsForSquadExperienceInvite (ref), useSignalState (ref), getSquadExperienceInviteStore (ref), useSelector (ref), experienceService (ref), roduxSquads (ref), useCanAccessPartyModule (ref), currentSquadUpdated (ref), appSquadTopBannerEventReceiverModule (ref), squadEventReceiverModule (ref)
	local var1 = useDispatch()
	local var2 = if fFlagUseSignalsForSquadExperienceInvite then useSignalState(getSquadExperienceInviteStore(false).getCurrentExperienceInvite) else useSelector(react.useCallback(function(p1)
		return if p1.Squad and p1.Squad.Squad then p1.Squad.Squad.currentExperienceInvite else nil
	end, {}))
	local var3 = useSelector(react.useCallback(function(p1)
		return if p1.Squad and p1.Squad.Squad and p1.Squad.Squad.currentSquadPersist then p1.Squad.Squad.currentSquadPersist.isPaused else false
	end, {}))
	react.useEffect(function()
		-- upvalues: experienceService (copy), roduxSquads (copy), var1 (ref)
		experienceService:RegisterForExperienceJoin(function()
			-- upvalues: roduxSquads (copy), var1 (copy)
			roduxSquads.PersistManagers.currentSquadPersistManager.pause(var1)
		end)
		experienceService:RegisterForExperienceLeave(function()
			-- upvalues: roduxSquads (copy), var1 (copy)
			roduxSquads.PersistManagers.currentSquadPersistManager.persistAndUpdateState(var1)
		end)
	end, { var1 })
	react.useEffect(function()
		-- upvalues: var2 (ref), var3 (ref), fFlagUseSignalsForSquadExperienceInvite (copy), getSquadExperienceInviteStore (copy), var1 (ref), roduxSquads (copy)
		if var2 and var3 then
			if fFlagUseSignalsForSquadExperienceInvite then
				getSquadExperienceInviteStore(false).currentExperienceInviteDismissed(var2.notification.notificationId)
				
				return
			end
			var1(roduxSquads.Actions.CurrentExperienceInviteDismissed(var2.notification.notificationId))
		end
	end, { var2, var3 })
	local var4 = useCanAccessPartyModule()
	react.useEffect(function()
		-- upvalues: var4 (ref), var1 (ref), currentSquadUpdated (copy)
		if not var4 then
			var1(currentSquadUpdated(nil))
		end
	end, { var4 })
	
	return react.createElement(react.Fragment, nil, {
		appSquadTopBannerEventReceiver = react.createElement(appSquadTopBannerEventReceiverModule),
		squadEventReceiver = if var4 and not var3 then react.createElement(squadEventReceiverModule) else nil
	})
end