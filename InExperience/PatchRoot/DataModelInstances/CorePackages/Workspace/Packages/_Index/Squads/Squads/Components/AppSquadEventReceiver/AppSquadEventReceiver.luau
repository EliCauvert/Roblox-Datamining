local Squads = script:FindFirstAncestor("Squads")
local Parent = Squads.Parent
local ExperienceService = require(Parent.ExperienceService).ExperienceService
local AppSquadTopBannerEventReceiverModule = require(script.Parent.AppSquadTopBannerEventReceiver)
local DependenciesModule = require(Squads.dependencies)
local React = DependenciesModule.React
local RoduxSquads = DependenciesModule.RoduxSquads
local SquadEventReceiverModule = require(Parent.SquadsCore.SquadEventReceiver)
local GetSquadExperienceInviteStoreFunction = require(Parent.SquadsCore.Stores).GetSquadExperienceInviteStore
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local UseDispatchFunction = DependenciesModule.Hooks.useDispatch
local UseSelectorFunction = DependenciesModule.Hooks.useSelector
local UseCanAccessPartyModule = require(Squads.Hooks.useCanAccessParty)
local CurrentSquadUpdatedFunction = RoduxSquads.Actions.CurrentSquadUpdated
local FFlagUseSignalsForSquadExperienceInvite = DependenciesModule.SharedFlags.FFlagUseSignalsForSquadExperienceInvite

return function(_)
	-- upvalues: UseDispatchFunction (copy), React (copy), FFlagUseSignalsForSquadExperienceInvite (copy), UseSignalStateFunction (copy), GetSquadExperienceInviteStoreFunction (copy), UseSelectorFunction (copy), ExperienceService (copy), RoduxSquads (copy), UseCanAccessPartyModule (copy), CurrentSquadUpdatedFunction (copy), AppSquadTopBannerEventReceiverModule (copy), SquadEventReceiverModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = React.useCallback(function(p1)
		return if p1.Squad and p1.Squad.Squad then p1.Squad.Squad.currentExperienceInvite else nil
	end, {})
	local UseSignalStateResult = if FFlagUseSignalsForSquadExperienceInvite then UseSignalStateFunction(GetSquadExperienceInviteStoreFunction(false).getCurrentExperienceInvite) else UseSelectorFunction(UseResult)
	local UseSelectorResult = UseSelectorFunction((React.useCallback(function(p1)
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
		-- upvalues: UseSignalStateResult (copy), UseSelectorResult (copy), FFlagUseSignalsForSquadExperienceInvite (upval), GetSquadExperienceInviteStoreFunction (upval), UseDispatchResult (copy), RoduxSquads (upval)
		if UseSignalStateResult and UseSelectorResult then
			if FFlagUseSignalsForSquadExperienceInvite then
				GetSquadExperienceInviteStoreFunction(false).currentExperienceInviteDismissed(UseSignalStateResult.notification.notificationId)
				
				return
			end
			UseDispatchResult(RoduxSquads.Actions.CurrentExperienceInviteDismissed(UseSignalStateResult.notification.notificationId))
		end
	end, { UseSignalStateResult, UseSelectorResult })
	local UseCanAccessPartyModuleResult = UseCanAccessPartyModule()
	React.useEffect(function()
		-- upvalues: UseCanAccessPartyModuleResult (copy), UseDispatchResult (copy), CurrentSquadUpdatedFunction (upval)
		if not UseCanAccessPartyModuleResult then
			UseDispatchResult(CurrentSquadUpdatedFunction(nil))
		end
	end, { UseCanAccessPartyModuleResult })
	
	return React.createElement(React.Fragment, nil, {
		appSquadTopBannerEventReceiver = React.createElement(AppSquadTopBannerEventReceiverModule),
		squadEventReceiver = if UseCanAccessPartyModuleResult and not UseSelectorResult then React.createElement(SquadEventReceiverModule) else nil
	})
end