local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(AbuseReportMenu.Components.Types)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)

return {
	componentType = "freeComments",
	componentName = "FreeComments",
	getIsVisible = function(_): boolean --[[ Line: 7 ]]
		return true
	end,
	onUpdate = function(Comment, _, Callback: (any) -> (), p1) --[[ Line: 10 ]]
		-- upvalues: ConstantsModule (copy)
		p1.analyticsDispatch({
			type = ConstantsModule.AnalyticsActions.SetCommentAdded,
			commentAdded = #Comment > 0
		})
		Callback({
			type = ConstantsModule.PlayerMenuActions.UpdateComment,
			comment = Comment
		})
	end
}