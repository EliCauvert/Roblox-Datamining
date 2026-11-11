local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local ReactFocusNavigationModule = require(CorePackages.Packages.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(CorePackages.Workspace.Packages.FocusNavigationUtils).FocusNavigationEventNameEnum

return function()
	-- upvalues: ReactModule (copy), ReactFocusNavigationModule (copy), FocusNavigationEventNameEnum (copy)
	return (ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, (ReactModule.useCallback(function(p1)
		p1:cancel()
	end, {}))))
end