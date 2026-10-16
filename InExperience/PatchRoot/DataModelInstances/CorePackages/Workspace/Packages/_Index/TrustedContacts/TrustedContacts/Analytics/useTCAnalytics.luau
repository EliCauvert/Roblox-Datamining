local ReactModule = require(script:FindFirstAncestor("TrustedContacts").Parent.React)
local AnalyticsSetupModule = require(script.Parent.AnalyticsSetup)

return function(InfoForAllEvents) --[[ Line: 12 | Named "useTCAnalytics" ]]
	-- upvalues: ReactModule (copy), AnalyticsSetupModule (copy)
	return (ReactModule.useMemo(function() --[[ Line: 13 ]]
		-- upvalues: AnalyticsSetupModule (upval), InfoForAllEvents (copy)
		return AnalyticsSetupModule({ infoForAllEvents = InfoForAllEvents })
	end, { InfoForAllEvents }))
end