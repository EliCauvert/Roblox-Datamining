local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local parent = script.Parent.Parent
local screenshotDialogModule = require(parent.Components.ScreenshotDialog)
local screenshotReviewDialogModule = require(parent.Components.ScreenshotReviewDialog)
local _ = require(script.Parent.Parent.Parent.Components.Types)

return function(p1)
	-- upvalues: reactModule (ref), screenshotReviewDialogModule (ref), robloxTranslatorModule (ref), screenshotDialogModule (ref)
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
		-- upvalues: p1 (ref), var4 (ref), var6 (ref), var8 (ref), var10 (ref)
		local currentCamera = game.Workspace.CurrentCamera
		
		if currentCamera ~= nil then
			local viewportSize = currentCamera.viewportSize
			
			if p1.viewportInfo then
				var4(p1.viewportInfo.width / p1.viewportInfo.height)
			else
				var4(viewportSize.X / viewportSize.Y)
			end
			var6(viewportSize.Y)
			var8(viewportSize.X)
			var10(viewportSize.X < viewportSize.Y and viewportSize.X < 800)
		end
	end, {})
	local _ = nil
	
	return if var1 == 1 then reactModule.createElement(screenshotReviewDialogModule, {
		imageAspectRatio = var3,
		isSmallPortraitMode = var9,
		viewportUISafeAreaHeight = var5,
		viewportUISafeAreaWidth = var7,
		onNextPage = var11,
		onBack = p1.dismissAction,
		onSkip = p1.skipAnnotationAction,
		onRestart = p1.restartAction,
		screenshot = p1.screenshot,
		reportAnythingAnalytics = p1.reportAnythingAnalytics
	}, {}) else reactModule.createElement(screenshotDialogModule, {
		titleText = if p1.entryPoint == "player" then robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectPerson") else robloxTranslatorModule:FormatByKey("Feature.ReportAbuse.Label.SelectProblem"),
		backAction = var12,
		dismissAction = p1.dismissAction,
		finishAnnotationAction = p1.finishAnnotationAction,
		initialAnnotationPoints = p1.initialAnnotationPoints,
		isSmallPortraitMode = var9,
		screenshot = p1.screenshot,
		imageAspectRatio = var3,
		setAnnotationCircleRadius = p1.setAnnotationCircleRadius,
		setAnnotationAreaDimensions = p1.setAnnotationAreaDimensions,
		reportAnythingAnalytics = p1.reportAnythingAnalytics
	})
end