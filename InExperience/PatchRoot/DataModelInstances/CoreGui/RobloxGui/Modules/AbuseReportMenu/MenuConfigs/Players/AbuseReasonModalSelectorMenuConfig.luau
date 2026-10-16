local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local _ = require(AbuseReportMenu.Components.Types)
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)

return {
	componentType = "modalSelector",
	fieldLabel = "ReasonForAbuse",
	componentName = "AbuseReason",
	getIsVisible = function(_): boolean --[[ Line: 9 ]]
		return true
	end,
	getMenuItems = function(p1, p2) --[[ Line: 12 ]]
		-- upvalues: ConstantsModule (copy), CryoModule (copy)
		return CryoModule.List.map(CryoModule.Dictionary.values(if p1.methodOfAbuse == ConstantsModule.AbuseMethods.VoiceChat then ConstantsModule.PlayerVoiceAbuseTypes else ConstantsModule.PlayerAbuseTypes), function(Identifier) --[[ Line: 17 ]]
			-- upvalues: p2 (copy)
			return { label = p2[Identifier], identifier = Identifier }
		end)
	end,
	getSelectedValue = function(p1) --[[ Line: 24 ]]
		return p1.abuseReason
	end,
	onUpdateSelectedOption = function(p1, _, Callback: (any) -> (), p2) --[[ Line: 27 ]]
		-- upvalues: ConstantsModule (copy)
		p2.analyticsDispatch({
			type = ConstantsModule.AnalyticsActions.IncrementReasonChanged
		})
		p2.analyticsDispatch({
			type = ConstantsModule.AnalyticsActions.SetReasonSelection,
			selection = p1.identifier
		})
		Callback({
			type = ConstantsModule.PlayerMenuActions.UpdateAbuseReason,
			abuseReason = p1.identifier
		})
	end
}