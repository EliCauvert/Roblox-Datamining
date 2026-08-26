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

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), game (ref), signalsReactModule (ref), fFlagSduiFavoritesHydrationStructured (ref), useLocalization (ref), reactModule (ref), playersService (ref), gameFavorite (ref), setCurrentToastMessage (ref), toastType (ref), useOptimisticUpdateStatusModule (ref), sduiChip (ref), foundationModule (ref)
	local layoutOrder = p1.layoutOrder
	local universeId = p1.universeId
	local var1 = useDispatch()
	local andFetchFavorite = game.getFavoritesStore(false).getAndFetchFavorite(universeId)
	local var2 = signalsReactModule.useSignalState(function(p2)
		-- upvalues: andFetchFavorite (ref), fFlagSduiFavoritesHydrationStructured (copy)
		local var3 = andFetchFavorite.data(p2)
		
		return if fFlagSduiFavoritesHydrationStructured then var3 ~= nil and var3.isFavorited else var3 == true
	end)
	local var3 = signalsReactModule.useSignalState(game.getGameInfoStore(false).getAndFetchGameInfo(universeId).data)
	local var4 = if var3 then var3.rootPlaceId else nil
	
	return reactModule.createElement(sduiChip, {
		text = useLocalization({ favorite = "Feature.Favorites.Label.Favorite" }).favorite,
		leadingIconName = foundationModule.Enums.IconName.Star,
		leadingIconVariant = if var2 then foundationModule.Enums.IconVariant.Filled else nil,
		onActivated = useOptimisticUpdateStatusModule(reactModule.useCallback(function()
			-- upvalues: var2 (ref), var4 (ref), playersService (copy), gameFavorite (copy), game (copy), universeId (ref)
			local var5 = not var2
			
			if var4 then
				gameFavorite({
					ctx = "ExperienceDetailsFavoriteChip",
					uid = tostring(playersService.LocalPlayer and playersService.LocalPlayer.UserId),
					placeId = var4,
					state = if var5 then "on" else "off"
				}, "ExperienceDetailsFavoriteChip")
			end
			return game.getFavoritesStore(false).updateFavorite(universeId, var5)
		end, { universeId, var4, var2 }), reactModule.useCallback(function(p2)
			-- upvalues: var1 (ref), setCurrentToastMessage (copy), toastType (copy)
			if p2 and p2.type == "error" then
				var1(setCurrentToastMessage({
					toastMessage = "Feature.Toast.NetworkingError.SomethingIsWrong",
					toastType = toastType.NetworkingError
				}))
			end
		end, { var1 })),
		layoutOrder = layoutOrder
	})
end)