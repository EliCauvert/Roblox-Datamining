local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local serviceModule = require(chromeShared.Service)
local _ = require(corePackagesService.Workspace.Packages.Chrome)
local useObservableValueModule = require(chromeShared.Hooks.useObservableValue)

return function(vectorA)
	-- upvalues: useObservableValueModule (ref), serviceModule (ref), reactModule (ref)
	local cloned = table.clone(vectorA.iconHostProps)
	cloned.showNineDotActivityIndicator = useObservableValueModule(serviceModule:nineDotActivityIndicatorVisible()) == true
	
	return reactModule.createElement(vectorA.NotificationBadge, cloned)
end