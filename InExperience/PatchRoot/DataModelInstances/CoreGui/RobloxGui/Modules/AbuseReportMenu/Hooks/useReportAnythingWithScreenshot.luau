local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local reactModule = require(game:GetService("CorePackages").Packages.React)
local constantsModule = require(abuseReportMenu.Components.Constants)
local useHideForScreenshotModule = require(abuseReportMenu.Hooks.useHideForScreenshot)
local useCaptureScreenshotModule = require(abuseReportMenu.Hooks.useCaptureScreenshot)
local reportAnythingReducerModule = require(abuseReportMenu.Reducers.reportAnythingReducer)
local tnSIXPWrapperModule = require(abuseReportMenu.IXP.TnSIXPWrapper)

return function(p1, p2, p3, p4)
	-- upvalues: tnSIXPWrapperModule (ref), reactModule (ref), reportAnythingReducerModule (ref), constantsModule (ref), useCaptureScreenshotModule (ref), useHideForScreenshotModule (ref)
	local var1
	local reportAnythingAvatarEnabled = tnSIXPWrapperModule.getReportAnythingAvatarEnabled()
	local reportAnythingExperienceEnabled = tnSIXPWrapperModule.getReportAnythingExperienceEnabled()
	local var2, var3 = reactModule.useReducer(reportAnythingReducerModule, constantsModule.ReportAnythingInitialState)
	
	if not reportAnythingAvatarEnabled then
		var1 = reportAnythingExperienceEnabled and var2.screenshotContentId == ""
	end
	useHideForScreenshotModule(var1, p1, p2, p3, useCaptureScreenshotModule(reactModule.useCallback(function(p5)
		-- upvalues: var3 (ref), constantsModule (copy)
		var3({
			type = constantsModule.ReportAnythingActions.SetScreenshotContentId,
			screenshotContentId = p5
		})
	end), reactModule.useCallback(function(p5)
		-- upvalues: var3 (ref), constantsModule (copy)
		var3({
			type = constantsModule.ReportAnythingActions.SetScreenshotId,
			screenshotId = p5
		})
	end), reactModule.useCallback(function(p5)
		-- upvalues: var3 (ref), constantsModule (copy)
		var3({
			type = constantsModule.ReportAnythingActions.SetIdentificationResults,
			identificationResults = p5
		})
	end)), function()
		-- upvalues: p4 (ref), var2 (ref), var3 (ref)
		p4(var2, var3)
	end)
	
	return var2, var3
end