local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local constantsModule = require(abuseReportMenu.Components.Constants)
local _ = require(abuseReportMenu.Components.Types)
local cryoModule = require(corePackagesService.Packages.Cryo)

return {
	componentType = "dropdown",
	fieldLabel = "ReasonForAbuse",
	componentName = "AbuseReason",
	getIsVisible = function(_) --[[ line: 9 ]]
		return true
	end,
	getMenuItems = function(p0) --[[ line: 12 ]]
		-- upvalues: constantsModule (ref), cryoModule (ref)
		return cryoModule.Dictionary.values(if p0.methodOfAbuse == "Voice Chat" then constantsModule.PlayerVoiceAbuseTypes else constantsModule.PlayerAbuseTypes)
	end,
	onUpdateSelectedOption = function(p1, _, p2, p3) --[[ line: 18 ]]
		-- upvalues: constantsModule (ref)
		p3.analyticsDispatch({
			type = constantsModule.AnalyticsActions.IncrementReasonChanged
		})
		p3.analyticsDispatch({
			type = constantsModule.AnalyticsActions.SetReasonSelection,
			selection = p1
		})
		p2({
			type = constantsModule.PlayerMenuActions.UpdateAbuseReason,
			abuseReason = p1
		})
	end
}