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
	getIsVisible = function(p1)
		-- upvalues: tnSIXPWrapperModule (ref)
		return p1.isVoiceEnabled or tnSIXPWrapperModule.getReportAnythingAvatarEnabled()
	end,
	getMenuItems = function(p1)
		-- upvalues: cryoModule (ref), default (ref), getAvailableMethodsOfAbuseModule (ref), tnSIXPWrapperModule (ref)
		return getAvailableMethodsOfAbuseModule(p1.isVoiceEnabled and not cryoModule.isEmpty(default:getRecentUsersInteractionData()), tnSIXPWrapperModule.getReportAnythingAvatarEnabled())
	end,
	getSelectedValue = function(p1)
		return p1.methodOfAbuse
	end,
	onUpdateSelectedOption = function(p1, p2, p3, p4)
		-- upvalues: constantsModule (ref)
		p3({
			type = constantsModule.PlayerMenuActions.UpdateMethodOfAbuse,
			methodOfAbuse = p1.identifier
		})
		
		if p1.identifier ~= p2.methodOfAbuse then
			p4.reportAnythingDispatch({
				type = constantsModule.ReportAnythingActions.ClearAnnotationFlowProperties
			})
			p4.analyticsDispatch({
				type = constantsModule.AnalyticsActions.IncrementTypeofabuseChanged
			})
			p4.analyticsDispatch({
				type = constantsModule.AnalyticsActions.SetTypeOfAbuseSelection,
				selection = p1.identifier
			})
		end
	end
}