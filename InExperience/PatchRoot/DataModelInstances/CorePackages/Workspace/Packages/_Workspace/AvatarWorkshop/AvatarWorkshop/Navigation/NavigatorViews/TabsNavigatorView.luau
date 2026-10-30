local AvatarWorkshop = script:FindFirstAncestor("AvatarWorkshop")
local Parent = AvatarWorkshop.Parent
local _ = require(Parent.Foundation)
local RoactNavigationModule = require(Parent.RoactNavigation)
local ReactModule = require(Parent.React)
local _ = require(AvatarWorkshop.Navigation.NavigationTypes)
local TabsLayoutModule = require(AvatarWorkshop.Components.Layouts.TabsLayout)
local GetActiveRouteModule = require(AvatarWorkshop.Navigation.getActiveRoute)
local ScreenTitlesModule = require(AvatarWorkshop.Constants.ScreenTitles)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization

return function(p1)
	-- upvalues: GetActiveRouteModule (copy), UseLocalizationFunction (copy), ScreenTitlesModule (copy), ReactModule (copy), TabsLayoutModule (copy), RoactNavigationModule (copy)
	local ActiveRouteModule = GetActiveRouteModule(p1.navigation)
	local Routes = p1.navigation.state.routes
	local UseLocalizationResult = UseLocalizationFunction(ScreenTitlesModule)
	local Tabs = {}
	
	for _, route in Routes do
		table.insert(Tabs, {
			id = route.key,
			text = UseLocalizationResult[route.routeName] or route.routeName
		})
	end
	local Key = p1.navigation.state.key
	
	return ReactModule.createElement(TabsLayoutModule, {
		tabs = Tabs,
		activeTabId = ActiveRouteModule.key,
		onTabActivated = ReactModule.useCallback(function(Key)
			-- upvalues: Routes (copy), p1 (copy)
			for _, route in Routes do
				if route.key == Key then
					p1.navigation.navigate(route.routeName)
					break
				end
			end
		end, { p1.navigation, Routes }),
		testId = if Key then `--avatar-workshop-tabs-{Key}` else "--avatar-workshop-tabs"
	}, {
		Content = ReactModule.createElement(RoactNavigationModule.RobloxSwitchView, p1)
	})
end