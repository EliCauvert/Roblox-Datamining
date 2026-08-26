local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local playersService = game:GetService("Players")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local signalsReactModule = require(parent.SignalsReact)
local game = require(parent.DataHydration).Game
local roactUtilsModule = require(parent.RoactUtils)
local localizationModule = require(parent.Localization)
local sduiChip = require(parent.SduiSharedContent).SduiChip
local toastRoduxModule = require(parent.ToastRodux)
local toastType = toastRoduxModule.Enums.ToastType
local setCurrentToastMessage = toastRoduxModule.Actions.SetCurrentToastMessage
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local gameFollow = require(parent.DiscoveryAnalytics).Events.gameFollow
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization
local useAppPolicy = universalAppPolicyModule.useAppPolicy
local useOptimisticUpdateStatusModule = require(serverDrivenUi.Content.ExperienceDetails.Hooks.useOptimisticUpdateStatus)

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), signalsReactModule (ref), game (ref), useLocalization (ref), reactModule (ref), playersService (ref), gameFollow (ref), setCurrentToastMessage (ref), toastType (ref), useOptimisticUpdateStatusModule (ref), useAppPolicy (ref), sduiChip (ref), foundationModule (ref)
	local layoutOrder = p1.layoutOrder
	local universeId = p1.universeId
	local var1 = useDispatch()
	local var2 = signalsReactModule.useSignalState(game.getFollowingsStore(false).getAndFetchFollowing(universeId).data)
	local var3 = if var2 then var2.isFollowing else false
	local var4 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local var5 = if var4 then var4.name else ""
	local var6 = useLocalization({
		notifications = "Feature.GameFollows.LabelNotifications",
		notificationsTurnedOn = {
			"Feature.GameFollows.TooltipTurnedOnNotifications",
			experienceName = var5
		},
		notificationsTurnedOff = {
			"Feature.GameFollows.TooltipTurnedOffNotifications",
			experienceName = var5
		}
	})
	local var7 = if var4 then var4.rootPlaceId else nil
	
	return if useAppPolicy(function(p2)
		return p2.getNotificationsCanReceiveExperience()
	end) then reactModule.createElement(sduiChip, {
		text = var6.notifications,
		leadingIconName = foundationModule.Enums.IconName.Bell,
		leadingIconVariant = if var3 then foundationModule.Enums.IconVariant.Filled else nil,
		onActivated = useOptimisticUpdateStatusModule(reactModule.useCallback(function()
			-- upvalues: var3 (ref), var7 (ref), playersService (copy), gameFollow (copy), game (copy), universeId (ref)
			local var8 = not var3
			
			if var7 then
				gameFollow({
					ctx = "ExperienceDetailsNotifyChip",
					uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
					placeId = var7,
					state = if var8 then "on" else "off"
				}, "ExperienceDetailsNotifyChip")
			end
			return game.getFollowingsStore(false).updateFollowing(universeId, var8)
		end, { universeId, var7, var3 }), reactModule.useCallback(function(p2)
			-- upvalues: var1 (ref), setCurrentToastMessage (copy), toastType (copy), var6 (ref)
			if not p2 then return end
			if p2.type == "error" then
				local var8 = "Feature.GameFollows.TooltipFollowLimitReached"
				
				if p2.errorType == "LimitReached" then
					var8 = "Feature.GameFollows.TooltipNotificationsLimitReached"
				elseif p2.errorType == "NetworkError" then
					var8 = "Feature.Toast.NetworkingError.SomethingIsWrong"
				end
				var1(setCurrentToastMessage({
					toastType = if p2.errorType == "LimitReached" then toastType.GameFollowError else toastType.NetworkingError,
					toastMessage = var8
				}))
				
				return
			elseif p2.type == "success" then
				if p2.isFollowing then
					var1(setCurrentToastMessage({
						isLocalized = true,
						toastType = toastType.NotificationsTurnedOn,
						toastMessage = var6.notificationsTurnedOn
					}))
					
					return
				end
				var1(setCurrentToastMessage({
					isLocalized = true,
					toastType = toastType.NotificationsTurnedOff,
					toastMessage = var6.notificationsTurnedOff
				}))
			end
		end, { var1, var5, var6 })),
		layoutOrder = layoutOrder
	}) else nil
end)