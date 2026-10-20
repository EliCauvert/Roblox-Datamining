local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(AbuseReportMenu.Components.Types)

return {
	componentType = "dropdown",
	fieldLabel = "ReasonForAbuse",
	componentName = "AbuseReason",
	getIsVisible = function(_): boolean
		return true
	end,
	getMenuItems = function(_)
		return {}
	end,
	onUpdateSelectedOption = function(_, _) end,
	readonlyValue = require(AbuseReportMenu.Components.Constants).InappropriateContentAbuseReason
}