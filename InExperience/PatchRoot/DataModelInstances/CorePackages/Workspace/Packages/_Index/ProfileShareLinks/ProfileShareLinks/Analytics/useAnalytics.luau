local ReactModule = require(script:FindFirstAncestor("ProfileShareLinks").Parent.React)
local InitializeProfileShareLinksAnalyticsModule = require(script.Parent.initializeProfileShareLinksAnalytics)

return function() --[[ Line: 7 ]]
	-- upvalues: ReactModule (copy), InitializeProfileShareLinksAnalyticsModule (copy)
	return ReactModule.useMemo(function() --[[ Line: 8 ]]
		-- upvalues: InitializeProfileShareLinksAnalyticsModule (upval)
		return InitializeProfileShareLinksAnalyticsModule()
	end, {})
end