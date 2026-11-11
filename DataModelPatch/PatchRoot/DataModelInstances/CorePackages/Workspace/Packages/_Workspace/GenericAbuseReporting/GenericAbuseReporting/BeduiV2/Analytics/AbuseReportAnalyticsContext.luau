local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local ReactModule = require(GenericAbuseReporting.Parent.React)
local _ = require(GenericAbuseReporting.BeduiV2.Analytics.analyticsService)
local Context = ReactModule.createContext(nil)

return {
	AbuseReportAnalyticsContext = Context,
	AbuseReportAnalyticsProvider = function(p1)
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.createElement(Context.Provider, { value = p1.analytics }, p1.children)
	end,
	useAbuseReportAnalytics = function()
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		if not UseContextResult then
			error("Invalid use of `useAbuseReportAnalytics` hook. Ensure your component has an ancestor wrapped in `AbuseReportAnalyticsProvider`")
		end
		return UseContextResult
	end
}