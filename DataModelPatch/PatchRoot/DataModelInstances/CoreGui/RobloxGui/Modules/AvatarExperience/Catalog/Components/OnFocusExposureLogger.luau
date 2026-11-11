local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local NavigationEvents = require(CorePackages.Packages.RoactNavigation).NavigationEvents
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)

return function(p1)
	-- upvalues: IxpUtilsModule (copy), ReactModule (copy), NavigationEvents (copy)
	local UseLogExposureOnceResult = IxpUtilsModule.useLogExposureOnce(p1.ixpTest)
	
	return if p1.ixpTest.isEnabled() then ReactModule.createElement(NavigationEvents, { onDidFocus = UseLogExposureOnceResult }) else nil
end