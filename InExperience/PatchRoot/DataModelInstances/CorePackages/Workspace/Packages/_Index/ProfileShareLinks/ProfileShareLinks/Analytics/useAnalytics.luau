local reactModule = require(script:FindFirstAncestor("ProfileShareLinks").Parent.React)
local initializeProfileShareLinksAnalyticsModule = require(script.Parent.initializeProfileShareLinksAnalytics)

return function()
	-- upvalues: reactModule (ref), initializeProfileShareLinksAnalyticsModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: initializeProfileShareLinksAnalyticsModule (copy)
		return initializeProfileShareLinksAnalyticsModule()
	end, {})
end