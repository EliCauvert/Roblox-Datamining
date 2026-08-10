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

local var17 = function(p0) --[[ line: 45 ]]
	return p0.point
end

local var18 = function(p1) --[[ line: 49 ]]
	return p1.interpretationResult
end

return function(p2) --[[ line: 53 ]]
	-- upvalues: reactModule (ref), analyticsReducerModule (ref), constantsModule (ref), sceneAnalysisModule (ref), experienceStateCaptureService (ref), screenshotManager (ref), cryoModule (ref), var18 (ref), inGameAssetReportAnalyticsModule (ref), var17 (ref), buildReportModule (ref), playersService (ref), userInputService (ref), withLocalization (ref), fFlagUpdateInGameAssetReportingCTAs (ref), inGameAssetReportPortraitHeaderFooterModule (ref), inGameAssetReportLandscapeHeaderModule (ref), screenshotHighlighterModule (ref), inGameAssetReportErrorModalModule (ref), inGameAssetReportSubmitDialogModule (ref), inGameAssetReportCompleteModalModule (ref)
	local var19, var20 = reactModule.useState({})
	local var21, var22 = reactModule.useState({})
	local var23, var24 = reactModule.useState(false)
	local var25, var26 = reactModule.useState(false)
	local var27, var28 = reactModule.useState(false)
	local var29, var30 = reactModule.useState("")
	local var31, var32 = reactModule.useState(nil)
	local var33, var34 = reactModule.useState(nil)
	local var35, var36 = reactModule.useState(true)
	local var37, var38 = reactModule.useReducer(analyticsReducerModule, constantsModule.AnalyticsInitialState)
	local var39, var40 = reactModule.useState(nil)
	local viewportSize = game.Workspace.CurrentCamera.ViewportSize
	local isSmallPortraitMode = p2.getIsSmallPortraitMode(viewportSize)
	reactModule.useEffect(function() --[[ line: 72 ]]
		-- upvalues: var38 (ref), constantsModule (copy)
		var38({
			type = constantsModule.AnalyticsActions.AccumulateForTimeSpent,
			accumulated_time_ms = workspace:GetServerTimeNow() * 1000
		})
		var38({
			type = constantsModule.AnalyticsActions.SetPlaceId,
			place_id = game.PlaceId
		})
	end, {})
	local var42 = reactModule.useCallback(function(p3, p4) --[[ line: 84 ]]
		-- upvalues: sceneAnalysisModule (copy), viewportSize (ref), experienceStateCaptureService (copy), var19 (ref), var29 (ref), screenshotManager (copy), var30 (ref), var20 (ref), var22 (ref), var38 (ref), constantsModule (copy)
		local t = {
			point = p3,
			interpretationResult = sceneAnalysisModule.interpretAnnotation(p3 * viewportSize, p4 * math.max(viewportSize.X, viewportSize.Y), function() --[[ line: 90 ]] end)
		}
		t.signalConnection = experienceStateCaptureService.ItemSelectedInCaptureMode:Once(function(p5) --[[ line: 94 ]]
			-- upvalues: t (ref)
			t.engineSignalItem = p5
		end)
		
		for i, v in ipairs(var19) do
			v.signalConnection:Disconnect()
		end
		if #var19 == 0 and var29 == "" then
			screenshotManager:TakeScreenshotWithCallback(var30, nil)
		end
		local cloned = table.clone(var19)
		table.insert(cloned, t)
		var20(cloned)
		var22({})
		var38({
			type = constantsModule.AnalyticsActions.IncremementAnnotationCount
		})
		task.defer(t.interpretationResult.raycastComputation)
	end, { var19, var20, var22, var29 })
	local var43 = reactModule.useCallback(function() --[[ line: 121 ]]
		-- upvalues: var19 (ref), var21 (ref), var22 (ref), var20 (ref), var38 (ref), constantsModule (copy)
		if #var19 > 0 then
			local cloned = table.clone(var19)
			local cloned_1 = table.clone(var21)
			table.insert(cloned_1, table.remove(cloned))
			var22(cloned_1)
			var20(cloned)
			var38({
				type = constantsModule.AnalyticsActions.IncremementAnnotationUndoCount
			})
		end
	end, { var20, var19, var22, var21 })
	local var44 = reactModule.useCallback(function() --[[ line: 138 ]]
		-- upvalues: var21 (ref), var19 (ref), var22 (ref), var20 (ref), var38 (ref), constantsModule (copy)
		if #var21 > 0 then
			local cloned = table.clone(var19)
			local cloned_1 = table.clone(var21)
			table.insert(cloned, table.remove(cloned_1))
			var22(cloned_1)
			var20(cloned)
			var38({
				type = constantsModule.AnalyticsActions.IncremementAnnotationRedoCount
			})
		end
	end, { var19, var21 })
	local var45 = reactModule.useCallback(function() --[[ line: 157 ]]
		-- upvalues: var19 (ref), var29 (ref), screenshotManager (copy), var30 (ref), cryoModule (copy), sceneAnalysisModule (copy), var34 (ref), var18 (copy), var32 (ref), var24 (ref), var38 (ref), constantsModule (copy), viewportSize (ref), isSmallPortraitMode (ref)
		if #var19 == 0 and var29 == "" then
			screenshotManager:TakeScreenshotWithCallback(var30, nil)
		end
		local var62 = sceneAnalysisModule.extractItemsFromInterpretations({
			sceneAnalysisModule.interpretInstanceListForGUIObjects(cryoModule.List.map(var19, function(p6) --[[ line: 163 ]]
				return p6.engineSignalItem
			end))
		}, function() --[[ line: 169 ]] end)
		var34(var62)
		task.defer(var62.computation)
		local var63 = sceneAnalysisModule.extractItemsFromInterpretations(cryoModule.List.map(var19, var18), function() --[[ line: 175 ]] end)
		var32(var63)
		var24(true)
		var38({
			type = constantsModule.AnalyticsActions.SetViewportInformation,
			viewport_size_x = viewportSize.X,
			viewport_size_y = viewportSize.Y,
			is_portrait_mode = isSmallPortraitMode
		})
		var38({
			type = constantsModule.AnalyticsActions.IncrementNextCount
		})
		task.defer(var63.computation)
	end, {
		var19, var24, var32, var29, viewportSize, isSmallPortraitMode
	})
	local var46 = reactModule.useCallback(function() --[[ line: 193 ]]
		-- upvalues: inGameAssetReportAnalyticsModule (copy), var37 (ref), p2 (ref)
		inGameAssetReportAnalyticsModule(var37, 2)
		p2.backAction()
	end, { p2.backAction, var37 })
	local var47 = cryoModule.List.map(var19, var17)
	local var48 = reactModule.useCallback(function(p7, p8, p9) --[[ line: 205 ]]
		-- upvalues: var24 (ref), var26 (ref), var38 (ref), constantsModule (copy), var31 (ref), var19 (ref), buildReportModule (copy), playersService (copy), var29 (ref), var47 (ref), var33 (ref)
		var24(false)
		var26(true)
		var38({
			type = constantsModule.AnalyticsActions.SetExtractionResults,
			results = var31,
			final_annotation_count = #var19
		})
		var38({
			type = constantsModule.AnalyticsActions.SetReasonSelection,
			reason_selection = p7
		})
		var38({
			type = constantsModule.AnalyticsActions.SetSurfaceSelection,
			surface_selection = p8
		})
		var38({
			type = constantsModule.AnalyticsActions.SetCommentAdded,
			comment_added = #p9 > 0
		})
		local var64 = buildReportModule(playersService.LocalPlayer.UserId, var29, var31, p7, p8, p9, var47, var33)
		
		if var64 then
			playersService:ReportAbuseV3(playersService.LocalPlayer, var64)
		end
	end, {
		var31, var33, var24, var26, var29, var19, var47
	})
	local var49 = reactModule.useCallback(function() --[[ line: 257 ]]
		-- upvalues: var32 (ref), var24 (ref)
		var32(nil)
		var24(false)
	end, { var24, var32 })
	local var50 = reactModule.useCallback(function() --[[ line: 263 ]]
		-- upvalues: var26 (ref), inGameAssetReportAnalyticsModule (copy), var37 (ref), p2 (ref)
		var26(false)
		inGameAssetReportAnalyticsModule(var37, 1)
		p2.onReportComplete()
	end, { p2.onReportComplete, var19, var26, var37 })
	local var51 = reactModule.useCallback(function() --[[ line: 270 ]]
		-- upvalues: var19 (ref), var28 (ref)
		for i, v in ipairs(var19) do
			v.signalConnection:Disconnect()
		end
		var28(true)
	end, { var28, var19 })
	local var52 = reactModule.useCallback(function() --[[ line: 281 ]]
		-- upvalues: var28 (ref)
		var28(false)
	end, {})
	local var53 = reactModule.useCallback(function() --[[ line: 285 ]]
		-- upvalues: var35 (ref), var36 (ref), var38 (ref), constantsModule (copy), var23 (ref), var20 (ref), var22 (ref)
		if var35 then
			var36(false)
		else
			var38({
				did_user_resize = true,
				type = constantsModule.AnalyticsActions.SetDidUserResize
			})
		end
		if not var23 then
			var20({})
			var22({})
		end
	end, { var35, var23 })
	local var54 = #var19 > 0
	local var55 = #var21 > 0
	reactModule.useEffect(function() --[[ line: 307 ]]
		-- upvalues: var39 (ref), userInputService (copy), var46 (ref), var40 (ref)
		if var39 then
			var39:Disconnect()
		end
		var40(userInputService.InputEnded:Connect(function(p10) --[[ line: 312 ]]
			-- upvalues: var46 (copy)
			if p10.KeyCode == Enum.KeyCode.Escape then
				var46()
			end
		end))
	end, { var46 })
	
	return withLocalization({
		mainTitle = "Feature.ReportAbuse.Label.HighlightProblem",
		next = if fFlagUpdateInGameAssetReportingCTAs then "CommonUI.Controls.Action.Continue" else "Feature.ReportAbuse.Action.Next"
	})(function(p11) --[[ line: 326 ]]
		-- upvalues: reactModule (copy), var53 (ref), isSmallPortraitMode (ref), inGameAssetReportPortraitHeaderFooterModule (copy), var46 (ref), var43 (ref), var44 (ref), var55 (ref), var54 (ref), var19 (ref), inGameAssetReportLandscapeHeaderModule (copy), var45 (ref), screenshotHighlighterModule (copy), var47 (ref), var42 (ref), var51 (ref), var27 (ref), inGameAssetReportErrorModalModule (copy), viewportSize (ref), var52 (ref), var23 (ref), inGameAssetReportSubmitDialogModule (copy), var48 (ref), var49 (ref), var38 (ref), var25 (ref), inGameAssetReportCompleteModalModule (copy), var50 (ref)
		return reactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			[reactModule.Change.AbsoluteSize] = var53
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
					titleText = p11.mainTitle,
					nextText = p11.next,
					backAction = var46,
					undoAnnotationPoints = var43,
					redoAnnotationPoints = var44,
					isRedoEnabled = var55,
					isUndoEnabled = var54,
					annotationPoints = var19
				}) else reactModule.createElement(inGameAssetReportLandscapeHeaderModule, {
					titleText = p11.mainTitle,
					nextText = p11.next,
					nextAction = var45,
					backAction = var46,
					undoAnnotationPoints = var43,
					redoAnnotationPoints = var44,
					isRedoEnabled = var55,
					isUndoEnabled = var54,
					annotationPoints = var19
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
					nextAction = var45,
					annotationPoints = var19,
					nextText = p11.next
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
					annotationPoints = var47,
					handleNewAnnotationPoint = var42,
					onExceedMaxAnnotationLimit = var51
				}, {})
			}),
			ErrorStateModal = if var27 then reactModule.createElement(inGameAssetReportErrorModalModule, { screenSize = viewportSize, onBack = var52 }) else nil,
			SubmitDialog = if var23 then reactModule.createElement(inGameAssetReportSubmitDialogModule, {
				screenSize = viewportSize,
				onSubmit = var48,
				onBack = var49,
				analyticsDispatch = var38
			}) else nil,
			ReportCompleteModal = if var25 then reactModule.createElement(inGameAssetReportCompleteModalModule, { screenSize = viewportSize, onClose = var50 }) else nil
		})
	end)
end