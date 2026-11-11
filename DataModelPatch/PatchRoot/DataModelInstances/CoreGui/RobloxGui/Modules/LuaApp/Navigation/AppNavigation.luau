local CorePackages = game:GetService("CorePackages")
local RobloxAppNavigationModule = require(CorePackages.Workspace.Packages.RobloxAppNavigation)
local SignalsNavigationObject = require(CorePackages.Workspace.Packages.Navigation).createSignalsNavigationObject(require(script.Parent.RootNavigator).router)

if require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP2NavigationPrimitives then
	RobloxAppNavigationModule.AppNavigationRegistry.register(SignalsNavigationObject)
end
return SignalsNavigationObject