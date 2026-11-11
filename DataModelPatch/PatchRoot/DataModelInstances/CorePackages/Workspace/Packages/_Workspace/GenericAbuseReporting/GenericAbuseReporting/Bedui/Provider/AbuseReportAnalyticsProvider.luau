local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local ReactModule = require(GenericAbuseReporting.Parent.React)
local AbuseReportAnalyticsContextModule = require(GenericAbuseReporting.Bedui.Provider.AbuseReportAnalyticsContext)
local _ = require(GenericAbuseReporting.Enums.AbuseVector)
local _ = require(GenericAbuseReporting.Bedui.Utils.BeduiAnalytics)

return function(p1)
	-- upvalues: ReactModule (copy), AbuseReportAnalyticsContextModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement(AbuseReportAnalyticsContextModule.Provider, {
		value = {
			abuseVector = p1.abuseVector,
			isReportSubmitted = UseStateResult,
			setIsReportSubmitted = UseStateResult2
		}
	}, p1.children)
end