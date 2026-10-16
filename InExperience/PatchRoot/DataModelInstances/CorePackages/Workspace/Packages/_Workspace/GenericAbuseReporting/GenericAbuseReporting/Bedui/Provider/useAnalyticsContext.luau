local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local ReactModule = require(GenericAbuseReporting.Parent.React)
local AbuseReportAnalyticsContextModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportAnalyticsContext)

return function() --[[ Line: 7 | Named "useAnalyticsContext" ]]
	-- upvalues: ReactModule (copy), AbuseReportAnalyticsContextModule (copy)
	return ReactModule.useContext(AbuseReportAnalyticsContextModule)
end