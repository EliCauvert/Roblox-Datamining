local AppNavigationRegistryModule = require(script.AppNavigationRegistry)

return {
	AppNavigationRegistry = AppNavigationRegistryModule,
	isNavigationAvailable = AppNavigationRegistryModule.isRegistered,
	NavigationCommands = require(script.NavigationCommands),
	useNavigationProps = require(script.useNavigationProps),
	withNavigationProps = require(script.withNavigationProps),
	CurrentTabContext = require(script.CurrentTabContext),
	TopBarContext = require(script.TopBarContext),
	["jest.config"] = script["jest.config"]
}