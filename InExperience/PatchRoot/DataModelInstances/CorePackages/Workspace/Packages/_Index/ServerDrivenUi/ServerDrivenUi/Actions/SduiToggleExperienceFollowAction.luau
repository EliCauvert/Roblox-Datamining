local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local dataHydrationModule = require(parent.DataHydration)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local foundationModule = require(parent.Foundation)
local game = dataHydrationModule.Game
local signalsModule = require(parent.Signals)
local localizeStrings = require(parent.Localization).localizeStrings
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local gameFollow = discoveryAnalyticsModule.Events.gameFollow
local getSduiPageEntrySnackbarStore = require(parent.SduiSharedUtilities).getSduiPageEntrySnackbarStore

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), game (ref), playersService (ref), gameFollow (ref), signalsModule (ref), getSduiPageEntrySnackbarStore (ref), foundationModule (ref), localizeStrings (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.ToggleExperienceFollow
		}, p2.appPage)
		
		return
	end
	local universeId = var1.universeId
	local gameName = var1.gameName or ""
	
	if universeId == nil or typeof(universeId) ~= "string" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing universeId",
			name = sduiActionType.ToggleExperienceFollow
		}, p2.appPage)
		
		return
	end
	local placeId = var1.placeId
	local ctx = var1.ctx or ""
	local followingsStore = game.getFollowingsStore(false)
	local var2 = followingsStore.getAndFetchFollowing(universeId).data(false)
	local var3 = not (if var2 then var2.isFollowing else false)
	gameFollow({
		uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
		placeId = tostring(placeId),
		state = if var3 then "on" else "off",
		ctx = ctx
	}, ctx)
	local var4 = followingsStore.updateFollowing(universeId, var3)
	local localization = p2.dependencies.localization
	local t = {}
	t.dispose = signalsModule.createEffect(function(p3)
		-- upvalues: var4 (ref), p2 (ref), localization (ref), getSduiPageEntrySnackbarStore (copy), foundationModule (copy), localizeStrings (copy), gameName (ref), t (ref)
		local var5 = var4(p3)
		
		if var5 == nil then return end
		local configKey = p2.configKey
		
		if var5.type == "error" then
			if configKey then
				getSduiPageEntrySnackbarStore().show(configKey, {
					title = localization:Format(if var5.errorType == "LimitReached" then "Feature.GameFollows.TooltipNotificationsLimitReached" else "Feature.Toast.NetworkingError.SomethingIsWrong"),
					icon = foundationModule.Enums.IconName.TriangleExclamation
				})
			end
		elseif var5.type == "success" and configKey then
			local var6 = localizeStrings(localization, {
				notificationsTurnedOn = {
					"Feature.GameFollows.TooltipTurnedOnNotifications",
					experienceName = gameName
				},
				notificationsTurnedOff = {
					"Feature.GameFollows.TooltipTurnedOffNotifications",
					experienceName = gameName
				}
			})
			getSduiPageEntrySnackbarStore().show(configKey, {
				title = if var5.isFollowing then var6.notificationsTurnedOn else var6.notificationsTurnedOff,
				icon = if var5.isFollowing then foundationModule.Enums.IconName.Bell else foundationModule.Enums.IconName.BellSlash
			})
		end
		local dispose = t.dispose
		
		if dispose then
			dispose()
			t.dispose = nil
		end
	end)
end