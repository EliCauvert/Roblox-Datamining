local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local NavigationEvents = require(CorePackages.Packages.RoactNavigation).NavigationEvents
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)

return function(p1)
	-- upvalues: ReactModule (copy), NavigationEvents (copy), IxpUtilsModule (copy)
	return ReactModule.createElement(NavigationEvents, {
		onDidFocus = function()
			-- upvalues: p1 (copy), IxpUtilsModule (upval)
			for _, ixpLayer in p1.ixpLayers do
				if ixpLayer ~= nil then
					IxpUtilsModule.logLayerExposure(ixpLayer)
				end
			end
		end
	})
end