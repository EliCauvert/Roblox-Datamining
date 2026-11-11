local InGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local Parent = InGameAssetReporting.Parent
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ExperienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local HttpService = game:GetService("HttpService")
local ReactModule = require(Parent.React)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local ScreenshotManager = require(Parent.Screenshot).ScreenshotManager
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local ClearTimeoutFunction = LuauPolyfillModule.clearTimeout
local SetTimeoutFunction = LuauPolyfillModule.setTimeout
local ConstantsModule = require(InGameAssetReporting.InGameAssetReportUI.Resources.Constants)
local AnalyticsReducerModule = require(InGameAssetReporting.InGameAssetReportUI.Resources.AnalyticsReducer)
local SceneAnalysisModule = require(InGameAssetReporting.Analysis.SceneAnalysis)
local InGameAssetReportSubmitDialogModule = require(InGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportSubmitDialog)
local InGameAssetReportCompleteModalModule = require(InGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportCompleteModal)
local InGameAssetIPInfringementErrorModalModule = require(InGameAssetReporting.InGameAssetReportUI.Components.InGameAssetIPInfringementErrorModal)
local InGameAssetReportIPInfringementModalModule = require(InGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportIPInfringementModal)
local ReportPreciseSelectionLandscapeHeaderModule = require(InGameAssetReporting.InGameAssetReportUI.Components.PreciseSelection.ReportPreciseSelectionLandscapeHeader)
local ReportPreciseSelectionPortraitHeaderFooterModule = require(InGameAssetReporting.InGameAssetReportUI.Components.PreciseSelection.ReportPreciseSelectionPortraitHeaderFooter)
local BuildReportModule = require(InGameAssetReporting.Utility.buildReport)
local InGameAssetReportAnalyticsModule = require(InGameAssetReporting.InGameAssetReportUI.Resources.InGameAssetReportAnalytics)
local GetHighlightModeVariantModule = require(InGameAssetReporting.Utility.getHighlightModeVariant)
local PreciseSelectionBugfixesEnabled = game:DefineFastFlag("PreciseSelectionBugfixesEnabled", false)
local FFlagPrefillPreciseSelectionChoices = require(Parent.SharedFlags).FFlagPrefillPreciseSelectionChoices
local FFlagReportIPInfringement = require(Parent.SharedFlags).FFlagReportIPInfringement
local Text = string.gsub(string.gsub(string.gsub(game:GetService("ContentProvider").BaseUrl:lower(), "/m.", "/www."), "http:", "https:"), "https://www", "https://apis") .. "rights-management-api/rights/v1/snapshots"

return function(p1)
	-- upvalues: ReactModule (copy), AnalyticsReducerModule (copy), ConstantsModule (copy), SetTimeoutFunction (copy), ClearTimeoutFunction (copy), PreciseSelectionBugfixesEnabled (copy), ScreenshotManager (copy), SceneAnalysisModule (copy), InGameAssetReportAnalyticsModule (copy), ExperienceStateCaptureService (copy), UserInputService (copy), FFlagReportIPInfringement (copy), HttpService (copy), Text (copy), GetHighlightModeVariantModule (copy), BuildReportModule (copy), Players (copy), WithLocalizationFunction (copy), ReportPreciseSelectionPortraitHeaderFooterModule (copy), ReportPreciseSelectionLandscapeHeaderModule (copy), InGameAssetReportSubmitDialogModule (copy), FFlagPrefillPreciseSelectionChoices (copy), InGameAssetReportCompleteModalModule (copy), InGameAssetReportIPInfringementModalModule (copy), InGameAssetIPInfringementErrorModalModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(nil)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(true)
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(AnalyticsReducerModule, ConstantsModule.AnalyticsInitialState)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(nil)
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(nil)
	local UseStateResult9, UseStateResult2_8 = ReactModule.useState(nil)
	local UseStateResult10, UseStateResult2_9 = ReactModule.useState(false)
	local UseStateResult11, UseStateResult2_10 = ReactModule.useState(nil)
	local UseStateResult12, UseStateResult2_11 = ReactModule.useState("")
	local UseStateResult13, UseStateResult2_12 = ReactModule.useState(nil)
	local UseStateResult14, UseStateResult2_13 = ReactModule.useState(false)
	local ViewportSize = game.Workspace.CurrentCamera.ViewportSize
	local IsSmallPortraitMode = p1.getIsSmallPortraitMode(ViewportSize)
	ReactModule.useEffect(function()
		-- upvalues: UseReducerResult2 (copy), ConstantsModule (upval), UseStateResult2_10 (copy), SetTimeoutFunction (upval), UseStateResult2_9 (copy)
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.AccumulateForTimeSpent,
			accumulated_time_ms = workspace:GetServerTimeNow() * 1000
		})
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.SetPlaceId,
			place_id = game.PlaceId
		})
		UseStateResult2_10(SetTimeoutFunction(function()
			-- upvalues: UseStateResult2_9 (upval)
			UseStateResult2_9(true)
		end, 10000))
	end, { UseStateResult2_9, UseStateResult2_10 })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_9 (copy), UseStateResult11 (copy), ClearTimeoutFunction (upval)
		UseStateResult2_9(false)
		
		if UseStateResult11 then
			ClearTimeoutFunction(UseStateResult11)
		end
	end, { UseStateResult2_9, UseStateResult11 })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: PreciseSelectionBugfixesEnabled (upval), UseStateResult4 (copy), ScreenshotManager (upval), UseStateResult2_3 (copy), UseResult (copy), UseStateResult2 (copy), UseReducerResult2 (copy), ConstantsModule (upval), ViewportSize (copy), IsSmallPortraitMode (copy)
		if PreciseSelectionBugfixesEnabled then
			if UseStateResult4 == "" then
				ScreenshotManager:TakeScreenshotWithCallback(UseStateResult2_3, nil)
			end
		elseif not UseStateResult4 then
			ScreenshotManager:TakeScreenshotWithCallback(UseStateResult2_3, nil)
		end
		UseResult()
		UseStateResult2(true)
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.SetViewportInformation,
			viewport_size_x = ViewportSize.X,
			viewport_size_y = ViewportSize.Y,
			is_portrait_mode = IsSmallPortraitMode
		})
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.IncrementNextCount
		})
	end, {
		UseStateResult2, UseStateResult2_3, UseStateResult4, ViewportSize,
		IsSmallPortraitMode, UseReducerResult2, UseResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_4 (copy), SceneAnalysisModule (upval), UseStateResult9 (copy), UseResult1 (copy)
		UseStateResult2_4(SceneAnalysisModule.interpretAndExtractItemsFromInstanceForPreciseSelection(UseStateResult9))
		UseResult1()
	end, { UseResult1, UseStateResult2_4, UseStateResult9 })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: InGameAssetReportAnalyticsModule (upval), UseReducerResult (copy), p1 (copy)
		InGameAssetReportAnalyticsModule(UseReducerResult, 2)
		p1.backAction()
	end, { p1.backAction, UseReducerResult })
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult8 (copy), ExperienceStateCaptureService (upval), UseStateResult2_8 (copy), UseReducerResult2 (copy), ConstantsModule (upval), PreciseSelectionBugfixesEnabled (upval), UseResult (copy), UserInputService (upval), UseStateResult2_4 (copy), SceneAnalysisModule (upval), UseResult1 (copy), UseStateResult2_7 (copy)
		if UseStateResult8 then
			UseStateResult8:Disconnect()
		end
		UseStateResult2_7((ExperienceStateCaptureService.ItemSelectedInCaptureMode:Connect(function(p2)
			-- upvalues: UseStateResult2_8 (upval), UseReducerResult2 (upval), ConstantsModule (upval), PreciseSelectionBugfixesEnabled (upval), UseResult (upval), UserInputService (upval), UseStateResult2_4 (upval), SceneAnalysisModule (upval), UseResult1 (upval)
			UseStateResult2_8(p2)
			
			if p2 then
				UseReducerResult2({
					type = ConstantsModule.AnalyticsActions.IncremementAnnotationCount
				})
				
				if PreciseSelectionBugfixesEnabled then
					UseResult()
				end
			end
			if UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then
				UseStateResult2_4(SceneAnalysisModule.interpretAndExtractItemsFromInstanceForPreciseSelection(p2))
				UseResult1()
			end
		end)))
	end, {
		UseStateResult2_8, UseStateResult2_7, UseResult1, UseStateResult2_4,
		UseReducerResult2, UseResult
	})
	local UseResult4 = ReactModule.useCallback(function(Reason_selection, Surface_selection, p2)
		-- upvalues: FFlagReportIPInfringement (upval), UseStateResult5 (copy), UseStateResult2_12 (copy), ConstantsModule (upval), UseStateResult4 (copy), HttpService (upval), Text (upval), UseStateResult2_11 (copy), UseStateResult2_2 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseReducerResult2 (copy), GetHighlightModeVariantModule (upval), BuildReportModule (upval), Players (upval)
		if FFlagReportIPInfringement and Reason_selection == "ip infringement" then
			if not UseStateResult5 or not UseStateResult5.extractedAssets then
				UseStateResult2_12(ConstantsModule.IpErrorCodes.ClientNoAssetsExtracted)
				
				return
			end
			local Contents = {}
			
			for i, extractedAsset in pairs(UseStateResult5.extractedAssets) do
				for _, value in ipairs(extractedAsset) do
					local Id = if i == "Package" then value.id else value
					
					if Id then
						local Match: string? = string.match(Id, "%d+")
						
						if Match and Match ~= "" then
							table.insert(Contents, { content_type = "Asset", content_id = Match })
						end
					end
				end
			end
			if #Contents > 0 then
				HttpService:RequestInternal({
					Method = "POST",
					Url = Text,
					Headers = {
						["Content-Type"] = "application/json",
						Accept = "application/json"
					},
					Body = HttpService:JSONEncode({
						screenshot_id = UseStateResult4,
						universe_id = game.GameId,
						contents = Contents
					})
				}):Start(function(_, p3)
					-- upvalues: HttpService (upval), UseStateResult2_11 (upval), UseStateResult2_2 (upval), UseStateResult2_12 (upval), ConstantsModule (upval)
					if p3.StatusCode == 200 then
						local Success, Result = pcall(HttpService.JSONDecode, HttpService, p3.Body)
						
						if Success and Result and Result.code then
							UseStateResult2_11(Result.code)
							UseStateResult2_2(true)
							
							return
						else
							UseStateResult2_12(ConstantsModule.IpErrorCodes.Unknown)
							
							return
						end
					else
						local Unknown = ConstantsModule.IpErrorCodes.Unknown
						local Success1, Result1 = pcall(HttpService.JSONDecode, HttpService, p3.Body)
						
						if Success1 and Result1 and Result1.app_error_code and Result1.app_error_code ~= "" then
							Unknown = Result1.app_error_code
						end
						UseStateResult2_12(Unknown)
					end
				end)
				
				return
			else
				UseStateResult2_12(ConstantsModule.IpErrorCodes.ClientNoAssetsExtracted)
				
				return
			end
		else
			UseStateResult2(false)
			UseStateResult2_1(true)
			UseReducerResult2({
				final_annotation_count = 0,
				type = ConstantsModule.AnalyticsActions.SetExtractionResults,
				results = UseStateResult5
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
				comment_added = #p2 > 0
			})
			local HighlightModeVariantModule = GetHighlightModeVariantModule()
			UseReducerResult2({
				type = ConstantsModule.AnalyticsActions.SetVariant,
				variant = HighlightModeVariantModule
			})
			local ReportModule = BuildReportModule(Players.LocalPlayer.UserId, UseStateResult4, UseStateResult5, Reason_selection, Surface_selection, p2, {}, nil, HighlightModeVariantModule)
			
			if ReportModule then
				Players:ReportAbuseV3(Players.LocalPlayer, ReportModule)
			end
		end
	end, {
		UseStateResult5, UseStateResult2, UseStateResult2_1, UseStateResult4,
		UseStateResult2_12, UseStateResult2_2, UseStateResult2_11, UseReducerResult2
	})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_4 (copy), UseStateResult2 (copy), ExperienceStateCaptureService (upval)
		UseStateResult2_4(nil)
		UseStateResult2(false)
		ExperienceStateCaptureService:ResetHighlight()
	end, { UseStateResult2, UseStateResult2_4 })
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_1 (copy), InGameAssetReportAnalyticsModule (upval), UseReducerResult (copy), p1 (copy)
		UseStateResult2_1(false)
		InGameAssetReportAnalyticsModule(UseReducerResult, 1)
		p1.onReportComplete()
	end, { p1.onReportComplete, UseStateResult2_1, UseReducerResult })
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult6 (copy), UseStateResult2_5 (copy), UseReducerResult2 (copy), ConstantsModule (upval)
		if UseStateResult6 then
			UseStateResult2_5(false)
			
			return
		else
			UseReducerResult2({
				did_user_resize = true,
				type = ConstantsModule.AnalyticsActions.SetDidUserResize
			})
		end
	end, {
		UseStateResult6,
		UseStateResult,
		UseReducerResult2,
		UseStateResult2_5
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult7 (copy), UserInputService (upval), UseResult3 (copy), UseStateResult2_6 (copy)
		if UseStateResult7 then
			UseStateResult7:Disconnect()
		end
		UseStateResult2_6((UserInputService.InputEnded:Connect(function(Input)
			-- upvalues: UseResult3 (upval)
			if Input.KeyCode == Enum.KeyCode.Escape then
				UseResult3()
			end
		end)))
	end, { UseResult3, UseStateResult2_6 })
	local UseResult8 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_12 (copy)
		UseStateResult2_12(nil)
	end, {})
	local UseResult9 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_13 (copy), HttpService (upval), UseStateResult4 (copy), Text (upval), UseStateResult2_11 (copy), UseStateResult2_12 (copy), UseStateResult2_2 (copy), ConstantsModule (upval)
		UseStateResult2_13(true)
		HttpService:RequestInternal({
			Method = "POST",
			Url = Text,
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			},
			Body = HttpService:JSONEncode({
				screenshot_id = UseStateResult4,
				universe_id = game.GameId,
				contents = {}
			})
		}):Start(function(_, p3)
			-- upvalues: UseStateResult2_13 (upval), HttpService (upval), UseStateResult2_11 (upval), UseStateResult2_12 (upval), UseStateResult2_2 (upval), ConstantsModule (upval)
			UseStateResult2_13(false)
			
			if p3.StatusCode == 200 then
				local Success, Result = pcall(HttpService.JSONDecode, HttpService, p3.Body)
				
				if Success and Result and Result.code then
					UseStateResult2_11(Result.code)
					UseStateResult2_12(nil)
					UseStateResult2_2(true)
					
					return
				end
			end
			UseStateResult2_12(ConstantsModule.IpErrorCodes.Unknown)
		end)
	end, {
		UseStateResult4,
		UseStateResult2_11,
		UseStateResult2_12,
		UseStateResult2_2,
		UseStateResult2_13
	})
	
	return WithLocalizationFunction({
		mainTitle = "Feature.ReportAbuse.Label.HighlightProblemPrecise",
		next = "Feature.ReportAbuse.Action.Next",
		coachmarkTitle = "Feature.ReportAbuse.Label.CantSelectTitle",
		coachmarkText = "Feature.ReportAbuse.Label.CantSelectSubtitle"
	})(function(p3)
		-- upvalues: ReactModule (upval), UseResult7 (copy), IsSmallPortraitMode (copy), ReportPreciseSelectionPortraitHeaderFooterModule (upval), UseResult3 (copy), ReportPreciseSelectionLandscapeHeaderModule (upval), UseResult2 (copy), UseStateResult10 (copy), UseResult (copy), UseStateResult (copy), InGameAssetReportSubmitDialogModule (upval), ViewportSize (copy), UseResult4 (copy), UseResult5 (copy), UseReducerResult2 (copy), FFlagPrefillPreciseSelectionChoices (upval), UseStateResult5 (copy), UseStateResult1 (copy), InGameAssetReportCompleteModalModule (upval), UseResult6 (copy), FFlagReportIPInfringement (upval), UseStateResult3 (copy), InGameAssetReportIPInfringementModalModule (upval), UseStateResult12 (copy), UseStateResult13 (copy), InGameAssetIPInfringementErrorModalModule (upval), UseResult8 (copy), UseResult9 (copy), UseStateResult14 (copy)
		return ReactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			[ReactModule.Change.AbsoluteSize] = UseResult7
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
				InGameAssetReportModeHeader = if IsSmallPortraitMode then ReactModule.createElement(ReportPreciseSelectionPortraitHeaderFooterModule.PortraitModeHeader, {
					titleText = p3.mainTitle,
					nextText = p3.next,
					backAction = UseResult3
				}) else ReactModule.createElement(ReportPreciseSelectionLandscapeHeaderModule, {
					titleText = p3.mainTitle,
					nextText = p3.next,
					nextAction = UseResult2,
					backAction = UseResult3,
					coachmarkTitle = p3.coachmarkTitle,
					coachmarkText = p3.coachmarkText,
					isCoachmarkOpen = UseStateResult10,
					onCoachmarkClose = UseResult
				})
			}),
			Footer = if IsSmallPortraitMode then ReactModule.createElement("TextButton", {
				ZIndex = 2,
				BackgroundTransparency = 1,
				AutoButtonColor = false,
				Size = UDim2.new(1, 0, 0, 60),
				Position = UDim2.new(0, 0, 1, -60)
			}, {
				InGameAssetReportModeFooter = ReactModule.createElement(ReportPreciseSelectionPortraitHeaderFooterModule.PortraitModeFooter, {
					nextAction = UseResult2,
					nextText = p3.next,
					isCoachmarkOpen = UseStateResult10,
					onCoachmarkClose = UseResult,
					coachmarkTitle = p3.coachmarkTitle,
					coachmarkText = p3.coachmarkText
				})
			}) else nil,
			SubmitDialog = if UseStateResult then ReactModule.createElement(InGameAssetReportSubmitDialogModule, {
				screenSize = ViewportSize,
				onSubmit = UseResult4,
				onBack = UseResult5,
				analyticsDispatch = UseReducerResult2,
				extractionResult = if FFlagPrefillPreciseSelectionChoices then UseStateResult5 else nil
			}) else nil,
			ReportCompleteModal = if UseStateResult1 then ReactModule.createElement(InGameAssetReportCompleteModalModule, { screenSize = ViewportSize, onClose = UseResult6 }) else nil,
			IPInfringementModal = if FFlagReportIPInfringement and UseStateResult3 then ReactModule.createElement(InGameAssetReportIPInfringementModalModule, {
				screenSize = ViewportSize,
				reportCode = UseStateResult12,
				onClose = UseResult6
			}) else nil,
			ErrorModal = if FFlagReportIPInfringement and UseStateResult13 ~= nil then ReactModule.createElement(InGameAssetIPInfringementErrorModalModule, {
				screenSize = ViewportSize,
				onBack = UseResult8,
				errorCode = UseStateResult13,
				onReportExperience = UseResult9,
				isReportExperienceLoading = UseStateResult14
			}) else nil
		})
	end)
end