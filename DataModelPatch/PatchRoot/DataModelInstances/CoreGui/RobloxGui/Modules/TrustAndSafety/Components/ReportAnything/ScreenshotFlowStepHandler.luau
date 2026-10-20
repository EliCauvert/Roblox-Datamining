local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local Parent = script.Parent.Parent.Parent
local ScreenshotDialogModule = require(Parent.Components.ReportAnything.ScreenshotDialog)
local ScreenshotReviewDialogModule = require(Parent.Components.ReportAnything.ScreenshotReviewDialog)
local GetFFlagReportAnythingLocalizationEnabledModule = require(Parent.Flags.GetFFlagReportAnythingLocalizationEnabled)

return function(p1)
	-- upvalues: ReactModule (copy), ScreenshotReviewDialogModule (copy), GetFFlagReportAnythingLocalizationEnabledModule (copy), RobloxTranslatorModule (copy), ScreenshotDialogModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(if p1.initialPageNumber == nil then 1 else p1.initialPageNumber)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(1.7777777777777777)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(800)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(800)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(true)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(2)
	end, { UseStateResult2 })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(1)
	end, { UseStateResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy), UseStateResult2_4 (copy), p1 (copy)
		local CurrentCamera = game.Workspace.CurrentCamera
		
		if CurrentCamera ~= nil then
			local ViewportSize = CurrentCamera.ViewportSize
			UseStateResult2_1(ViewportSize.X / ViewportSize.Y)
			UseStateResult2_2(ViewportSize.Y)
			UseStateResult2_3(ViewportSize.X)
			UseStateResult2_4(ViewportSize.X < ViewportSize.Y and ViewportSize.X < 800)
			
			if p1.reportAnythingAnalytics and ViewportSize.X < ViewportSize.Y then
				p1.reportAnythingAnalytics.setIsPortraitMode()
			end
		end
	end, {})
	
	return if UseStateResult == 1 then ReactModule.createElement(ScreenshotReviewDialogModule, {
		imageAspectRatio = UseStateResult1,
		isSmallPortraitMode = UseStateResult5,
		viewportHeight = UseStateResult3,
		viewportWidth = UseStateResult4,
		onNextPage = UseResult,
		onBack = p1.dismissAction,
		onSkip = p1.skipAnnotationAction,
		onRestart = p1.restartAction,
		screenshot = p1.screenshot,
		reportAnythingAnalytics = p1.reportAnythingAnalytics
	}, {}) else ReactModule.createElement(ScreenshotDialogModule, {
		titleText = if GetFFlagReportAnythingLocalizationEnabledModule() then p1.entryPoint == "player" and RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectPerson") or RobloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectProblem") elseif p1.entryPoint == "player" then "Select Person in Scene" else "Select Problem in Scene",
		backAction = UseResult1,
		dismissAction = p1.dismissAction,
		reportAction = p1.reportAction,
		initialAnnotationPoints = p1.initialAnnotationPoints,
		isSmallPortraitMode = UseStateResult5,
		screenshot = p1.screenshot,
		imageAspectRatio = UseStateResult1,
		reportAnythingAnalytics = p1.reportAnythingAnalytics
	})
end