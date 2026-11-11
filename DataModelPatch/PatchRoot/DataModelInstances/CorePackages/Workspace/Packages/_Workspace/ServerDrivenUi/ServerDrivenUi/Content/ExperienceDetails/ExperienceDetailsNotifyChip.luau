local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local Game1 = require(Parent.DataHydration).Game
local SduiChip = require(Parent.SduiSharedContent).SduiChip
local ToastRoduxModule = require(Parent.ToastRodux)
local ToastType = ToastRoduxModule.Enums.ToastType
local SetCurrentToastMessageFunction = ToastRoduxModule.Actions.SetCurrentToastMessage
local GameFollowFunction = require(Parent.DiscoveryAnalytics).Events.gameFollow
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseOptimisticUpdateStatusModule = require(ServerDrivenUi.Content.ExperienceDetails.Hooks.useOptimisticUpdateStatus)

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), SignalsReactModule (copy), Game1 (copy), UseLocalizationFunction (copy), ReactModule (copy), Players (copy), GameFollowFunction (copy), SetCurrentToastMessageFunction (copy), ToastType (copy), UseOptimisticUpdateStatusModule (copy), UseAppPolicyFunction (copy), SduiChip (copy), FoundationModule (copy)
	local LayoutOrder = p1.layoutOrder
	local UniverseId = p1.universeId
	local UseDispatchResult = UseDispatchFunction()
	local UseSignalStateResult = SignalsReactModule.useSignalState(Game1.getFollowingsStore(false).getAndFetchFollowing(UniverseId).data)
	local IsFollowing = UseSignalStateResult and UseSignalStateResult.isFollowing or false
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(Game1.getGameInfoStore(false).getAndFetchGameInfo(UniverseId).data)
	local Name = UseSignalStateResult1 and UseSignalStateResult1.name or ""
	local UseLocalizationResult = UseLocalizationFunction({
		notifications = "Feature.GameFollows.LabelNotifications",
		notificationsTurnedOn = {
			"Feature.GameFollows.TooltipTurnedOnNotifications",
			experienceName = Name
		},
		notificationsTurnedOff = {
			"Feature.GameFollows.TooltipTurnedOffNotifications",
			experienceName = Name
		}
	})
	local RootPlaceId = UseSignalStateResult1 and UseSignalStateResult1.rootPlaceId or nil
	local UseOptimisticUpdateStatusModuleResult = UseOptimisticUpdateStatusModule(ReactModule.useCallback(function()
		-- upvalues: IsFollowing (copy), RootPlaceId (copy), Players (upval), GameFollowFunction (upval), Game1 (upval), UniverseId (copy)
		local NoIsFollowing = not IsFollowing
		
		if RootPlaceId then
			GameFollowFunction({
				ctx = "ExperienceDetailsNotifyChip",
				uid = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId),
				placeId = RootPlaceId,
				state = if NoIsFollowing then "on" else "off"
			}, "ExperienceDetailsNotifyChip")
		end
		return Game1.getFollowingsStore(false).updateFollowing(UniverseId, NoIsFollowing)
	end, { UniverseId, RootPlaceId, IsFollowing }), (ReactModule.useCallback(function(p2)
		-- upvalues: UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), ToastType (upval), UseLocalizationResult (copy)
		if not p2 then return end
		if p2.type == "error" then
			UseDispatchResult(SetCurrentToastMessageFunction({
				toastType = if p2.errorType == "LimitReached" then ToastType.GameFollowError else ToastType.NetworkingError,
				toastMessage = if p2.errorType == "LimitReached" then "Feature.GameFollows.TooltipNotificationsLimitReached" elseif p2.errorType == "NetworkError" then "Feature.Toast.NetworkingError.SomethingIsWrong" else "Feature.GameFollows.TooltipFollowLimitReached"
			}))
			
			return
		end
		if p2.type == "success" then
			if p2.isFollowing then
				UseDispatchResult(SetCurrentToastMessageFunction({
					isLocalized = true,
					toastType = ToastType.NotificationsTurnedOn,
					toastMessage = UseLocalizationResult.notificationsTurnedOn
				}))
				
				return
			end
			UseDispatchResult(SetCurrentToastMessageFunction({
				isLocalized = true,
				toastType = ToastType.NotificationsTurnedOff,
				toastMessage = UseLocalizationResult.notificationsTurnedOff
			}))
		end
	end, { UseDispatchResult, Name, UseLocalizationResult })))
	
	return if UseAppPolicyFunction(function(p2)
		return p2.getNotificationsCanReceiveExperience()
	end) then ReactModule.createElement(SduiChip, {
		text = UseLocalizationResult.notifications,
		leadingIconName = FoundationModule.Enums.IconName.Bell,
		leadingIconVariant = if IsFollowing then FoundationModule.Enums.IconVariant.Filled else nil,
		onActivated = UseOptimisticUpdateStatusModuleResult,
		layoutOrder = LayoutOrder
	}) else nil
end)