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

return function(p0, _, p1, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), game (ref), playersService (ref), gameFollow (ref), signalsModule (ref), getSduiPageEntrySnackbarStore (ref), foundationModule (ref), localizeStrings (ref)
	local var6 = if p0 then p0.actionParams else nil
	
	if var6 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.ToggleExperienceFollow
		}, p1.appPage)
		
		return
	end
	local universeId = var6.universeId
	local gameName = var6.gameName or ""
	
	if universeId == nil or typeof(universeId) ~= "string" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing universeId",
			name = sduiActionType.ToggleExperienceFollow
		}, p1.appPage)
		
		return
	end
	local placeId = var6.placeId
	local ctx = var6.ctx or ""
	local followingsStore = game.getFollowingsStore(false)
	local var10 = followingsStore.getAndFetchFollowing(universeId).data(false)
	local var11 = not (if var10 then var10.isFollowing else false)
	gameFollow({
		uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
		placeId = tostring(placeId),
		state = if var11 then "on" else "off",
		ctx = ctx
	}, ctx)
	local var12 = followingsStore.updateFollowing(universeId, var11)
	local localization = p1.dependencies.localization
	local t = {}
	t.dispose = signalsModule.createEffect(function(p2)
		-- upvalues: var12 (ref), p1 (ref), localization (ref), getSduiPageEntrySnackbarStore (copy), foundationModule (copy), localizeStrings (copy), gameName (ref), t (ref)
		local var14 = var12(p2)
		
		if var14 == nil then return end
		local configKey = p1.configKey
		
		if var14.type == "error" then
			if configKey then
				getSduiPageEntrySnackbarStore().show(configKey, {
					title = localization:Format(if var14.errorType == "LimitReached" then "Feature.GameFollows.TooltipNotificationsLimitReached" else "Feature.Toast.NetworkingError.SomethingIsWrong"),
					icon = foundationModule.Enums.IconName.TriangleExclamation
				})
			end
		elseif var14.type == "success" and configKey then
			local var15 = localizeStrings(localization, {
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
				title = if var14.isFollowing then var15.notificationsTurnedOn else var15.notificationsTurnedOff,
				icon = if var14.isFollowing then foundationModule.Enums.IconName.Bell else foundationModule.Enums.IconName.BellSlash
			})
		end
		local dispose = t.dispose
		
		if dispose then
			dispose()
			t.dispose = nil
		end
	end)
end