local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)

return {
	componentType = "dropdown",
	fieldLabel = "ReasonForAbuse",
	componentName = "AbuseReason",
	getIsVisible = function(_)
		return true
	end,
	getMenuItems = function(_)
		return {}
	end,
	onUpdateSelectedOption = function(_, _) end,
	readonlyValue = require(abuseReportMenu.Components.Constants).InappropriateContentAbuseReason
}