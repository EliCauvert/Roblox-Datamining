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
	getIsVisible = function(p1): boolean
		-- upvalues: TnSIXPWrapperModule (copy), ConstantsModule (copy)
		return TnSIXPWrapperModule.getReportAnythingAvatarEnabled() and (p1.methodOfAbuse == ConstantsModule.AbuseMethods.Other or p1.methodOfAbuse == ConstantsModule.AbuseMethods.Avatar)
	end,
	getIsDisabled = function(_, p1)
		return p1.reportAnythingState.attachCompleted
	end,
	getIconSrc = function(p1): string
		return if p1.reportAnythingState.attachCompleted then "icons/actions/accept" else "icons/controls/screenshot"
	end,
	getButtonLabel = function(p1): string
		return if p1.reportAnythingState.attachCompleted then "SceneCaptured" else "CaptureScene"
	end,
	onClick = function(_, _, p1)
		-- upvalues: ConstantsModule (copy), AnnotationModalModule (copy)
		p1.analyticsDispatch({
			type = ConstantsModule.AnalyticsActions.IncrementCaptureScene
		})
		AnnotationModalModule.mountAnnotationPage(ConstantsModule.ReportTypes.Person, p1.hideReportTab, p1.reportAnythingAnalytics, p1.reportAnythingState, p1.reportAnythingDispatch)
	end
}