local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local reactModule = require(genericAbuseReporting.Parent.React)
local abuseReportAnalyticsContextModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportAnalyticsContext)

return function()
	-- upvalues: reactModule (ref), abuseReportAnalyticsContextModule (ref)
	return reactModule.useContext(abuseReportAnalyticsContextModule)
end