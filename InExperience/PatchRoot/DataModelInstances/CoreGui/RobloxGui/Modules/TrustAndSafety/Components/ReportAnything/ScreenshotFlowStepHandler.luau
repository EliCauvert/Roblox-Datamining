local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local parent = script.Parent.Parent.Parent
local screenshotDialogModule = require(parent.Components.ReportAnything.ScreenshotDialog)
local screenshotReviewDialogModule = require(parent.Components.ReportAnything.ScreenshotReviewDialog)
local getFFlagReportAnythingLocalizationEnabledModule = require(parent.Flags.GetFFlagReportAnythingLocalizationEnabled)

return function(p1)
	-- upvalues: reactModule (ref), screenshotReviewDialogModule (ref), getFFlagReportAnythingLocalizationEnabledModule (ref), robloxTranslatorModule (ref), screenshotDialogModule (ref)
	local var1, var2 = reactModule.useState(if p1.initialPageNumber == nil then 1 else p1.initialPageNumber)
	local var3, var4 = reactModule.useState(1.777777777778)
	local var5, var6 = reactModule.useState(800)
	local var7, var8 = reactModule.useState(800)
	local var9, var10 = reactModule.useState(true)
	local var11 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(2)
	end, { var2 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(1)
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), var6 (ref), var8 (ref), var10 (ref), p1 (ref)
		local currentCamera = game.Workspace.CurrentCamera
		
		if currentCamera ~= nil then
			local viewportSize = currentCamera.ViewportSize
			var4(viewportSize.X / viewportSize.Y)
			var6(viewportSize.Y)
			var8(viewportSize.X)
			var10(viewportSize.X < viewportSize.Y and viewportSize.X < 800)
			
			if p1.reportAnythingAnalytics and viewportSize.X < viewportSize.Y then
				p1.reportAnythingAnalytics.setIsPortraitMode()
			end
		end
	end, {})
	local _ = nil
	
	return if var1 == 1 then reactModule.createElement(screenshotReviewDialogModule, {
		imageAspectRatio = var3,
		isSmallPortraitMode = var9,
		viewportHeight = var5,
		viewportWidth = var7,
		onNextPage = var11,
		onBack = p1.dismissAction,
		onSkip = p1.skipAnnotationAction,
		onRestart = p1.restartAction,
		screenshot = p1.screenshot,
		reportAnythingAnalytics = p1.reportAnythingAnalytics
	}, {}) else reactModule.createElement(screenshotDialogModule, {
		titleText = if getFFlagReportAnythingLocalizationEnabledModule() then p1.entryPoint == "player" and robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectPerson") or robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectProblem") elseif p1.entryPoint == "player" then "Select Person in Scene" else "Select Problem in Scene",
		backAction = var12,
		dismissAction = p1.dismissAction,
		reportAction = p1.reportAction,
		initialAnnotationPoints = p1.initialAnnotationPoints,
		isSmallPortraitMode = var9,
		screenshot = p1.screenshot,
		imageAspectRatio = var3,
		reportAnythingAnalytics = p1.reportAnythingAnalytics
	})
end