local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)
local constantsModule = require(abuseReportMenu.Components.Constants)

return {
	componentType = "freeComments",
	componentName = "FreeComments",
	getIsVisible = function(_) --[[ line: 7 ]]
		return true
	end,
	onUpdate = function(p0, _, p1, p2) --[[ line: 10 ]]
		-- upvalues: constantsModule (ref)
		p2.analyticsDispatch({
			type = constantsModule.AnalyticsActions.SetCommentAdded,
			commentAdded = #p0 > 0
		})
		p1({
			type = constantsModule.PlayerMenuActions.UpdateComment,
			comment = p0
		})
	end
}