local playersService = game:GetService("Players")
local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local dataHydrationModule = require(parent.DataHydration)
local discoveryAnalyticsModule = require(parent.DiscoveryAnalytics)
local foundationModule = require(parent.Foundation)
local game = dataHydrationModule.Game
local signalsModule = require(parent.Signals)
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local gameFavorite = discoveryAnalyticsModule.Events.gameFavorite
local getSduiPageEntrySnackbarStore = require(parent.SduiSharedUtilities).getSduiPageEntrySnackbarStore

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), game (ref), playersService (ref), gameFavorite (ref), signalsModule (ref), getSduiPageEntrySnackbarStore (ref), foundationModule (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.ToggleExperienceFavorite
		}, p2.appPage)
		
		return
	end
	local universeId = var1.universeId
	
	if universeId == nil or typeof(universeId) ~= "string" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing universeId",
			name = sduiActionType.ToggleExperienceFavorite
		}, p2.appPage)
		
		return
	end
	local placeId = var1.placeId
	local ctx = var1.ctx or ""
	local favoritesStore = game.getFavoritesStore(false)
	local var2 = favoritesStore.getAndFetchFavorite(universeId).data(false)
	local var3 = not (var2 ~= nil and var2.isFavorited)
	gameFavorite({
		uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
		ctx = ctx,
		placeId = tostring(placeId),
		state = if var3 then "on" else "off"
	}, ctx)
	local var4 = favoritesStore.updateFavorite(universeId, var3)
	local t = {}
	t.dispose = signalsModule.createEffect(function(p3)
		-- upvalues: var4 (ref), p2 (ref), getSduiPageEntrySnackbarStore (copy), foundationModule (copy), t (ref)
		local var5 = var4(p3)
		
		if var5 == nil then return end
		if var5.type == "error" then
			local configKey = p2.configKey
			
			if configKey then
				getSduiPageEntrySnackbarStore().show(configKey, {
					title = p2.dependencies.localization:Format("Feature.Toast.NetworkingError.SomethingIsWrong"),
					icon = foundationModule.Enums.IconName.TriangleExclamation
				})
			end
		end
		local dispose = t.dispose
		
		if dispose then
			dispose()
			t.dispose = nil
		end
	end)
end