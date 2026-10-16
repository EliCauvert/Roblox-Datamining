local AppNavigationRegistryModule = require(script.AppNavigationRegistry)
local FFlagEnableOnScreenAPIIntegration = require(script.Parent.SharedFlags).FFlagEnableOnScreenAPIIntegration

return {
	AppNavigationRegistry = AppNavigationRegistryModule,
	isNavigationAvailable = AppNavigationRegistryModule.isRegistered,
	NavigationCommands = require(script.NavigationCommands),
	useNavigationProps = require(script.useNavigationProps),
	withNavigationProps = require(script.withNavigationProps),
	CurrentTabContext = require(script.CurrentTabContext),
	TopBarContext = require(script.TopBarContext),
	useIsRouteOnScreen = if FFlagEnableOnScreenAPIIntegration then require(script.useIsRouteOnScreen) else nil,
	OnScreenContext = if FFlagEnableOnScreenAPIIntegration then require(script.OnScreenContext) else nil,
	useOnScreenNavigationListener = if FFlagEnableOnScreenAPIIntegration then require(script.useOnScreenNavigationListener) else nil,
	["jest.config"] = script["jest.config"]
}