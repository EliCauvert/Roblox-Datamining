local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local ReactModule = require(GenericAbuseReporting.Parent.React)
local AbuseReportAnalyticsContextModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportAnalyticsContext)

return function()
	-- upvalues: ReactModule (copy), AbuseReportAnalyticsContextModule (copy)
	return ReactModule.useContext(AbuseReportAnalyticsContextModule)
end