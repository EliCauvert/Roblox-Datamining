local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local parent = script.Parent.Parent
local screenshotDialogModule = require(parent.Components.ScreenshotDialog)
local screenshotReviewDialogModule = require(parent.Components.ScreenshotReviewDialog)
local _ = require(script.Parent.Parent.Parent.Components.Types)

return function(p0)
	-- upvalues: reactModule (ref), screenshotReviewDialogModule (ref), robloxTranslatorModule (ref), screenshotDialogModule (ref)
	local var5, var6 = reactModule.useState(if p0.initialPageNumber == nil then 1 else p0.initialPageNumber)
	local var7, var8 = reactModule.useState(1.777777777778)
	local var9, var10 = reactModule.useState(800)
	local var11, var12 = reactModule.useState(800)
	local var13, var14 = reactModule.useState(true)
	local var15 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(2)
	end, { var6 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(1)
	end, { var6 })
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var8 (ref), var10 (ref), var12 (ref), var14 (ref)
		local currentCamera = game.Workspace.CurrentCamera
		
		if currentCamera ~= nil then
			local viewportSize = currentCamera.viewportSize
			
			if p0.viewportInfo then
				var8(p0.viewportInfo.width / p0.viewportInfo.height)
			else
				var8(viewportSize.X / viewportSize.Y)
			end
			var10(viewportSize.Y)
			var12(viewportSize.X)
			var14(viewportSize.X < viewportSize.Y and viewportSize.X < 800)
		end
	end, {})
	local _ = nil
	
	return if var5 == 1 then reactModule.createElement(screenshotReviewDialogModule, {
		imageAspectRatio = var7,
		isSmallPortraitMode = var13,
		viewportUISafeAreaHeight = var9,
		viewportUISafeAreaWidth = var11,
		onNextPage = var15,
		onBack = p0.dismissAction,
		onSkip = p0.skipAnnotationAction,
		onRestart = p0.restartAction,
		screenshot = p0.screenshot,
		reportAnythingAnalytics = p0.reportAnythingAnalytics
	}, {}) else reactModule.createElement(screenshotDialogModule, {
		titleText = if p0.entryPoint == "player" then robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectPerson") else robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectProblem"),
		backAction = var16,
		dismissAction = p0.dismissAction,
		finishAnnotationAction = p0.finishAnnotationAction,
		initialAnnotationPoints = p0.initialAnnotationPoints,
		isSmallPortraitMode = var13,
		screenshot = p0.screenshot,
		imageAspectRatio = var7,
		setAnnotationCircleRadius = p0.setAnnotationCircleRadius,
		setAnnotationAreaDimensions = p0.setAnnotationAreaDimensions,
		reportAnythingAnalytics = p0.reportAnythingAnalytics
	})
end