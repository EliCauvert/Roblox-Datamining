local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local constantsModule = require(abuseReportMenu.Components.Constants)
local _ = require(abuseReportMenu.Components.Types)
local cryoModule = require(corePackagesService.Packages.Cryo)

return {
	componentType = "modalSelector",
	fieldLabel = "ReasonForAbuse",
	componentName = "AbuseReason",
	getIsVisible = function(_)
		return true
	end,
	getMenuItems = function(p1, p2)
		-- upvalues: constantsModule (ref), cryoModule (ref)
		return cryoModule.List.map(cryoModule.Dictionary.values(if p1.methodOfAbuse == constantsModule.AbuseMethods.VoiceChat then constantsModule.PlayerVoiceAbuseTypes else constantsModule.PlayerAbuseTypes), function(p3)
			-- upvalues: p2 (ref)
			return { label = p2[p3], identifier = p3 }
		end)
	end,
	getSelectedValue = function(p1)
		return p1.abuseReason
	end,
	onUpdateSelectedOption = function(p1, _, p2, p3)
		-- upvalues: constantsModule (ref)
		p3.analyticsDispatch({
			type = constantsModule.AnalyticsActions.IncrementReasonChanged
		})
		p3.analyticsDispatch({
			type = constantsModule.AnalyticsActions.SetReasonSelection,
			selection = p1.identifier
		})
		p2({
			type = constantsModule.PlayerMenuActions.UpdateAbuseReason,
			abuseReason = p1.identifier
		})
	end
}