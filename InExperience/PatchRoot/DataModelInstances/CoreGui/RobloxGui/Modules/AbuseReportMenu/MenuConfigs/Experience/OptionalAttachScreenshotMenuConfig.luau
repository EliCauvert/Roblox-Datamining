local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(AbuseReportMenu.Components.Types)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local TnSIXPWrapperModule = require(AbuseReportMenu.IXP.TnSIXPWrapper)
local AnnotationModalModule = require(AbuseReportMenu.ReportAnything.Components.AnnotationModal)

return {
	componentType = "button",
	variant = "secondary",
	fieldLabel = "AttachScreenshot",
	componentName = "OptionalScreenshot",
	getIsVisible = function(_) --[[ Line: 11 ]]
		-- upvalues: TnSIXPWrapperModule (copy)
		return TnSIXPWrapperModule.getReportAnythingExperienceEnabled()
	end,
	getIsDisabled = function(_, p1) --[[ Line: 14 ]]
		return p1.reportAnythingState.attachCompleted
	end,
	getIconSrc = function(p1): string --[[ Line: 18 ]]
		return if p1.reportAnythingState.attachCompleted then "icons/actions/accept" else "icons/controls/screenshot"
	end,
	getButtonLabel = function(p1): string --[[ Line: 23 ]]
		return if p1.reportAnythingState.attachCompleted then "SceneCaptured" else "CaptureScene"
	end,
	onClick = function(_, _, p1) --[[ Line: 26 ]]
		-- upvalues: ConstantsModule (copy), AnnotationModalModule (copy)
		p1.analyticsDispatch({
			type = ConstantsModule.AnalyticsActions.IncrementCaptureScene
		})
		AnnotationModalModule.mountAnnotationPage(ConstantsModule.ReportTypes.Experience, p1.hideReportTab, p1.reportAnythingAnalytics, p1.reportAnythingState, p1.reportAnythingDispatch)
	end
}