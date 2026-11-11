local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local ReactModule = require(game:GetService("CorePackages").Packages.React)
local ConstantsModule = require(AbuseReportMenu.Components.Constants)
local UseHideForScreenshotModule = require(AbuseReportMenu.Hooks.useHideForScreenshot)
local UseCaptureScreenshotModule = require(AbuseReportMenu.Hooks.useCaptureScreenshot)
local ReportAnythingReducerModule = require(AbuseReportMenu.Reducers.reportAnythingReducer)
local TnSIXPWrapperModule = require(AbuseReportMenu.IXP.TnSIXPWrapper)

return function(p1, p2, p3, Callback)
	-- upvalues: TnSIXPWrapperModule (copy), ReactModule (copy), ReportAnythingReducerModule (copy), ConstantsModule (copy), UseCaptureScreenshotModule (copy), UseHideForScreenshotModule (copy)
	local ReportAnythingAvatarEnabled = TnSIXPWrapperModule.getReportAnythingAvatarEnabled()
	local ReportAnythingExperienceEnabled = TnSIXPWrapperModule.getReportAnythingExperienceEnabled()
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(ReportAnythingReducerModule, ConstantsModule.ReportAnythingInitialState)
	UseHideForScreenshotModule(if ReportAnythingAvatarEnabled then UseReducerResult.screenshotContentId == "" else ReportAnythingExperienceEnabled and UseReducerResult.screenshotContentId == "", p1, p2, p3, UseCaptureScreenshotModule(ReactModule.useCallback(function(ScreenshotContentId)
		-- upvalues: UseReducerResult2 (copy), ConstantsModule (upval)
		UseReducerResult2({
			type = ConstantsModule.ReportAnythingActions.SetScreenshotContentId,
			screenshotContentId = ScreenshotContentId
		})
	end), ReactModule.useCallback(function(ScreenshotId)
		-- upvalues: UseReducerResult2 (copy), ConstantsModule (upval)
		UseReducerResult2({
			type = ConstantsModule.ReportAnythingActions.SetScreenshotId,
			screenshotId = ScreenshotId
		})
	end), ReactModule.useCallback(function(IdentificationResults)
		-- upvalues: UseReducerResult2 (copy), ConstantsModule (upval)
		UseReducerResult2({
			type = ConstantsModule.ReportAnythingActions.SetIdentificationResults,
			identificationResults = IdentificationResults
		})
	end)), function()
		-- upvalues: Callback (copy), UseReducerResult (copy), UseReducerResult2 (copy)
		Callback(UseReducerResult, UseReducerResult2)
	end)
	
	return UseReducerResult, UseReducerResult2
end