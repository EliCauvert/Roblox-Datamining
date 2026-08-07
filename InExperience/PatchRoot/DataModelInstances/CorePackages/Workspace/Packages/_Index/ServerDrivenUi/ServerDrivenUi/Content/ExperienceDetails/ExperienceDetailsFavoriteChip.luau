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
local gameFavorite = require(parent.DiscoveryAnalytics).Events.gameFavorite
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization
local useOptimisticUpdateStatusModule = require(serverDrivenUi.Content.ExperienceDetails.Hooks.useOptimisticUpdateStatus)
local fFlagSduiFavoritesHydrationStructured = require(parent.SharedFlags).FFlagSduiFavoritesHydrationStructured

return reactModule.memo(function(p0) --[[ line: 37 | named "ExperienceDetailsFavoriteChip" ]]
	-- upvalues: useDispatch (ref), game (ref), signalsReactModule (ref), fFlagSduiFavoritesHydrationStructured (ref), useLocalization (ref), reactModule (ref), playersService (ref), gameFavorite (ref), setCurrentToastMessage (ref), toastType (ref), useOptimisticUpdateStatusModule (ref), sduiChip (ref), foundationModule (ref)
	local layoutOrder = p0.layoutOrder
	local universeId = p0.universeId
	local var9 = useDispatch()
	local andFetchFavorite = game.getFavoritesStore(false).getAndFetchFavorite(universeId)
	local var11 = signalsReactModule.useSignalState(function(p1) --[[ line: 43 ]]
		-- upvalues: andFetchFavorite (ref), fFlagSduiFavoritesHydrationStructured (copy)
		local var14 = andFetchFavorite.data(p1)
		
		return if fFlagSduiFavoritesHydrationStructured then var14 ~= nil and var14.isFavorited else var14 == true
	end)
	local var12 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local var13 = if var12 then var12.rootPlaceId else nil
	
	return reactModule.createElement(sduiChip, {
		text = useLocalization({ favorite = "Feature.Favorites.Label.Favorite" }).favorite,
		leadingIconName = foundationModule.Enums.IconName.Star,
		leadingIconVariant = if var11 then foundationModule.Enums.IconVariant.Filled else nil,
		onActivated = useOptimisticUpdateStatusModule(reactModule.useCallback(function() --[[ line: 60 ]]
			-- upvalues: var11 (ref), var13 (ref), playersService (copy), gameFavorite (copy), game (copy), universeId (ref)
			local var15 = not var11
			
			if var13 then
				gameFavorite({
					ctx = "ExperienceDetailsFavoriteChip",
					uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
					placeId = var13,
					state = if var15 then "on" else "off"
				}, "ExperienceDetailsFavoriteChip")
			end
			return game.getFavoritesStore(false).updateFavorite(universeId, var15)
		end, { universeId, var13, var11 }), reactModule.useCallback(function(p2) --[[ line: 76 ]]
			-- upvalues: var9 (ref), setCurrentToastMessage (copy), toastType (copy)
			if p2 and p2.type == "error" then
				var9(setCurrentToastMessage({
					toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
					toastType = toastType.NetworkingError
				}))
			end
		end, { var9 })),
		layoutOrder = layoutOrder
	})
end)