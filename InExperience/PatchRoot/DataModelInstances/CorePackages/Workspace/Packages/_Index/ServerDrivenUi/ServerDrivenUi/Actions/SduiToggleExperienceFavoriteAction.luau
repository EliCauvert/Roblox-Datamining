local Players = game:GetService("Players")
local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local FoundationModule = require(Parent.Foundation)
local Game1 = require(Parent.DataHydration).Game
local SignalsModule = require(Parent.Signals)
local FFlagLuaAppAddUniverseIdToEngagementEvents = require(Parent.SharedFlags).FFlagLuaAppAddUniverseIdToEngagementEvents
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local GameFavoriteFunction = require(Parent.DiscoveryAnalytics).Events.gameFavorite
local GetSduiPageEntrySnackbarStoreFunction = require(Parent.SduiSharedUtilities).getSduiPageEntrySnackbarStore

return function(p1, _, p2, _) --[[ Line: 25 | Named "SduiToggleExperienceFavoriteAction" ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), Game1 (copy), Players (copy), GameFavoriteFunction (copy), FFlagLuaAppAddUniverseIdToEngagementEvents (copy), SignalsModule (copy), GetSduiPageEntrySnackbarStoreFunction (copy), FoundationModule (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing action params",
			name = SduiActionType.ToggleExperienceFavorite
		}, p2.appPage)
		
		return
	end
	local UniverseId = ActionParams.universeId
	
	if UniverseId == nil or typeof(UniverseId) ~= "string" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing universeId",
			name = SduiActionType.ToggleExperienceFavorite
		}, p2.appPage)
		
		return
	else
		local Ctx = ActionParams.ctx or ""
		local FavoritesStore = Game1.getFavoritesStore(false)
		local DataResult = FavoritesStore.getAndFetchFavorite(UniverseId).data(false)
		local Inverted = not (DataResult ~= nil and DataResult.isFavorited)
		GameFavoriteFunction({
			uid = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId),
			ctx = Ctx,
			placeId = tostring(ActionParams.placeId),
			state = if Inverted then "on" else "off",
			universeId = if FFlagLuaAppAddUniverseIdToEngagementEvents then UniverseId else nil
		}, Ctx)
		local UpdateFavoriteResult = FavoritesStore.updateFavorite(UniverseId, Inverted)
		local t = {}
		t.dispose = SignalsModule.createEffect(function(p3) --[[ Line: 69 ]]
			-- upvalues: UpdateFavoriteResult (copy), p2 (copy), GetSduiPageEntrySnackbarStoreFunction (upval), FoundationModule (upval), t (copy)
			local UpdateFavoriteResultResult = UpdateFavoriteResult(p3)
			
			if UpdateFavoriteResultResult == nil then return end
			if UpdateFavoriteResultResult.type == "error" then
				local ConfigKey = p2.configKey
				
				if ConfigKey then
					GetSduiPageEntrySnackbarStoreFunction().show(ConfigKey, {
						title = p2.dependencies.localization:Format("Feature.Toast.NetworkingError.SomethingIsWrong"),
						icon = FoundationModule.Enums.IconName.TriangleExclamation
					})
				end
			end
			local DisposeFunction: () -> () = t.dispose
			
			if DisposeFunction then
				DisposeFunction()
				t.dispose = nil
			end
		end)
	end
end