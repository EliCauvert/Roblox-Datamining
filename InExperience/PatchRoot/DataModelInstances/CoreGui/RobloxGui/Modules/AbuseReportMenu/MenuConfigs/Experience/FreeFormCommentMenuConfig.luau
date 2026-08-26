local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)
local constantsModule = require(abuseReportMenu.Components.Constants)

return {
	componentType = "freeComments",
	componentName = "FreeComments",
	getIsVisible = function(_)
		return true
	end,
	onUpdate = function(p1, _, p2, p3)
		-- upvalues: constantsModule (ref)
		p3.analyticsDispatch({
			type = constantsModule.AnalyticsActions.SetCommentAdded,
			commentAdded = #p1 > 0
		})
		p2({
			type = constantsModule.PlayerMenuActions.UpdateComment,
			comment = p1
		})
	end
}