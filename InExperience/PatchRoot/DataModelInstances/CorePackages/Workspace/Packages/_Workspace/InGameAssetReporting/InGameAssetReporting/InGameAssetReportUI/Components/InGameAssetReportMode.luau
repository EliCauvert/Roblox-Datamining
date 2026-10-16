local InGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local Parent = InGameAssetReporting.Parent
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local ScreenshotManager = require(Parent.Screenshot).ScreenshotManager
local ConstantsModule = require(InGameAssetReporting.InGameAssetReportUI.Resources.Constants)
local AnalyticsReducerModule = require(InGameAssetReporting.InGameAssetReportUI.Resources.AnalyticsReducer)
local SceneAnalysisModule = require(InGameAssetReporting.Analysis.SceneAnalysis)
local InGameAssetReportSubmitDialogModule = require(InGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportSubmitDialog)
local InGameAssetReportErrorModalModule = require(InGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportErrorModal)
local InGameAssetReportCompleteModalModule = require(InGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportCompleteModal)
local InGameAssetReportLandscapeHeaderModule = require(InGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportLandscapeHeader)
local InGameAssetReportPortraitHeaderFooterModule = require(InGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportPortraitHeaderFooter)
local ScreenshotHighlighterModule = require(InGameAssetReporting.InGameAssetReportUI.Components.ScreenshotHighlighter)
local BuildReportModule = require(InGameAssetReporting.Utility.buildReport)
local InGameAssetReportAnalyticsModule = require(InGameAssetReporting.InGameAssetReportUI.Resources.InGameAssetReportAnalytics)

local function v19(p1) --[[ Line: 43 ]]
	return p1.point
end

local function v20(p1) --[[ Line: 47 ]]
	return p1.interpretationResult
end

return function(p1) --[[ Line: 51 ]]
	-- upvalues: ReactModule (copy), AnalyticsReducerModule (copy), ConstantsModule (copy), SceneAnalysisModule (copy), ExperienceStateCaptureService (copy), ScreenshotManager (copy), CryoModule (copy), v20 (copy), InGameAssetReportAnalyticsModule (copy), v19 (copy), BuildReportModule (copy), Players (copy), UserInputService (copy), WithLocalizationFunction (copy), InGameAssetReportPortraitHeaderFooterModule (copy), InGameAssetReportLandscapeHeaderModule (copy), ScreenshotHighlighterModule (copy), InGameAssetReportErrorModalModule (copy), InGameAssetReportSubmitDialogModule (copy), InGameAssetReportCompleteModalModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState("")
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(nil)
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(nil)
	local UseStateResult9, UseStateResult2_8 = ReactModule.useState(true)
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(AnalyticsReducerModule, ConstantsModule.AnalyticsInitialState)
	local UseStateResult10, UseStateResult2_9 = ReactModule.useState(nil)
	local ViewportSize = game.Workspace.CurrentCamera.ViewportSize
	local IsSmallPortraitMode = p1.getIsSmallPortraitMode(ViewportSize)
	ReactModule.useEffect(function() --[[ Line: 70 ]]
		-- upvalues: UseReducerResult2 (copy), ConstantsModule (upval)
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.AccumulateForTimeSpent,
			accumulated_time_ms = workspace:GetServerTimeNow() * 1000
		})
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.SetPlaceId,
			place_id = game.PlaceId
		})
	end, {})
	local UseResult = ReactModule.useCallback(function(Point, p2) --[[ Line: 82 ]]
		-- upvalues: SceneAnalysisModule (upval), ViewportSize (copy), ExperienceStateCaptureService (upval), UseStateResult (copy), UseStateResult6 (copy), ScreenshotManager (upval), UseStateResult2_5 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseReducerResult2 (copy), ConstantsModule (upval)
		local config = {
			point = Point,
			interpretationResult = SceneAnalysisModule.interpretAnnotation(Point * ViewportSize, p2 * math.max(ViewportSize.X, ViewportSize.Y), function() --[[ Line: 88 ]] end)
		}
		config.signalConnection = ExperienceStateCaptureService.ItemSelectedInCaptureMode:Once(function(EngineSignalItem) --[[ Line: 92 ]]
			-- upvalues: config (copy)
			config.engineSignalItem = EngineSignalItem
		end)
		
		for _, value in ipairs(UseStateResult) do
			value.signalConnection:Disconnect()
		end
		if #UseStateResult == 0 and UseStateResult6 == "" then
			ScreenshotManager:TakeScreenshotWithCallback(UseStateResult2_5, nil)
		end
		local Copy = table.clone(UseStateResult)
		table.insert(Copy, config)
		UseStateResult2(Copy)
		UseStateResult2_1({})
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.IncremementAnnotationCount
		})
		task.defer(config.interpretationResult.raycastComputation)
	end, {
		UseStateResult,
		UseStateResult2,
		UseStateResult2_1,
		UseStateResult6
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 119 ]]
		-- upvalues: UseStateResult (copy), UseStateResult1 (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), UseReducerResult2 (copy), ConstantsModule (upval)
		if #UseStateResult > 0 then
			local Copy = table.clone(UseStateResult)
			local Copy1 = table.clone(UseStateResult1)
			table.insert(Copy1, table.remove(Copy))
			UseStateResult2_1(Copy1)
			UseStateResult2(Copy)
			UseReducerResult2({
				type = ConstantsModule.AnalyticsActions.IncremementAnnotationUndoCount
			})
		end
	end, {
		UseStateResult2,
		UseStateResult,
		UseStateResult2_1,
		UseStateResult1
	})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 136 ]]
		-- upvalues: UseStateResult1 (copy), UseStateResult (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), UseReducerResult2 (copy), ConstantsModule (upval)
		if #UseStateResult1 > 0 then
			local Copy = table.clone(UseStateResult)
			local Copy1 = table.clone(UseStateResult1)
			table.insert(Copy, table.remove(Copy1))
			UseStateResult2_1(Copy1)
			UseStateResult2(Copy)
			UseReducerResult2({
				type = ConstantsModule.AnalyticsActions.IncremementAnnotationRedoCount
			})
		end
	end, { UseStateResult, UseStateResult1 })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 155 ]]
		-- upvalues: UseStateResult (copy), UseStateResult6 (copy), ScreenshotManager (upval), UseStateResult2_5 (copy), CryoModule (upval), SceneAnalysisModule (upval), UseStateResult2_7 (copy), v20 (upval), UseStateResult2_6 (copy), UseStateResult2_2 (copy), UseReducerResult2 (copy), ConstantsModule (upval), ViewportSize (copy), IsSmallPortraitMode (copy)
		if #UseStateResult == 0 and UseStateResult6 == "" then
			ScreenshotManager:TakeScreenshotWithCallback(UseStateResult2_5, nil)
		end
		local ExtractItemsFromInterpretationsResult = SceneAnalysisModule.extractItemsFromInterpretations({
			(SceneAnalysisModule.interpretInstanceListForGUIObjects((CryoModule.List.map(UseStateResult, function(p3) --[[ Line: 161 ]]
				return p3.engineSignalItem
			end))))
		}, function() --[[ Line: 167 ]] end)
		UseStateResult2_7(ExtractItemsFromInterpretationsResult)
		task.defer(ExtractItemsFromInterpretationsResult.computation)
		local ExtractItemsFromInterpretationsResult1 = SceneAnalysisModule.extractItemsFromInterpretations(CryoModule.List.map(UseStateResult, v20), function() --[[ Line: 173 ]] end)
		UseStateResult2_6(ExtractItemsFromInterpretationsResult1)
		UseStateResult2_2(true)
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.SetViewportInformation,
			viewport_size_x = ViewportSize.X,
			viewport_size_y = ViewportSize.Y,
			is_portrait_mode = IsSmallPortraitMode
		})
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.IncrementNextCount
		})
		task.defer(ExtractItemsFromInterpretationsResult1.computation)
	end, {
		UseStateResult, UseStateResult2_2, UseStateResult2_6, UseStateResult6,
		ViewportSize, IsSmallPortraitMode
	})
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 191 ]]
		-- upvalues: InGameAssetReportAnalyticsModule (upval), UseReducerResult (copy), p1 (copy)
		InGameAssetReportAnalyticsModule(UseReducerResult, 2)
		p1.backAction()
	end, { p1.backAction, UseReducerResult })
	local MapResult = CryoModule.List.map(UseStateResult, v19)
	local UseResult5 = ReactModule.useCallback(function(Reason_selection, Surface_selection, p3) --[[ Line: 203 ]]
		-- upvalues: UseStateResult2_2 (copy), UseStateResult2_3 (copy), UseReducerResult2 (copy), ConstantsModule (upval), UseStateResult7 (copy), UseStateResult (copy), BuildReportModule (upval), Players (upval), UseStateResult6 (copy), MapResult (copy), UseStateResult8 (copy)
		UseStateResult2_2(false)
		UseStateResult2_3(true)
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.SetExtractionResults,
			results = UseStateResult7,
			final_annotation_count = #UseStateResult
		})
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.SetReasonSelection,
			reason_selection = Reason_selection
		})
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.SetSurfaceSelection,
			surface_selection = Surface_selection
		})
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.SetCommentAdded,
			comment_added = #p3 > 0
		})
		local ReportModule = BuildReportModule(Players.LocalPlayer.UserId, UseStateResult6, UseStateResult7, Reason_selection, Surface_selection, p3, MapResult, UseStateResult8)
		
		if ReportModule then
			Players:ReportAbuseV3(Players.LocalPlayer, ReportModule)
		end
	end, {
		UseStateResult7, UseStateResult8, UseStateResult2_2, UseStateResult2_3,
		UseStateResult6, UseStateResult, MapResult
	})
	local UseResult6 = ReactModule.useCallback(function() --[[ Line: 255 ]]
		-- upvalues: UseStateResult2_6 (copy), UseStateResult2_2 (copy)
		UseStateResult2_6(nil)
		UseStateResult2_2(false)
	end, { UseStateResult2_2, UseStateResult2_6 })
	local UseResult7 = ReactModule.useCallback(function() --[[ Line: 261 ]]
		-- upvalues: UseStateResult2_3 (copy), InGameAssetReportAnalyticsModule (upval), UseReducerResult (copy), p1 (copy)
		UseStateResult2_3(false)
		InGameAssetReportAnalyticsModule(UseReducerResult, 1)
		p1.onReportComplete()
	end, {
		p1.onReportComplete,
		UseStateResult,
		UseStateResult2_3,
		UseReducerResult
	})
	local UseResult8 = ReactModule.useCallback(function() --[[ Line: 268 ]]
		-- upvalues: UseStateResult (copy), UseStateResult2_4 (copy)
		for _, value in ipairs(UseStateResult) do
			value.signalConnection:Disconnect()
		end
		UseStateResult2_4(true)
	end, { UseStateResult2_4, UseStateResult })
	local UseResult9 = ReactModule.useCallback(function() --[[ Line: 279 ]]
		-- upvalues: UseStateResult2_4 (copy)
		UseStateResult2_4(false)
	end, {})
	local UseResult10 = ReactModule.useCallback(function() --[[ Line: 283 ]]
		-- upvalues: UseStateResult9 (copy), UseStateResult2_8 (copy), UseReducerResult2 (copy), ConstantsModule (upval), UseStateResult3 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
		if UseStateResult9 then
			UseStateResult2_8(false)
		else
			UseReducerResult2({
				did_user_resize = true,
				type = ConstantsModule.AnalyticsActions.SetDidUserResize
			})
		end
		if not UseStateResult3 then
			UseStateResult2({})
			UseStateResult2_1({})
		end
	end, { UseStateResult9, UseStateResult3 })
	local IsUndoEnabled = #UseStateResult > 0
	local IsRedoEnabled = #UseStateResult1 > 0
	ReactModule.useEffect(function() --[[ Line: 305 ]]
		-- upvalues: UseStateResult10 (copy), UserInputService (upval), UseResult4 (copy), UseStateResult2_9 (copy)
		if UseStateResult10 then
			UseStateResult10:Disconnect()
		end
		UseStateResult2_9((UserInputService.InputEnded:Connect(function(Input) --[[ Line: 310 ]]
			-- upvalues: UseResult4 (upval)
			if Input.KeyCode == Enum.KeyCode.Escape then
				UseResult4()
			end
		end)))
	end, { UseResult4 })
	
	return WithLocalizationFunction({
		mainTitle = "Feature.ReportAbuse.Label.HighlightProblem",
		next = "CommonUI.Controls.Action.Continue"
	})(function(p3) --[[ Line: 322 ]]
		-- upvalues: ReactModule (upval), UseResult10 (copy), IsSmallPortraitMode (copy), InGameAssetReportPortraitHeaderFooterModule (upval), UseResult4 (copy), UseResult1 (copy), UseResult2 (copy), IsRedoEnabled (copy), IsUndoEnabled (copy), UseStateResult (copy), InGameAssetReportLandscapeHeaderModule (upval), UseResult3 (copy), ScreenshotHighlighterModule (upval), MapResult (copy), UseResult (copy), UseResult8 (copy), UseStateResult5 (copy), InGameAssetReportErrorModalModule (upval), ViewportSize (copy), UseResult9 (copy), UseStateResult3 (copy), InGameAssetReportSubmitDialogModule (upval), UseResult5 (copy), UseResult6 (copy), UseReducerResult2 (copy), UseStateResult4 (copy), InGameAssetReportCompleteModalModule (upval), UseResult7 (copy)
		return ReactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			[ReactModule.Change.AbsoluteSize] = UseResult10
		}, {
			Header = ReactModule.createElement("TextButton", {
				BackgroundTransparency = 1,
				ZIndex = 2,
				AutoButtonColor = false,
				Size = UDim2.new(1, 0, 0, 72)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				InGameAssetReportModeHeader = if IsSmallPortraitMode then ReactModule.createElement(InGameAssetReportPortraitHeaderFooterModule.PortraitModeHeader, {
					titleText = p3.mainTitle,
					nextText = p3.next,
					backAction = UseResult4,
					undoAnnotationPoints = UseResult1,
					redoAnnotationPoints = UseResult2,
					isRedoEnabled = IsRedoEnabled,
					isUndoEnabled = IsUndoEnabled,
					annotationPoints = UseStateResult
				}) else ReactModule.createElement(InGameAssetReportLandscapeHeaderModule, {
					titleText = p3.mainTitle,
					nextText = p3.next,
					nextAction = UseResult3,
					backAction = UseResult4,
					undoAnnotationPoints = UseResult1,
					redoAnnotationPoints = UseResult2,
					isRedoEnabled = IsRedoEnabled,
					isUndoEnabled = IsUndoEnabled,
					annotationPoints = UseStateResult
				})
			}),
			Footer = if IsSmallPortraitMode then ReactModule.createElement("TextButton", {
				ZIndex = 2,
				BackgroundTransparency = 1,
				AutoButtonColor = false,
				Size = UDim2.new(1, 0, 0, 60),
				Position = UDim2.new(0, 0, 1, -60)
			}, {
				InGameAssetReportModeFooter = ReactModule.createElement(InGameAssetReportPortraitHeaderFooterModule.PortraitModeFooter, {
					nextAction = UseResult3,
					annotationPoints = UseStateResult,
					nextText = p3.next
				})
			}) else nil,
			ScreenshotAnnotation = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				ZIndex = 1,
				Size = UDim2.new(1, 0, 1, 0)
			}, {
				Highlighter = ReactModule.createElement(ScreenshotHighlighterModule, {
					ZIndex = 2,
					annotationPoints = MapResult,
					handleNewAnnotationPoint = UseResult,
					onExceedMaxAnnotationLimit = UseResult8
				}, {})
			}),
			ErrorStateModal = if UseStateResult5 then ReactModule.createElement(InGameAssetReportErrorModalModule, { screenSize = ViewportSize, onBack = UseResult9 }) else nil,
			SubmitDialog = if UseStateResult3 then ReactModule.createElement(InGameAssetReportSubmitDialogModule, {
				screenSize = ViewportSize,
				onSubmit = UseResult5,
				onBack = UseResult6,
				analyticsDispatch = UseReducerResult2
			}) else nil,
			ReportCompleteModal = if UseStateResult4 then ReactModule.createElement(InGameAssetReportCompleteModalModule, { screenSize = ViewportSize, onClose = UseResult7 }) else nil
		})
	end)
end