local reactModule = require(script:FindFirstAncestor("SocialBlockingModal").Parent.React)
local analyticsSetupModule = require(script.Parent.AnalyticsSetup)

return function(p0)
	-- upvalues: reactModule (ref), analyticsSetupModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: analyticsSetupModule (copy), p0 (ref)
		return analyticsSetupModule({ infoForAllEvents = p0 })
	end, { p0 })
end