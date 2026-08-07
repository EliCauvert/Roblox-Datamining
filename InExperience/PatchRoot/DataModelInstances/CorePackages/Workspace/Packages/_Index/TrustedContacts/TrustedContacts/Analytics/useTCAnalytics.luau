local reactModule = require(script:FindFirstAncestor("TrustedContacts").Parent.React)
local analyticsSetupModule = require(script.Parent.AnalyticsSetup)

return function(value) --[[ line: 12 | named "useTCAnalytics" ]]
	-- upvalues: reactModule (ref), analyticsSetupModule (ref)
	return reactModule.useMemo(function() --[[ line: 13 ]]
		-- upvalues: analyticsSetupModule (copy), value (ref)
		return analyticsSetupModule({ infoForAllEvents = value })
	end, { value })
end