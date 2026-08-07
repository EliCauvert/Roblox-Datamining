local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local reactModule = require(genericAbuseReporting.Parent.React)
local _ = require(genericAbuseReporting.BeduiV2.Analytics.analyticsService)
local var2 = reactModule.createContext(nil)

return {
	AbuseReportAnalyticsContext = var2,
	AbuseReportAnalyticsProvider = function(p0) --[[ line: 25 ]]
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.createElement(var2.Provider, { value = p0.analytics }, p0.children)
	end,
	useAbuseReportAnalytics = function() --[[ line: 36 ]]
		-- upvalues: reactModule (ref), var2 (ref)
		local var3 = reactModule.useContext(var2)
		
		if not var3 then
			error("Invalid use of `useAbuseReportAnalytics` hook. Ensure your component has an ancestor wrapped in `AbuseReportAnalyticsProvider`")
		end
		return var3
	end,
	useOptionalAbuseReportAnalytics = function() --[[ line: 52 ]]
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.useContext(var2)
	end
}