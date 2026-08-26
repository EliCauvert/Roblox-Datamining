local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local reactModule = require(genericAbuseReporting.Parent.React)
local _ = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local var1 = reactModule.createContext(nil)

return {
	AbuseReportAnalyticsContext = var1,
	AbuseReportAnalyticsProvider = function(p1)
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.createElement(var1.Provider, { value = p1.analytics }, p1.children)
	end,
	useAbuseReportAnalytics = function()
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		
		if not var2 then
			error("Invalid use of `useAbuseReportAnalytics` hook. Ensure your component has an ancestor wrapped in `AbuseReportAnalyticsProvider`")
		end
		return var2
	end,
	useOptionalAbuseReportAnalytics = function()
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.useContext(var1)
	end
}