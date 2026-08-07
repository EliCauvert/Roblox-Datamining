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

return function(p0, _, p1, _) --[[ line: 23 | named "SduiToggleExperienceFavoriteAction" ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), game (ref), playersService (ref), gameFavorite (ref), signalsModule (ref), getSduiPageEntrySnackbarStore (ref), foundationModule (ref)
	local var6 = if p0 then p0.actionParams else nil
	
	if var6 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = sduiActionType.ToggleExperienceFavorite
		}, p1.appPage)
		
		return
	end
	local universeId = var6.universeId
	
	if universeId == nil or typeof(universeId) ~= "string" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing universeId",
			name = sduiActionType.ToggleExperienceFavorite
		}, p1.appPage)
		
		return
	end
	local placeId = var6.placeId
	local ctx = var6.ctx or ""
	local favoritesStore = game.getFavoritesStore(false)
	local var9 = favoritesStore.getAndFetchFavorite(universeId).data(false)
	local var10 = not (var9 ~= nil and var9.isFavorited)
	gameFavorite({
		uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
		ctx = ctx,
		placeId = tostring(placeId),
		state = if var10 then "on" else "off"
	}, ctx)
	local var11 = favoritesStore.updateFavorite(universeId, var10)
	local t = {}
	t.dispose = signalsModule.createEffect(function(p2) --[[ line: 67 ]]
		-- upvalues: var11 (ref), p1 (ref), getSduiPageEntrySnackbarStore (copy), foundationModule (copy), t (ref)
		local var13 = var11(p2)
		
		if var13 == nil then return end
		if var13.type == "error" then
			local configKey = p1.configKey
			
			if configKey then
				getSduiPageEntrySnackbarStore().show(configKey, {
					title = p1.dependencies.localization:Format("Feature.Toast.NetworkingError.SomethingIsWrong"),
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