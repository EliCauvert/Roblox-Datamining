local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local reactModule = require(game:GetService("CorePackages").Packages.React)
local constantsModule = require(abuseReportMenu.Components.Constants)
local useHideForScreenshotModule = require(abuseReportMenu.Hooks.useHideForScreenshot)
local useCaptureScreenshotModule = require(abuseReportMenu.Hooks.useCaptureScreenshot)
local reportAnythingReducerModule = require(abuseReportMenu.Reducers.reportAnythingReducer)
local tnSIXPWrapperModule = require(abuseReportMenu.IXP.TnSIXPWrapper)

return function(p0, p1, p2, p3) --[[ line: 12 ]]
	-- upvalues: tnSIXPWrapperModule (ref), reactModule (ref), reportAnythingReducerModule (ref), constantsModule (ref), useCaptureScreenshotModule (ref), useHideForScreenshotModule (ref)
	local var11
	local reportAnythingAvatarEnabled = tnSIXPWrapperModule.getReportAnythingAvatarEnabled()
	local reportAnythingExperienceEnabled = tnSIXPWrapperModule.getReportAnythingExperienceEnabled()
	local var9, var10 = reactModule.useReducer(reportAnythingReducerModule, constantsModule.ReportAnythingInitialState)
	
	if not reportAnythingAvatarEnabled then
		var11 = reportAnythingExperienceEnabled and var9.screenshotContentId == ""
	end
	useHideForScreenshotModule(var11, p0, p1, p2, useCaptureScreenshotModule(reactModule.useCallback(function(p4) --[[ line: 25 ]]
		-- upvalues: var10 (ref), constantsModule (copy)
		var10({
			type = constantsModule.ReportAnythingActions.SetScreenshotContentId,
			screenshotContentId = p4
		})
	end), reactModule.useCallback(function(p5) --[[ line: 31 ]]
		-- upvalues: var10 (ref), constantsModule (copy)
		var10({
			type = constantsModule.ReportAnythingActions.SetScreenshotId,
			screenshotId = p5
		})
	end), reactModule.useCallback(function(p6) --[[ line: 37 ]]
		-- upvalues: var10 (ref), constantsModule (copy)
		var10({
			type = constantsModule.ReportAnythingActions.SetIdentificationResults,
			identificationResults = p6
		})
	end)), function() --[[ line: 44 ]]
		-- upvalues: p3 (ref), var9 (ref), var10 (ref)
		p3(var9, var10)
	end)
	
	return var9, var10
end