local squads = script:FindFirstAncestor("Squads")
local parent = squads.Parent
local experienceService = require(parent.ExperienceService).ExperienceService
local appSquadTopBannerEventReceiverModule = require(script.Parent.AppSquadTopBannerEventReceiver)
local dependenciesModule = require(squads.dependencies)
local react = dependenciesModule.React
local roduxSquads = dependenciesModule.RoduxSquads
local squadEventReceiverModule = require(parent.SquadsCore.SquadEventReceiver)
local useDispatch = dependenciesModule.Hooks.useDispatch
local useSelector = dependenciesModule.Hooks.useSelector
local useCanAccessPartyModule = require(squads.Hooks.useCanAccessParty)
local currentSquadUpdated = roduxSquads.Actions.CurrentSquadUpdated

return function(_)
	-- upvalues: useDispatch (ref), react (ref), useSelector (ref), experienceService (ref), roduxSquads (ref), useCanAccessPartyModule (ref), currentSquadUpdated (ref), appSquadTopBannerEventReceiverModule (ref), squadEventReceiverModule (ref)
	local var5 = useDispatch()
	local var6 = useSelector(react.useCallback(function(p0)
		return if p0.Squad and p0.Squad.Squad then p0.Squad.Squad.currentExperienceInvite else nil
	end, {}))
	local var7 = useSelector(react.useCallback(function(p1)
		return if p1.Squad and p1.Squad.Squad and p1.Squad.Squad.currentSquadPersist then p1.Squad.Squad.currentSquadPersist.isPaused else false
	end, {}))
	react.useEffect(function()
		-- upvalues: experienceService (copy), roduxSquads (copy), var5 (ref)
		experienceService:RegisterForExperienceJoin(function()
			-- upvalues: roduxSquads (copy), var5 (copy)
			roduxSquads.PersistManagers.currentSquadPersistManager.pause(var5)
		end)
		experienceService:RegisterForExperienceLeave(function()
			-- upvalues: roduxSquads (copy), var5 (copy)
			roduxSquads.PersistManagers.currentSquadPersistManager.persistAndUpdateState(var5)
		end)
	end, { var5 })
	react.useEffect(function()
		-- upvalues: var6 (ref), var7 (ref), var5 (ref), roduxSquads (copy)
		if var6 and var7 then
			var5(roduxSquads.Actions.CurrentExperienceInviteDismissed(var6.notification.notificationId))
		end
	end, { var6, var7 })
	local var8 = useCanAccessPartyModule()
	react.useEffect(function()
		-- upvalues: var8 (ref), var5 (ref), currentSquadUpdated (copy)
		if not var8 then
			var5(currentSquadUpdated(nil))
		end
	end, { var8 })
	
	return react.createElement(react.Fragment, nil, {
		appSquadTopBannerEventReceiver = react.createElement(appSquadTopBannerEventReceiverModule),
		squadEventReceiver = if var8 and not var7 then react.createElement(squadEventReceiverModule) else nil
	})
end