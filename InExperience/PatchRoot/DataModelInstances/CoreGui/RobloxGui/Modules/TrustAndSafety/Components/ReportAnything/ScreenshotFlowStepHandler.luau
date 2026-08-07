local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local parent = script.Parent.Parent.Parent
local screenshotDialogModule = require(parent.Components.ReportAnything.ScreenshotDialog)
local screenshotReviewDialogModule = require(parent.Components.ReportAnything.ScreenshotReviewDialog)
local getFFlagReportAnythingLocalizationEnabledModule = require(parent.Flags.GetFFlagReportAnythingLocalizationEnabled)

return function(p0) --[[ line: 21 | named "ScreenshotFlowStepHandler" ]]
	-- upvalues: reactModule (ref), screenshotReviewDialogModule (ref), getFFlagReportAnythingLocalizationEnabledModule (ref), robloxTranslatorModule (ref), screenshotDialogModule (ref)
	local var6, var7 = reactModule.useState(if p0.initialPageNumber == nil then 1 else p0.initialPageNumber)
	local var8, var9 = reactModule.useState(1.777777777778)
	local var10, var11 = reactModule.useState(800)
	local var12, var13 = reactModule.useState(800)
	local var14, var15 = reactModule.useState(true)
	local var16 = reactModule.useCallback(function() --[[ line: 28 ]]
		-- upvalues: var7 (ref)
		var7(2)
	end, { var7 })
	local var17 = reactModule.useCallback(function() --[[ line: 31 ]]
		-- upvalues: var7 (ref)
		var7(1)
	end, { var7 })
	reactModule.useEffect(function() --[[ line: 35 ]]
		-- upvalues: var9 (ref), var11 (ref), var13 (ref), var15 (ref), p0 (ref)
		local currentCamera = game.Workspace.CurrentCamera
		
		if currentCamera ~= nil then
			local viewportSize = currentCamera.ViewportSize
			var9(viewportSize.X / viewportSize.Y)
			var11(viewportSize.Y)
			var13(viewportSize.X)
			var15(viewportSize.X < viewportSize.Y and viewportSize.X < 800)
			
			if p0.reportAnythingAnalytics and viewportSize.X < viewportSize.Y then
				p0.reportAnythingAnalytics.setIsPortraitMode()
			end
		end
	end, {})
	local _ = nil
	
	return if var6 == 1 then reactModule.createElement(screenshotReviewDialogModule, {
		imageAspectRatio = var8,
		isSmallPortraitMode = var14,
		viewportHeight = var10,
		viewportWidth = var12,
		onNextPage = var16,
		onBack = p0.dismissAction,
		onSkip = p0.skipAnnotationAction,
		onRestart = p0.restartAction,
		screenshot = p0.screenshot,
		reportAnythingAnalytics = p0.reportAnythingAnalytics
	}, {}) else reactModule.createElement(screenshotDialogModule, {
		titleText = if getFFlagReportAnythingLocalizationEnabledModule() then p0.entryPoint == "player" and robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectPerson") or robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectProblem") elseif p0.entryPoint == "player" then "Select Person in Scene" else "Select Problem in Scene",
		backAction = var17,
		dismissAction = p0.dismissAction,
		reportAction = p0.reportAction,
		initialAnnotationPoints = p0.initialAnnotationPoints,
		isSmallPortraitMode = var14,
		screenshot = p0.screenshot,
		imageAspectRatio = var8,
		reportAnythingAnalytics = p0.reportAnythingAnalytics
	})
end