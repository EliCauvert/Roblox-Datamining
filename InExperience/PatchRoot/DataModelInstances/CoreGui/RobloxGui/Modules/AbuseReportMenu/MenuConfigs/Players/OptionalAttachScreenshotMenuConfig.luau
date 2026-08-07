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
	getIsVisible = function(p0) --[[ line: 11 ]]
		-- upvalues: tnSIXPWrapperModule (ref), constantsModule (ref)
		return tnSIXPWrapperModule.getReportAnythingAvatarEnabled() and (if p0.methodOfAbuse ~= constantsModule.AbuseMethods.Other then p0.methodOfAbuse == constantsModule.AbuseMethods.Avatar else true)
	end,
	getIsDisabled = function(_, p1) --[[ line: 18 ]]
		return p1.reportAnythingState.attachCompleted
	end,
	getIconSrc = function(p2) --[[ line: 22 ]]
		return if p2.reportAnythingState.attachCompleted then "icons/actions/accept" else "icons/controls/screenshot"
	end,
	getButtonLabel = function(p3) --[[ line: 27 ]]
		return if p3.reportAnythingState.attachCompleted then "SceneCaptured" else "CaptureScene"
	end,
	onClick = function(_, _, p4) --[[ line: 30 ]]
		-- upvalues: constantsModule (ref), annotationModalModule (ref)
		p4.analyticsDispatch({
			type = constantsModule.AnalyticsActions.IncrementCaptureScene
		})
		annotationModalModule.mountAnnotationPage(constantsModule.ReportTypes.Person, p4.hideReportTab, p4.reportAnythingAnalytics, p4.reportAnythingState, p4.reportAnythingDispatch)
	end
}