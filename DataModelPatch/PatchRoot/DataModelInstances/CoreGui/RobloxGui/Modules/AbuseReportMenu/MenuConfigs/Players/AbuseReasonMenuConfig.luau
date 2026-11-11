local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local _ = require(AbuseReportMenu.Components.Types)
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)

return {
	componentType = "dropdown",
	fieldLabel = "ReasonForAbuse",
	componentName = "AbuseReason",
	getIsVisible = function(_): boolean
		return true
	end,
	getMenuItems = function(p1)
		-- upvalues: ConstantsModule (copy), CryoModule (copy)
		return CryoModule.Dictionary.values(if p1.methodOfAbuse == "Voice Chat" then ConstantsModule.PlayerVoiceAbuseTypes else ConstantsModule.PlayerAbuseTypes)
	end,
	onUpdateSelectedOption = function(AbuseReason, _, Callback: (any) -> (), p1)
		-- upvalues: ConstantsModule (copy)
		p1.analyticsDispatch({
			type = ConstantsModule.AnalyticsActions.IncrementReasonChanged
		})
		p1.analyticsDispatch({
			type = ConstantsModule.AnalyticsActions.SetReasonSelection,
			selection = AbuseReason
		})
		Callback({
			type = ConstantsModule.PlayerMenuActions.UpdateAbuseReason,
			abuseReason = AbuseReason
		})
	end
}