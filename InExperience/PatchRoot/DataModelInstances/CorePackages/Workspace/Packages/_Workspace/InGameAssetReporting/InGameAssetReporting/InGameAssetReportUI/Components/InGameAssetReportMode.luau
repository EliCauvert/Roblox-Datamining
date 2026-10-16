local inGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local parent = inGameAssetReporting.Parent
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local withLocalization = require(parent.Localization).withLocalization
local screenshotManager = require(parent.Screenshot).ScreenshotManager
local constantsModule = require(inGameAssetReporting.InGameAssetReportUI.Resources.Constants)
local analyticsReducerModule = require(inGameAssetReporting.InGameAssetReportUI.Resources.AnalyticsReducer)
local sceneAnalysisModule = require(inGameAssetReporting.Analysis.SceneAnalysis)
local inGameAssetReportSubmitDialogModule = require(inGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportSubmitDialog)
local inGameAssetReportErrorModalModule = require(inGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportErrorModal)
local inGameAssetReportCompleteModalModule = require(inGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportCompleteModal)
local inGameAssetReportLandscapeHeaderModule = require(inGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportLandscapeHeader)
local inGameAssetReportPortraitHeaderFooterModule = require(inGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportPortraitHeaderFooter)
local screenshotHighlighterModule = require(inGameAssetReporting.InGameAssetReportUI.Components.ScreenshotHighlighter)
local buildReportModule = require(inGameAssetReporting.Utility.buildReport)
local inGameAssetReportAnalyticsModule = require(inGameAssetReporting.InGameAssetReportUI.Resources.InGameAssetReportAnalytics)
local fFlagUpdateInGameAssetReportingCTAs = require(parent.SharedFlags).FFlagUpdateInGameAssetReportingCTAs

local var1 = function(p1)
	return p1.point
end

local var2 = function(p1)
	return p1.interpretationResult
end

return function(p1)
	-- upvalues: reactModule (ref), analyticsReducerModule (ref), constantsModule (ref), sceneAnalysisModule (ref), experienceStateCaptureService (ref), screenshotManager (ref), cryoModule (ref), var2 (ref), inGameAssetReportAnalyticsModule (ref), var1 (ref), buildReportModule (ref), playersService (ref), userInputService (ref), withLocalization (ref), fFlagUpdateInGameAssetReportingCTAs (ref), inGameAssetReportPortraitHeaderFooterModule (ref), inGameAssetReportLandscapeHeaderModule (ref), screenshotHighlighterModule (ref), inGameAssetReportErrorModalModule (ref), inGameAssetReportSubmitDialogModule (ref), inGameAssetReportCompleteModalModule (ref)
	local var3, var4 = reactModule.useState({})
	local var5, var6 = reactModule.useState({})
	local var7, var8 = reactModule.useState(false)
	local var9, var10 = reactModule.useState(false)
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState("")
	local var15, var16 = reactModule.useState(nil)
	local var17, var18 = reactModule.useState(nil)
	local var19, var20 = reactModule.useState(true)
	local var21, var22 = reactModule.useReducer(analyticsReducerModule, constantsModule.AnalyticsInitialState)
	local var23, var24 = reactModule.useState(nil)
	local viewportSize = game.Workspace.CurrentCamera.ViewportSize
	local isSmallPortraitMode = p1.getIsSmallPortraitMode(viewportSize)
	reactModule.useEffect(function()
		-- upvalues: var22 (ref), constantsModule (copy)
		var22({
			type = constantsModule.AnalyticsActions.AccumulateForTimeSpent,
			accumulated_time_ms = workspace:GetServerTimeNow() * 1000
		})
		var22({
			type = constantsModule.AnalyticsActions.SetPlaceId,
			place_id = game.PlaceId
		})
	end, {})
	local var25 = reactModule.useCallback(function(p2, p3)
		-- upvalues: sceneAnalysisModule (copy), viewportSize (ref), experienceStateCaptureService (copy), var3 (ref), var13 (ref), screenshotManager (copy), var14 (ref), var4 (ref), var6 (ref), var22 (ref), constantsModule (copy)
		local t = {
			point = p2,
			interpretationResult = sceneAnalysisModule.interpretAnnotation(p2 * viewportSize, p3 * math.max(viewportSize.X, viewportSize.Y), function() end)
		}
		t.signalConnection = experienceStateCaptureService.ItemSelectedInCaptureMode:Once(function(p4)
			-- upvalues: t (ref)
			t.engineSignalItem = p4
		end)
		
		for i, v in ipairs(var3) do
			v.signalConnection:Disconnect()
		end
		if #var3 == 0 and var13 == "" then
			screenshotManager:TakeScreenshotWithCallback(var14, nil)
		end
		local cloned = table.clone(var3)
		table.insert(cloned, t)
		var4(cloned)
		var6({})
		var22({
			type = constantsModule.AnalyticsActions.IncremementAnnotationCount
		})
		task.defer(t.interpretationResult.raycastComputation)
	end, { var3, var4, var6, var13 })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var5 (ref), var6 (ref), var4 (ref), var22 (ref), constantsModule (copy)
		if #var3 > 0 then
			local cloned = table.clone(var3)
			local cloned_1 = table.clone(var5)
			table.insert(cloned_1, table.remove(cloned))
			var6(cloned_1)
			var4(cloned)
			var22({
				type = constantsModule.AnalyticsActions.IncremementAnnotationUndoCount
			})
		end
	end, { var4, var3, var6, var5 })
	local var27 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var3 (ref), var6 (ref), var4 (ref), var22 (ref), constantsModule (copy)
		if #var5 > 0 then
			local cloned = table.clone(var3)
			local cloned_1 = table.clone(var5)
			table.insert(cloned, table.remove(cloned_1))
			var6(cloned_1)
			var4(cloned)
			var22({
				type = constantsModule.AnalyticsActions.IncremementAnnotationRedoCount
			})
		end
	end, { var3, var5 })
	local var28 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var13 (ref), screenshotManager (copy), var14 (ref), cryoModule (copy), sceneAnalysisModule (copy), var18 (ref), var2 (copy), var16 (ref), var8 (ref), var22 (ref), constantsModule (copy), viewportSize (ref), isSmallPortraitMode (ref)
		if #var3 == 0 and var13 == "" then
			screenshotManager:TakeScreenshotWithCallback(var14, nil)
		end
		local var29 = sceneAnalysisModule.extractItemsFromInterpretations({
			sceneAnalysisModule.interpretInstanceListForGUIObjects(cryoModule.List.map(var3, function(p4)
				return p4.engineSignalItem
			end))
		}, function() end)
		var18(var29)
		task.defer(var29.computation)
		local var30 = sceneAnalysisModule.extractItemsFromInterpretations(cryoModule.List.map(var3, var2), function() end)
		var16(var30)
		var8(true)
		var22({
			type = constantsModule.AnalyticsActions.SetViewportInformation,
			viewport_size_x = viewportSize.X,
			viewport_size_y = viewportSize.Y,
			is_portrait_mode = isSmallPortraitMode
		})
		var22({
			type = constantsModule.AnalyticsActions.IncrementNextCount
		})
		task.defer(var30.computation)
	end, {
		var3, var8, var16, var13, viewportSize, isSmallPortraitMode
	})
	local var29 = reactModule.useCallback(function()
		-- upvalues: inGameAssetReportAnalyticsModule (copy), var21 (ref), p1 (ref)
		inGameAssetReportAnalyticsModule(var21, 2)
		p1.backAction()
	end, { p1.backAction, var21 })
	local var30 = cryoModule.List.map(var3, var1)
	local var31 = reactModule.useCallback(function(p4, p5, p6)
		-- upvalues: var8 (ref), var10 (ref), var22 (ref), constantsModule (copy), var15 (ref), var3 (ref), buildReportModule (copy), playersService (copy), var13 (ref), var30 (ref), var17 (ref)
		var8(false)
		var10(true)
		var22({
			type = constantsModule.AnalyticsActions.SetExtractionResults,
			results = var15,
			final_annotation_count = #var3
		})
		var22({
			type = constantsModule.AnalyticsActions.SetReasonSelection,
			reason_selection = p4
		})
		var22({
			type = constantsModule.AnalyticsActions.SetSurfaceSelection,
			surface_selection = p5
		})
		var22({
			type = constantsModule.AnalyticsActions.SetCommentAdded,
			comment_added = #p6 > 0
		})
		local var32 = buildReportModule(playersService.LocalPlayer.UserId, var13, var15, p4, p5, p6, var30, var17)
		
		if var32 then
			playersService:ReportAbuseV3(playersService.LocalPlayer, var32)
		end
	end, {
		var15, var17, var8, var10, var13, var3, var30
	})
	local var32 = reactModule.useCallback(function()
		-- upvalues: var16 (ref), var8 (ref)
		var16(nil)
		var8(false)
	end, { var8, var16 })
	local var33 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), inGameAssetReportAnalyticsModule (copy), var21 (ref), p1 (ref)
		var10(false)
		inGameAssetReportAnalyticsModule(var21, 1)
		p1.onReportComplete()
	end, { p1.onReportComplete, var3, var10, var21 })
	local var34 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var12 (ref)
		for i, v in ipairs(var3) do
			v.signalConnection:Disconnect()
		end
		var12(true)
	end, { var12, var3 })
	local var35 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12(false)
	end, {})
	local var36 = reactModule.useCallback(function()
		-- upvalues: var19 (ref), var20 (ref), var22 (ref), constantsModule (copy), var7 (ref), var4 (ref), var6 (ref)
		if var19 then
			var20(false)
		else
			var22({
				did_user_resize = true,
				type = constantsModule.AnalyticsActions.SetDidUserResize
			})
		end
		if not var7 then
			var4({})
			var6({})
		end
	end, { var19, var7 })
	local var37 = #var3 > 0
	local var38 = #var5 > 0
	reactModule.useEffect(function()
		-- upvalues: var23 (ref), userInputService (copy), var29 (ref), var24 (ref)
		if var23 then
			var23:Disconnect()
		end
		var24(userInputService.InputEnded:Connect(function(p4)
			-- upvalues: var29 (copy)
			if p4.KeyCode == Enum.KeyCode.Escape then
				var29()
			end
		end))
	end, { var29 })
	
	return withLocalization({
		mainTitle = "Feature.ReportAbuse.Label.HighlightProblem",
		next = if fFlagUpdateInGameAssetReportingCTAs then "CommonUI.Controls.Action.Continue" else "Feature.ReportAbuse.Action.Next"
	})(function(p4)
		-- upvalues: reactModule (copy), var36 (ref), isSmallPortraitMode (ref), inGameAssetReportPortraitHeaderFooterModule (copy), var29 (ref), var26 (ref), var27 (ref), var38 (ref), var37 (ref), var3 (ref), inGameAssetReportLandscapeHeaderModule (copy), var28 (ref), screenshotHighlighterModule (copy), var30 (ref), var25 (ref), var34 (ref), var11 (ref), inGameAssetReportErrorModalModule (copy), viewportSize (ref), var35 (ref), var7 (ref), inGameAssetReportSubmitDialogModule (copy), var31 (ref), var32 (ref), var22 (ref), var9 (ref), inGameAssetReportCompleteModalModule (copy), var33 (ref)
		return reactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			[reactModule.Change.AbsoluteSize] = var36
		}, {
			Header = reactModule.createElement("TextButton", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				AutoButtonColor = false,
				Size = UDim2.new(1, 0, 0, 72)
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				InGameAssetReportModeHeader = if isSmallPortraitMode then reactModule.createElement(inGameAssetReportPortraitHeaderFooterModule.PortraitModeHeader, {
					titleText = p4.mainTitle,
					nextText = p4.next,
					backAction = var29,
					undoAnnotationPoints = var26,
					redoAnnotationPoints = var27,
					isRedoEnabled = var38,
					isUndoEnabled = var37,
					annotationPoints = var3
				}) else reactModule.createElement(inGameAssetReportLandscapeHeaderModule, {
					titleText = p4.mainTitle,
					nextText = p4.next,
					nextAction = var28,
					backAction = var29,
					undoAnnotationPoints = var26,
					redoAnnotationPoints = var27,
					isRedoEnabled = var38,
					isUndoEnabled = var37,
					annotationPoints = var3
				})
			}),
			Footer = if isSmallPortraitMode then reactModule.createElement("TextButton", {
				ZIndex = 2,
				BackgroundTransparency = 1,
				AutoButtonColor = false,
				Size = UDim2.new(1, 0, 0, 60),
				Position = UDim2.new(0, 0, 1, -60)
			}, {
				InGameAssetReportModeFooter = reactModule.createElement(inGameAssetReportPortraitHeaderFooterModule.PortraitModeFooter, {
					nextAction = var28,
					annotationPoints = var3,
					nextText = p4.next
				})
			}) else nil,
			ScreenshotAnnotation = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				ZIndex = 1,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				Highlighter = reactModule.createElement(screenshotHighlighterModule, {
					ZIndex = 2,
					annotationPoints = var30,
					handleNewAnnotationPoint = var25,
					onExceedMaxAnnotationLimit = var34
				}, {})
			}),
			ErrorStateModal = if var11 then reactModule.createElement(inGameAssetReportErrorModalModule, { screenSize = viewportSize, onBack = var35 }) else nil,
			SubmitDialog = if var7 then reactModule.createElement(inGameAssetReportSubmitDialogModule, {
				screenSize = viewportSize,
				onSubmit = var31,
				onBack = var32,
				analyticsDispatch = var22
			}) else nil,
			ReportCompleteModal = if var9 then reactModule.createElement(inGameAssetReportCompleteModalModule, { screenSize = viewportSize, onClose = var33 }) else nil
		})
	end)
end