local reactModule = require(script:FindFirstAncestor("SocialBlockingModal").Parent.React)
local analyticsSetupModule = require(script.Parent.AnalyticsSetup)

return function(p1)
	-- upvalues: reactModule (ref), analyticsSetupModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: analyticsSetupModule (copy), p1 (ref)
		return analyticsSetupModule({ infoForAllEvents = p1 })
	end, { p1 })
end