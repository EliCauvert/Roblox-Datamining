local reactModule = require(script:FindFirstAncestor("ProfileShareLinks").Parent.React)
local initializeProfileShareLinksAnalyticsModule = require(script.Parent.initializeProfileShareLinksAnalytics)

return function() --[[ line: 7 ]]
	-- upvalues: reactModule (ref), initializeProfileShareLinksAnalyticsModule (ref)
	return reactModule.useMemo(function() --[[ line: 8 ]]
		-- upvalues: initializeProfileShareLinksAnalyticsModule (copy)
		return initializeProfileShareLinksAnalyticsModule()
	end, {})
end