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
	getMenuItems = function(p0, p1)
		-- upvalues: constantsModule (ref), cryoModule (ref)
		return cryoModule.List.map(cryoModule.Dictionary.values(if p0.methodOfAbuse == constantsModule.AbuseMethods.VoiceChat then constantsModule.PlayerVoiceAbuseTypes else constantsModule.PlayerAbuseTypes), function(p2)
			-- upvalues: p1 (ref)
			return { label = p1[p2], identifier = p2 }
		end)
	end,
	getSelectedValue = function(p3)
		return p3.abuseReason
	end,
	onUpdateSelectedOption = function(p4, _, p5, p6)
		-- upvalues: constantsModule (ref)
		p6.analyticsDispatch({
			type = constantsModule.AnalyticsActions.IncrementReasonChanged
		})
		p6.analyticsDispatch({
			type = constantsModule.AnalyticsActions.SetReasonSelection,
			selection = p4.identifier
		})
		p5({
			type = constantsModule.PlayerMenuActions.UpdateAbuseReason,
			abuseReason = p4.identifier
		})
	end
}