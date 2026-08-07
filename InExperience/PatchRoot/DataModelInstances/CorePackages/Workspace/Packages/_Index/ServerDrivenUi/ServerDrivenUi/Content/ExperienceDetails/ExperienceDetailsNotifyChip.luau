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

return reactModule.memo(function(p0) --[[ line: 37 | named "ExperienceDetailsNotifyChip" ]]
	-- upvalues: useDispatch (ref), signalsReactModule (ref), game (ref), useLocalization (ref), reactModule (ref), playersService (ref), gameFollow (ref), setCurrentToastMessage (ref), toastType (ref), useOptimisticUpdateStatusModule (ref), useAppPolicy (ref), sduiChip (ref), foundationModule (ref)
	local layoutOrder = p0.layoutOrder
	local universeId = p0.universeId
	local var10 = useDispatch()
	local var11 = signalsReactModule.useSignalState(game.getFollowingsStore(false).getAndFetchFollowing(universeId).data)
	local var12 = if var11 then var11.isFollowing else false
	local var13 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local var14 = if var13 then var13.name else ""
	local var15 = useLocalization({
		notifications = "Feature.GameFollows.LabelNotifications",
		notificationsTurnedOn = {
			"Feature.GameFollows.TooltipTurnedOnNotifications",
			experienceName = var14
		},
		notificationsTurnedOff = {
			"Feature.GameFollows.TooltipTurnedOffNotifications",
			experienceName = var14
		}
	})
	local var16 = if var13 then var13.rootPlaceId else nil
	
	return if useAppPolicy(function(p1) --[[ line: 112 ]]
		return p1.getNotificationsCanReceiveExperience()
	end) then reactModule.createElement(sduiChip, {
		text = var15.notifications,
		leadingIconName = foundationModule.Enums.IconName.Bell,
		leadingIconVariant = if var12 then foundationModule.Enums.IconVariant.Filled else nil,
		onActivated = useOptimisticUpdateStatusModule(reactModule.useCallback(function() --[[ line: 58 ]]
			-- upvalues: var12 (ref), var16 (ref), playersService (copy), gameFollow (copy), game (copy), universeId (ref)
			local var17 = not var12
			
			if var16 then
				gameFollow({
					ctx = "ExperienceDetailsNotifyChip",
					uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
					placeId = var16,
					state = if var17 then "on" else "off"
				}, "ExperienceDetailsNotifyChip")
			end
			return game.getFollowingsStore(false).updateFollowing(universeId, var17)
		end, { universeId, var16, var12 }), reactModule.useCallback(function(p2) --[[ line: 74 ]]
			-- upvalues: var10 (ref), setCurrentToastMessage (copy), toastType (copy), var15 (ref)
			if not p2 then return end
			if p2.type == "error" then
				local var18 = "Feature.GameFollows.TooltipFollowLimitReached"
				
				if p2.errorType == "LimitReached" then
					var18 = "Feature.GameFollows.TooltipNotificationsLimitReached"
				elseif p2.errorType == "NetworkError" then
					var18 = "Feature.Toast.NetworkingError.SomethingIsWrong"
				end
				var10(setCurrentToastMessage({
					toastType = if p2.errorType == "LimitReached" then toastType.GameFollowError else toastType.NetworkingError,
					toastMessage = var18
				}))
				
				return
			elseif p2.type == "success" then
				if p2.isFollowing then
					var10(setCurrentToastMessage({
						isLocalized = true,
						toastType = toastType.NotificationsTurnedOn,
						toastMessage = var15.notificationsTurnedOn
					}))
					
					return
				end
				var10(setCurrentToastMessage({
					isLocalized = true,
					toastType = toastType.NotificationsTurnedOff,
					toastMessage = var15.notificationsTurnedOff
				}))
			end
		end, { var10, var14, var15 })),
		layoutOrder = layoutOrder
	}) else nil
end)