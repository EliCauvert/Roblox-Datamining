local ReactModule = require(script:FindFirstAncestor("TrustedContacts").Parent.React)
local AnalyticsSetupModule = require(script.Parent.AnalyticsSetup)

return function(InfoForAllEvents)
	-- upvalues: ReactModule (copy), AnalyticsSetupModule (copy)
	return (ReactModule.useMemo(function()
		-- upvalues: AnalyticsSetupModule (upval), InfoForAllEvents (copy)
		return AnalyticsSetupModule({ infoForAllEvents = InfoForAllEvents })
	end, { InfoForAllEvents }))
end