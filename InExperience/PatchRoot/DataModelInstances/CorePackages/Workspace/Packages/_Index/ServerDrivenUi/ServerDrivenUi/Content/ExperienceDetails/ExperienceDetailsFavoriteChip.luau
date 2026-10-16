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
local GameFavoriteFunction = require(Parent.DiscoveryAnalytics).Events.gameFavorite
local FFlagLuaAppAddUniverseIdToEngagementEvents = require(Parent.SharedFlags).FFlagLuaAppAddUniverseIdToEngagementEvents
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseOptimisticUpdateStatusModule = require(ServerDrivenUi.Content.ExperienceDetails.Hooks.useOptimisticUpdateStatus)

return ReactModule.memo(function(p1) --[[ Line: 37 | Named "ExperienceDetailsFavoriteChip" ]]
	-- upvalues: UseDispatchFunction (copy), Game1 (copy), SignalsReactModule (copy), UseLocalizationFunction (copy), ReactModule (copy), Players (copy), GameFavoriteFunction (copy), FFlagLuaAppAddUniverseIdToEngagementEvents (copy), SetCurrentToastMessageFunction (copy), ToastType (copy), UseOptimisticUpdateStatusModule (copy), SduiChip (copy), FoundationModule (copy)
	local LayoutOrder = p1.layoutOrder
	local UniverseId = p1.universeId
	local UseDispatchResult = UseDispatchFunction()
	local AndFetchFavorite = Game1.getFavoritesStore(false).getAndFetchFavorite(UniverseId)
	local UseSignalStateResult = SignalsReactModule.useSignalState(function(p2) --[[ Line: 43 ]]
		-- upvalues: AndFetchFavorite (copy)
		local DataResult = AndFetchFavorite.data(p2)
		
		return DataResult ~= nil and DataResult.isFavorited
	end)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(Game1.getGameInfoStore(false).getAndFetchGameInfo(UniverseId).data)
	local RootPlaceId = UseSignalStateResult1 and UseSignalStateResult1.rootPlaceId or nil
	
	return ReactModule.createElement(SduiChip, {
		text = UseLocalizationFunction({ favorite = "Feature.Favorites.Label.Favorite" }).favorite,
		leadingIconName = FoundationModule.Enums.IconName.Star,
		leadingIconVariant = if UseSignalStateResult then FoundationModule.Enums.IconVariant.Filled else nil,
		onActivated = UseOptimisticUpdateStatusModule(ReactModule.useCallback(function() --[[ Line: 55 ]]
			-- upvalues: UseSignalStateResult (copy), RootPlaceId (copy), Players (upval), GameFavoriteFunction (upval), FFlagLuaAppAddUniverseIdToEngagementEvents (upval), UniverseId (copy), Game1 (upval)
			local NoUseSignalStateResult = not UseSignalStateResult
			
			if RootPlaceId then
				GameFavoriteFunction({
					ctx = "ExperienceDetailsFavoriteChip",
					uid = tostring(Players.LocalPlayer and Players.LocalPlayer.UserId),
					placeId = RootPlaceId,
					state = if NoUseSignalStateResult then "on" else "off",
					universeId = if FFlagLuaAppAddUniverseIdToEngagementEvents then UniverseId else nil
				}, "ExperienceDetailsFavoriteChip")
			end
			return Game1.getFavoritesStore(false).updateFavorite(UniverseId, NoUseSignalStateResult)
		end, { UniverseId, RootPlaceId, UseSignalStateResult }), (ReactModule.useCallback(function(p2) --[[ Line: 72 ]]
			-- upvalues: UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), ToastType (upval)
			if p2 and p2.type == "error" then
				UseDispatchResult(SetCurrentToastMessageFunction({
					toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
					toastType = ToastType.NetworkingError
				}))
			end
		end, { UseDispatchResult }))),
		layoutOrder = LayoutOrder
	})
end)