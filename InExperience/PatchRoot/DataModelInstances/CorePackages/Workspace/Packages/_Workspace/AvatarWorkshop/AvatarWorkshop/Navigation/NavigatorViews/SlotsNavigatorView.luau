local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local LocalizationModule = require(Parent.Localization)
local RoactNavigationModule = require(Parent.RoactNavigation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(AvatarWorkshop.Navigation.NavigationTypes)
local ItemSlotsLayoutModule = require(AvatarWorkshop.Components.Layouts.ItemSlotsLayout)
local GetActiveRouteModule = require(AvatarWorkshop.Navigation.getActiveRoute)
local GetAvatarStateStoreModule = require(AvatarWorkshop.Stores.Getters.getAvatarStateStore)
local GetInventorySlotsModule = require(AvatarWorkshop.Utils.getInventorySlots)
local ScreenTitlesModule = require(AvatarWorkshop.Constants.ScreenTitles)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local UseSignalStateFunction = SignalsReactModule.useSignalState

return function(p1)
	-- upvalues: GetActiveRouteModule (copy), UseSignalStateFunction (copy), GetAvatarStateStoreModule (copy), UseLocalizationFunction (copy), ScreenTitlesModule (copy), GetInventorySlotsModule (copy), ReactModule (copy), ItemSlotsLayoutModule (copy), RoactNavigationModule (copy)
	local ActiveRouteModule = GetActiveRouteModule(p1.navigation)
	local UseSignalStateResult = UseSignalStateFunction(UseSignalStateFunction(GetAvatarStateStoreModule).getAvatarState)
	local Routes = p1.navigation.state.routes
	local UseLocalizationResult = UseLocalizationFunction(ScreenTitlesModule)
	local Slots = {}
	local RouteNames = {}
	local ActiveSlotIds = {}
	
	for _, route in Routes do
		for i, value in GetInventorySlotsModule(route.routeName, UseSignalStateResult) do
			local Key = if i == 1 then route.key else `{route.key}_{i}`
			table.insert(Slots, {
				id = Key,
				text = UseLocalizationResult[route.routeName],
				slotType = value.slotType,
				content = value.content
			})
			RouteNames[Key] = route.routeName
			
			if route.key == ActiveRouteModule.key then
				ActiveSlotIds[Key] = true
			end
		end
	end
	local Key = p1.navigation.state.key
	
	return ReactModule.createElement(ItemSlotsLayoutModule, {
		slots = Slots,
		activeSlotIds = ActiveSlotIds,
		onSlotActivated = ReactModule.useCallback(function(p2)
			-- upvalues: RouteNames (copy), p1 (copy)
			if typeof(p2) ~= "string" then return end
			local RouteName = RouteNames[p2]
			
			if RouteName then
				p1.navigation.navigate(RouteName)
			end
		end, { p1.navigation, RouteNames }),
		testId = if Key then `--avatar-workshop-slots-{Key}` else "--avatar-workshop-slots"
	}, {
		Content = ReactModule.createElement(RoactNavigationModule.RobloxSwitchView, p1)
	})
end