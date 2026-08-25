local reactModule = require(script:FindFirstAncestor("TrustedContacts").Parent.React)
local analyticsSetupModule = require(script.Parent.AnalyticsSetup)

return function(value)
	-- upvalues: reactModule (ref), analyticsSetupModule (ref)
	return reactModule.useMemo(function()
		-- upvalues: analyticsSetupModule (copy), value (ref)
		return analyticsSetupModule({ infoForAllEvents = value })
	end, { value })
end