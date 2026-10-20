local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ServiceModule = require(ChromeShared.Service)
local _ = require(CorePackages.Workspace.Packages.Chrome)
local UseObservableValueModule = require(ChromeShared.Hooks.useObservableValue)

return function(p1)
	-- upvalues: UseObservableValueModule (copy), ServiceModule (copy), ReactModule (copy)
	local Copy = table.clone(p1.iconHostProps)
	Copy.showNineDotActivityIndicator = UseObservableValueModule(ServiceModule:nineDotActivityIndicatorVisible()) == true
	
	return ReactModule.createElement(p1.NotificationBadge, Copy)
end