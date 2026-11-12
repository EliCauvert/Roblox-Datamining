local AppNavigationRegistryModule = require(script.AppNavigationRegistry)
local Parent = script.Parent
local FFlagEnableOnScreenAPIIntegration = require(Parent.SharedFlags).FFlagEnableOnScreenAPIIntegration

return {
	AppNavigationRegistry = AppNavigationRegistryModule,
	isNavigationAvailable = AppNavigationRegistryModule.isRegistered,
	NavigationCommands = require(script.NavigationCommands),
	useNavigationProps = require(script.useNavigationProps),
	withNavigationProps = require(script.withNavigationProps),
	withNavigationFocusIgnoringNavigation = if require(Parent.SharedFlags).FFlagSignalsNavP3hMisc then require(script.withNavigationFocusIgnoringNavigation) else nil,
	CurrentTabContext = require(script.CurrentTabContext),
	TopBarContext = require(script.TopBarContext),
	useIsRouteOnScreen = if FFlagEnableOnScreenAPIIntegration then require(script.useIsRouteOnScreen) else nil,
	OnScreenContext = if FFlagEnableOnScreenAPIIntegration then require(script.OnScreenContext) else nil,
	useOnScreenNavigationListener = if FFlagEnableOnScreenAPIIntegration then require(script.useOnScreenNavigationListener) else nil,
	["jest.config"] = script["jest.config"]
}