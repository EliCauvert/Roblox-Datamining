local navigationCommandsModule = require(script.NavigationCommands)
local appNavigationRegistryModule = require(script.AppNavigationRegistry)
local fFlagEnableOnScreenAPIIntegration = require(script.Parent.SharedFlags).FFlagEnableOnScreenAPIIntegration

return {
	AppNavigationRegistry = appNavigationRegistryModule,
	isNavigationAvailable = appNavigationRegistryModule.isRegistered,
	NavigationCommands = navigationCommandsModule,
	useNavigationProps = require(script.useNavigationProps),
	withNavigationProps = require(script.withNavigationProps),
	CurrentTabContext = require(script.CurrentTabContext),
	TopBarContext = require(script.TopBarContext),
	useIsRouteOnScreen = if fFlagEnableOnScreenAPIIntegration then require(script.useIsRouteOnScreen) else nil,
	OnScreenContext = if fFlagEnableOnScreenAPIIntegration then require(script.OnScreenContext) else nil,
	useOnScreenNavigationListener = if fFlagEnableOnScreenAPIIntegration then require(script.useOnScreenNavigationListener) else nil,
	["jest.config"] = script["jest.config"]
}