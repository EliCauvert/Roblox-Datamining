local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(AbuseReportMenu.Components.Types)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local GetAvailableMethodsOfAbuseModule = require(AbuseReportMenu.Utility.getAvailableMethodsOfAbuse)
local TnSIXPWrapperModule = require(AbuseReportMenu.IXP.TnSIXPWrapper)
local Default = require(game:GetService("CoreGui").RobloxGui.Modules.VoiceChat.VoiceChatServiceManager).default
local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)

return {
	componentType = "modalSelector",
	fieldLabel = "MethodOfAbuse",
	componentName = "MethodOfAbuse",
	getIsVisible = function(p1)
		-- upvalues: TnSIXPWrapperModule (copy)
		return p1.isVoiceEnabled or TnSIXPWrapperModule.getReportAnythingAvatarEnabled()
	end,
	getMenuItems = function(p1)
		-- upvalues: CryoModule (copy), Default (copy), GetAvailableMethodsOfAbuseModule (copy), TnSIXPWrapperModule (copy)
		return GetAvailableMethodsOfAbuseModule(p1.isVoiceEnabled and not CryoModule.isEmpty(Default:getRecentUsersInteractionData()), TnSIXPWrapperModule.getReportAnythingAvatarEnabled())
	end,
	getSelectedValue = function(p1)
		return p1.methodOfAbuse
	end,
	onUpdateSelectedOption = function(p1, p2, Callback: (any) -> (), p3)
		-- upvalues: ConstantsModule (copy)
		Callback({
			type = ConstantsModule.PlayerMenuActions.UpdateMethodOfAbuse,
			methodOfAbuse = p1.identifier
		})
		
		if p1.identifier ~= p2.methodOfAbuse then
			p3.reportAnythingDispatch({
				type = ConstantsModule.ReportAnythingActions.ClearAnnotationFlowProperties
			})
			p3.analyticsDispatch({
				type = ConstantsModule.AnalyticsActions.IncrementTypeofabuseChanged
			})
			p3.analyticsDispatch({
				type = ConstantsModule.AnalyticsActions.SetTypeOfAbuseSelection,
				selection = p1.identifier
			})
		end
	end
}