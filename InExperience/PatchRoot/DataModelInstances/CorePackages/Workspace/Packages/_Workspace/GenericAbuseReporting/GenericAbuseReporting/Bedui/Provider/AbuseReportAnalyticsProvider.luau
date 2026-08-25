local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local reactModule = require(genericAbuseReporting.Parent.React)
local abuseReportAnalyticsContextModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportAnalyticsContext)
local _ = require(genericAbuseReporting.Enums.AbuseVector)
local _ = require(genericAbuseReporting.Bedui.Utils.BeduiAnalytics)

return function(p0)
	-- upvalues: reactModule (ref), abuseReportAnalyticsContextModule (ref)
	local var3, var4 = reactModule.useState(false)
	
	return reactModule.createElement(abuseReportAnalyticsContextModule.Provider, {
		value = {
			abuseVector = p0.abuseVector,
			isReportSubmitted = var3,
			setIsReportSubmitted = var4
		}
	}, p0.children)
end