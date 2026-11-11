local ReactModule = require(script:FindFirstAncestor("ProfileShareLinks").Parent.React)
local InitializeProfileShareLinksAnalyticsModule = require(script.Parent.initializeProfileShareLinksAnalytics)

return function()
	-- upvalues: ReactModule (copy), InitializeProfileShareLinksAnalyticsModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: InitializeProfileShareLinksAnalyticsModule (upval)
		return InitializeProfileShareLinksAnalyticsModule()
	end, {})
end