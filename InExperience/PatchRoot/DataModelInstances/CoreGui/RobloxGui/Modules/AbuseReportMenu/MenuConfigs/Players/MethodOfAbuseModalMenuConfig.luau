local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local coreGuiService = game:GetService("CoreGui")
local _ = require(abuseReportMenu.Components.Types)
local corePackagesService = game:GetService("CorePackages")
local constantsModule = require(abuseReportMenu.Components.Constants)
local getAvailableMethodsOfAbuseModule = require(abuseReportMenu.Utility.getAvailableMethodsOfAbuse)
local tnSIXPWrapperModule = require(abuseReportMenu.IXP.TnSIXPWrapper)
local default = require(coreGuiService.RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local cryoModule = require(corePackagesService.Packages.Cryo)

return {
	componentType = "modalSelector",
	fieldLabel = "MethodOfAbuse",
	componentName = "MethodOfAbuse",
	getIsVisible = function(p0)
		-- upvalues: tnSIXPWrapperModule (ref)
		return p0.isVoiceEnabled or tnSIXPWrapperModule.getReportAnythingAvatarEnabled()
	end,
	getMenuItems = function(p1)
		-- upvalues: cryoModule (ref), default (ref), getAvailableMethodsOfAbuseModule (ref), tnSIXPWrapperModule (ref)
		return getAvailableMethodsOfAbuseModule(p1.isVoiceEnabled and not cryoModule.isEmpty(default:getRecentUsersInteractionData()), tnSIXPWrapperModule.getReportAnythingAvatarEnabled())
	end,
	getSelectedValue = function(p2)
		return p2.methodOfAbuse
	end,
	onUpdateSelectedOption = function(p3, p4, p5, p6)
		-- upvalues: constantsModule (ref)
		p5({
			type = constantsModule.PlayerMenuActions.UpdateMethodOfAbuse,
			methodOfAbuse = p3.identifier
		})
		
		if p3.identifier ~= p4.methodOfAbuse then
			p6.reportAnythingDispatch({
				type = constantsModule.ReportAnythingActions.ClearAnnotationFlowProperties
			})
			p6.analyticsDispatch({
				type = constantsModule.AnalyticsActions.IncrementTypeofabuseChanged
			})
			p6.analyticsDispatch({
				type = constantsModule.AnalyticsActions.SetTypeOfAbuseSelection,
				selection = p3.identifier
			})
		end
	end
}