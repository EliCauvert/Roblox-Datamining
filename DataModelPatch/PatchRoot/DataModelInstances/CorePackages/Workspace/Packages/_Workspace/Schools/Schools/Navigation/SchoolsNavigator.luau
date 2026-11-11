local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local RoutesModule = require(Schools.Navigation.Routes)
local DefaultNavigationOptions = {
	overlayEnabled = true,
	overlayTransparency = 1,
	absorbInput = true,
	disableBackButton = true
}
local NavigationOptions = { overlayEnabled = false, absorbInput = true }
local RobloxStackNavigator = RoactNavigationModule.createRobloxStackNavigator({
	{
		[RoutesModule.AddSchoolUpsell] = {
			screen = require(Schools.Components.AddSchoolUpsell.AddSchoolUpsellContainer),
			navigationOptions = DefaultNavigationOptions
		}
	},
	{
		[RoutesModule.VerifyEmail] = {
			screen = require(Schools.Components.VerifyEmail),
			navigationOptions = NavigationOptions
		}
	},
	{
		[RoutesModule.SchoolWaitlist] = {
			screen = require(Schools.Components.SchoolWaitlist.SchoolWaitlistContainer),
			navigationOptions = NavigationOptions
		}
	},
	{
		[RoutesModule.SchoolMemberList] = {
			screen = require(Schools.Components.SchoolMemberListPage.SchoolMemberListPageContainer),
			navigationOptions = NavigationOptions
		}
	}
}, {
	initialRouteName = RoutesModule.AddSchoolUpsell,
	defaultNavigationOptions = DefaultNavigationOptions,
	mode = RoactNavigationModule.StackPresentationStyle.Overlay
})
local SchoolsNavigatorWrapper = ReactModule.PureComponent:extend("SchoolsNavigatorWrapper")

function SchoolsNavigatorWrapper.render(p1)
	-- upvalues: ReactModule (copy), RobloxStackNavigator (copy)
	return ReactModule.createElement(RobloxStackNavigator, p1.props)
end

SchoolsNavigatorWrapper.router = RobloxStackNavigator.router

return SchoolsNavigatorWrapper