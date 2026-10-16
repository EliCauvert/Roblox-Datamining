local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(AbuseReportMenu.Components.Types)

return {
	componentType = "dropdown",
	fieldLabel = "ReasonForAbuse",
	componentName = "AbuseReason",
	getIsVisible = function(_): boolean --[[ Line: 7 ]]
		return true
	end,
	getMenuItems = function(_) --[[ Line: 10 ]]
		return {}
	end,
	onUpdateSelectedOption = function(_, _) --[[ Line: 13 ]] end,
	readonlyValue = require(AbuseReportMenu.Components.Constants).InappropriateContentAbuseReason
}