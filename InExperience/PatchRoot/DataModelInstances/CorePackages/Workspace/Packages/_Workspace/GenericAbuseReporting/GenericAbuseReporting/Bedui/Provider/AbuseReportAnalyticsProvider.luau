local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local reactModule = require(genericAbuseReporting.Parent.React)
local abuseReportAnalyticsContextModule = require(genericAbuseReporting.Bedui.Provider.AbuseReportAnalyticsContext)
local _ = require(genericAbuseReporting.Enums.AbuseVector)
local _ = require(genericAbuseReporting.Bedui.Utils.BeduiAnalytics)

return function(p1)
	-- upvalues: reactModule (ref), abuseReportAnalyticsContextModule (ref)
	local var1, var2 = reactModule.useState(false)
	
	return reactModule.createElement(abuseReportAnalyticsContextModule.Provider, {
		value = {
			abuseVector = p1.abuseVector,
			isReportSubmitted = var1,
			setIsReportSubmitted = var2
		}
	}, p1.children)
end