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
	getIsVisible = function(_) --[[ line: 11 ]]
		-- upvalues: tnSIXPWrapperModule (ref)
		return tnSIXPWrapperModule.getReportAnythingExperienceEnabled()
	end,
	getIsDisabled = function(_, p0) --[[ line: 14 ]]
		return p0.reportAnythingState.attachCompleted
	end,
	getIconSrc = function(p1) --[[ line: 18 ]]
		return if p1.reportAnythingState.attachCompleted then "icons/actions/accept" else "icons/controls/screenshot"
	end,
	getButtonLabel = function(p2) --[[ line: 23 ]]
		return if p2.reportAnythingState.attachCompleted then "SceneCaptured" else "CaptureScene"
	end,
	onClick = function(_, _, p3) --[[ line: 26 ]]
		-- upvalues: constantsModule (ref), annotationModalModule (ref)
		p3.analyticsDispatch({
			type = constantsModule.AnalyticsActions.IncrementCaptureScene
		})
		annotationModalModule.mountAnnotationPage(constantsModule.ReportTypes.Experience, p3.hideReportTab, p3.reportAnythingAnalytics, p3.reportAnythingState, p3.reportAnythingDispatch)
	end
}