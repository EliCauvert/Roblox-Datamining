local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)
local constantsModule = require(abuseReportMenu.Components.Constants)
local tnSIXPWrapperModule = require(abuseReportMenu.IXP.TnSIXPWrapper)
local annotationModalModule = require(abuseReportMenu.ReportAnything.Components.AnnotationModal)

return {
	componentType = "button",
	variant = "secondary",
	fieldLabel = "AttachScreenshot",
	componentName = "OptionalScreenshot",
	getIsVisible = function(_)
		-- upvalues: tnSIXPWrapperModule (ref)
		return tnSIXPWrapperModule.getReportAnythingExperienceEnabled()
	end,
	getIsDisabled = function(_, p1)
		return p1.reportAnythingState.attachCompleted
	end,
	getIconSrc = function(p1)
		return if p1.reportAnythingState.attachCompleted then "icons/actions/accept" else "icons/controls/screenshot"
	end,
	getButtonLabel = function(p1)
		return if p1.reportAnythingState.attachCompleted then "SceneCaptured" else "CaptureScene"
	end,
	onClick = function(_, _, p1)
		-- upvalues: constantsModule (ref), annotationModalModule (ref)
		p1.analyticsDispatch({
			type = constantsModule.AnalyticsActions.IncrementCaptureScene
		})
		annotationModalModule.mountAnnotationPage(constantsModule.ReportTypes.Experience, p1.hideReportTab, p1.reportAnythingAnalytics, p1.reportAnythingState, p1.reportAnythingDispatch)
	end
}