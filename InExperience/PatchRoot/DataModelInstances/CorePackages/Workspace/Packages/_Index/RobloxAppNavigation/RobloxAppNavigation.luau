local appNavigationRegistryModule = require(script.AppNavigationRegistry)

return {
	AppNavigationRegistry = appNavigationRegistryModule,
	isNavigationAvailable = appNavigationRegistryModule.isRegistered,
	NavigationCommands = require(script.NavigationCommands),
	useNavigationProps = require(script.useNavigationProps),
	withNavigationProps = require(script.withNavigationProps),
	CurrentTabContext = require(script.CurrentTabContext),
	TopBarContext = require(script.TopBarContext),
	["jest.config"] = script["jest.config"]
}