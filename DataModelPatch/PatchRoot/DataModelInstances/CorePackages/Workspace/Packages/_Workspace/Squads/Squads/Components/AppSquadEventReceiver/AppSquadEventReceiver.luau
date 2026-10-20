local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local ExperienceService = require(Parent.ExperienceService).ExperienceService
local AppSquadTopBannerEventReceiverModule = require(script.Parent.AppSquadTopBannerEventReceiver)
local DependenciesModule = require(Squads.dependencies)
local React = DependenciesModule.React
local RoduxSquads = DependenciesModule.RoduxSquads
local SquadEventReceiverModule = require(Parent.SquadsCore.SquadEventReceiver)
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseCanAccessPartyModule = require(Squads.Hooks.useCanAccessParty)
local CurrentSquadUpdatedFunction = RoduxSquads.Actions.CurrentSquadUpdated

return function(_)
	-- upvalues: UseDispatchFunction (copy), React (copy), UseSelectorFunction (copy), ExperienceService (copy), RoduxSquads (copy), UseCanAccessPartyModule (copy), CurrentSquadUpdatedFunction (copy), AppSquadTopBannerEventReceiverModule (copy), SquadEventReceiverModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseSelectorResult = UseSelectorFunction((React.useCallback(function(p1)
		return if p1.Squad and p1.Squad.Squad then p1.Squad.Squad.currentExperienceInvite else nil
	end, {})))
	local UseSelectorResult1 = UseSelectorFunction((React.useCallback(function(p1)
		return if p1.Squad and p1.Squad.Squad and p1.Squad.Squad.currentSquadPersist then p1.Squad.Squad.currentSquadPersist.isPaused else false
	end, {})))
	React.useEffect(function()
		-- upvalues: ExperienceService (upval), RoduxSquads (upval), UseDispatchResult (copy)
		ExperienceService:RegisterForExperienceJoin(function()
			-- upvalues: RoduxSquads (upval), UseDispatchResult (upval)
			RoduxSquads.PersistManagers.currentSquadPersistManager.pause(UseDispatchResult)
		end)
		ExperienceService:RegisterForExperienceLeave(function()
			-- upvalues: RoduxSquads (upval), UseDispatchResult (upval)
			RoduxSquads.PersistManagers.currentSquadPersistManager.persistAndUpdateState(UseDispatchResult)
		end)
	end, { UseDispatchResult })
	React.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseSelectorResult1 (copy), UseDispatchResult (copy), RoduxSquads (upval)
		if UseSelectorResult and UseSelectorResult1 then
			UseDispatchResult(RoduxSquads.Actions.CurrentExperienceInviteDismissed(UseSelectorResult.notification.notificationId))
		end
	end, { UseSelectorResult, UseSelectorResult1 })
	local UseCanAccessPartyModuleResult = UseCanAccessPartyModule()
	React.useEffect(function()
		-- upvalues: UseCanAccessPartyModuleResult (copy), UseDispatchResult (copy), CurrentSquadUpdatedFunction (upval)
		if not UseCanAccessPartyModuleResult then
			UseDispatchResult(CurrentSquadUpdatedFunction(nil))
		end
	end, { UseCanAccessPartyModuleResult })
	
	return React.createElement(React.Fragment, nil, {
		appSquadTopBannerEventReceiver = React.createElement(AppSquadTopBannerEventReceiverModule),
		squadEventReceiver = if UseCanAccessPartyModuleResult and not UseSelectorResult1 then React.createElement(SquadEventReceiverModule) else nil
	})
end