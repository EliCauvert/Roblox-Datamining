local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)

return {
	componentType = "dropdown",
	fieldLabel = "ReasonForAbuse",
	componentName = "AbuseReason",
	getIsVisible = function(_) --[[ line: 7 ]]
		return true
	end,
	getMenuItems = function(_) --[[ line: 10 ]]
		return {}
	end,
	onUpdateSelectedOption = function(_, _) --[[ line: 13 ]] end,
	readonlyValue = require(abuseReportMenu.Components.Constants).InappropriateContentAbuseReason
}