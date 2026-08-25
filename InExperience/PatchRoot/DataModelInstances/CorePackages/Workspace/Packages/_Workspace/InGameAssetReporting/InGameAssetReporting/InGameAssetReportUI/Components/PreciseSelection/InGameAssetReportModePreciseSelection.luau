local inGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local parent = inGameAssetReporting.Parent
local playersService = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local experienceStateCaptureService = game:GetService("ExperienceStateCaptureService")
local httpService = game:GetService("HttpService")
local contentProviderService = game:GetService("ContentProvider")
local reactModule = require(parent.React)
local withLocalization = require(parent.Localization).withLocalization
local screenshotManager = require(parent.Screenshot).ScreenshotManager
local luauPolyfillModule = require(parent.LuauPolyfill)
local clearTimeout = luauPolyfillModule.clearTimeout
local setTimeout = luauPolyfillModule.setTimeout
local constantsModule = require(inGameAssetReporting.InGameAssetReportUI.Resources.Constants)
local analyticsReducerModule = require(inGameAssetReporting.InGameAssetReportUI.Resources.AnalyticsReducer)
local sceneAnalysisModule = require(inGameAssetReporting.Analysis.SceneAnalysis)
local inGameAssetReportSubmitDialogModule = require(inGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportSubmitDialog)
local inGameAssetReportCompleteModalModule = require(inGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportCompleteModal)
local inGameAssetIPInfringementErrorModalModule = require(inGameAssetReporting.InGameAssetReportUI.Components.InGameAssetIPInfringementErrorModal)
local inGameAssetReportIPInfringementModalModule = require(inGameAssetReporting.InGameAssetReportUI.Components.InGameAssetReportIPInfringementModal)
local reportPreciseSelectionLandscapeHeaderModule = require(inGameAssetReporting.InGameAssetReportUI.Components.PreciseSelection.ReportPreciseSelectionLandscapeHeader)
local reportPreciseSelectionPortraitHeaderFooterModule = require(inGameAssetReporting.InGameAssetReportUI.Components.PreciseSelection.ReportPreciseSelectionPortraitHeaderFooter)
local buildReportModule = require(inGameAssetReporting.Utility.buildReport)
local inGameAssetReportAnalyticsModule = require(inGameAssetReporting.InGameAssetReportUI.Resources.InGameAssetReportAnalytics)
local getHighlightModeVariantModule = require(inGameAssetReporting.Utility.getHighlightModeVariant)
local preciseSelectionBugfixesEnabled = game:DefineFastFlag("PreciseSelectionBugfixesEnabled", false)
local fFlagPrefillPreciseSelectionChoices = require(parent.SharedFlags).FFlagPrefillPreciseSelectionChoices
local fFlagUpdateInGameAssetReportingCTAs = require(parent.SharedFlags).FFlagUpdateInGameAssetReportingCTAs
local text = string.gsub(string.gsub(string.gsub(contentProviderService.BaseUrl:lower(), "/m.", "/www."), "http:", "https:"), "https://www", "https://apis") .. "rights-management-api/rights/v1/snapshots"

return function(p0)
	-- upvalues: reactModule (ref), analyticsReducerModule (ref), constantsModule (ref), setTimeout (ref), clearTimeout (ref), preciseSelectionBugfixesEnabled (ref), screenshotManager (ref), sceneAnalysisModule (ref), inGameAssetReportAnalyticsModule (ref), experienceStateCaptureService (ref), userInputService (ref), httpService (ref), text (ref), getHighlightModeVariantModule (ref), buildReportModule (ref), playersService (ref), withLocalization (ref), fFlagUpdateInGameAssetReportingCTAs (ref), reportPreciseSelectionPortraitHeaderFooterModule (ref), reportPreciseSelectionLandscapeHeaderModule (ref), inGameAssetReportSubmitDialogModule (ref), fFlagPrefillPreciseSelectionChoices (ref), inGameAssetReportCompleteModalModule (ref), inGameAssetReportIPInfringementModalModule (ref), inGameAssetIPInfringementErrorModalModule (ref)
	local var22, var23 = reactModule.useState(false)
	local var24, var25 = reactModule.useState(false)
	local var26, var27 = reactModule.useState(false)
	local var28, var29 = reactModule.useState("")
	local var30, var31 = reactModule.useState(nil)
	local var32, var33 = reactModule.useState(true)
	local var34, var35 = reactModule.useReducer(analyticsReducerModule, constantsModule.AnalyticsInitialState)
	local var36, var37 = reactModule.useState(nil)
	local var38, var39 = reactModule.useState(nil)
	local var40, var41 = reactModule.useState(nil)
	local var42, var43 = reactModule.useState(false)
	local var44, var45 = reactModule.useState(nil)
	local var46, var47 = reactModule.useState("")
	local var48, var49 = reactModule.useState(nil)
	local var50, var51 = reactModule.useState(false)
	local viewportSize = game.Workspace.CurrentCamera.ViewportSize
	local isSmallPortraitMode = p0.getIsSmallPortraitMode(viewportSize)
	reactModule.useEffect(function()
		-- upvalues: var35 (ref), constantsModule (copy), var45 (ref), setTimeout (copy), var43 (ref)
		var35({
			type = constantsModule.AnalyticsActions.AccumulateForTimeSpent,
			accumulated_time_ms = workspace:GetServerTimeNow() * 1000
		})
		var35({
			type = constantsModule.AnalyticsActions.SetPlaceId,
			place_id = game.PlaceId
		})
		var45(setTimeout(function()
			-- upvalues: var43 (copy)
			var43(true)
		end, 10000))
	end, { var43, var45 })
	local var53 = reactModule.useCallback(function()
		-- upvalues: var43 (ref), var44 (ref), clearTimeout (copy)
		var43(false)
		
		if var44 then
			clearTimeout(var44)
		end
	end, { var43, var44 })
	local var54 = reactModule.useCallback(function()
		-- upvalues: preciseSelectionBugfixesEnabled (copy), var28 (ref), screenshotManager (copy), var29 (ref), var53 (ref), var23 (ref), var35 (ref), constantsModule (copy), viewportSize (ref), isSmallPortraitMode (ref)
		if preciseSelectionBugfixesEnabled then
			if var28 == "" then
				screenshotManager:TakeScreenshotWithCallback(var29, nil)
			end
		elseif not var28 then
			screenshotManager:TakeScreenshotWithCallback(var29, nil)
		end
		var53()
		var23(true)
		var35({
			type = constantsModule.AnalyticsActions.SetViewportInformation,
			viewport_size_x = viewportSize.X,
			viewport_size_y = viewportSize.Y,
			is_portrait_mode = isSmallPortraitMode
		})
		var35({
			type = constantsModule.AnalyticsActions.IncrementNextCount
		})
	end, {
		var23, var29, var28, viewportSize, isSmallPortraitMode, var35, var53
	})
	local var55 = reactModule.useCallback(function()
		-- upvalues: var31 (ref), sceneAnalysisModule (copy), var40 (ref), var54 (ref)
		var31(sceneAnalysisModule.interpretAndExtractItemsFromInstanceForPreciseSelection(var40))
		var54()
	end, { var54, var31, var40 })
	local var56 = reactModule.useCallback(function()
		-- upvalues: inGameAssetReportAnalyticsModule (copy), var34 (ref), p0 (ref)
		inGameAssetReportAnalyticsModule(var34, 2)
		p0.backAction()
	end, { p0.backAction, var34 })
	reactModule.useEffect(function()
		-- upvalues: var38 (ref), experienceStateCaptureService (copy), var41 (ref), var35 (ref), constantsModule (copy), preciseSelectionBugfixesEnabled (copy), var53 (ref), userInputService (copy), var31 (ref), sceneAnalysisModule (copy), var54 (ref), var39 (ref)
		if var38 then
			var38:Disconnect()
		end
		var39(experienceStateCaptureService.ItemSelectedInCaptureMode:Connect(function(p1)
			-- upvalues: var41 (copy), var35 (copy), constantsModule (copy), preciseSelectionBugfixesEnabled (copy), var53 (copy), userInputService (copy), var31 (copy), sceneAnalysisModule (copy), var54 (copy)
			var41(p1)
			
			if p1 then
				var35({
					type = constantsModule.AnalyticsActions.IncremementAnnotationCount
				})
				
				if preciseSelectionBugfixesEnabled then
					var53()
				end
			end
			if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then
				var31(sceneAnalysisModule.interpretAndExtractItemsFromInstanceForPreciseSelection(p1))
				var54()
			end
		end))
	end, {
		var41, var39, var54, var31, var35, var53
	})
	local var57 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var30 (ref), var49 (ref), constantsModule (copy), var28 (ref), httpService (copy), text (copy), var47 (ref), var27 (ref), var23 (ref), var25 (ref), var35 (ref), getHighlightModeVariantModule (copy), buildReportModule (copy), playersService (copy)
		if p2 == "ip infringement" then
			if not var30 or not var30.extractedAssets then
				var49(constantsModule.IpErrorCodes.ClientNoAssetsExtracted)
				
				return
			end
			local t = {}
			
			for i, v in pairs(var30.extractedAssets) do
				for i_1, v_1 in ipairs(v) do
					local var64 = if i == "Package" then v_1.id else v_1
					
					if var64 then
						local match = string.match(var64, "%d+")
						
						if match and match ~= "" then
							table.insert(t, { content_type = "Asset", content_id = match })
						end
					end
				end
			end
			if #t > 0 then
				httpService:RequestInternal({
					Method = "POST",
					Url = text,
					Headers = {
						["Content-Type"] = "application/json",
						Accept = "application/json"
					},
					Body = httpService:JSONEncode({
						screenshot_id = var28,
						universe_id = game.GameId,
						contents = t
					})
				}):Start(function(_, p5)
					-- upvalues: httpService (copy), var47 (copy), var27 (copy), var49 (copy), constantsModule (copy)
					if p5.StatusCode == 200 then
						local ok, status = pcall(httpService.JSONDecode, httpService, p5.Body)
						
						if ok and status and status.code then
							var47(status.code)
							var27(true)
							
							return
						end
						var49(constantsModule.IpErrorCodes.Unknown)
						
						return
					else
						local unknown = constantsModule.IpErrorCodes.Unknown
						local ok, status = pcall(httpService.JSONDecode, httpService, p5.Body)
						
						if ok and status and (status.app_error_code and status.app_error_code ~= "") then
							unknown = status.app_error_code
						end
						var49(unknown)
					end
				end)
				
				return
			end
			var49(constantsModule.IpErrorCodes.ClientNoAssetsExtracted)
			
			return
		else
			var23(false)
			var25(true)
			var35({
				final_annotation_count = 0,
				type = constantsModule.AnalyticsActions.SetExtractionResults,
				results = var30
			})
			var35({
				type = constantsModule.AnalyticsActions.SetReasonSelection,
				reason_selection = p2
			})
			var35({
				type = constantsModule.AnalyticsActions.SetSurfaceSelection,
				surface_selection = p3
			})
			var35({
				type = constantsModule.AnalyticsActions.SetCommentAdded,
				comment_added = #p4 > 0
			})
			local var66 = getHighlightModeVariantModule()
			var35({
				type = constantsModule.AnalyticsActions.SetVariant,
				variant = var66
			})
			local var67 = buildReportModule(playersService.LocalPlayer.UserId, var28, var30, p2, p3, p4, {}, nil, var66)
			
			if var67 then
				playersService:ReportAbuseV3(playersService.LocalPlayer, var67)
			end
		end
	end, {
		var30, var23, var25, var28, var49, var27, var47, var35
	})
	local var58 = reactModule.useCallback(function()
		-- upvalues: var31 (ref), var23 (ref), experienceStateCaptureService (copy)
		var31(nil)
		var23(false)
		experienceStateCaptureService:ResetHighlight()
	end, { var23, var31 })
	local var59 = reactModule.useCallback(function()
		-- upvalues: var25 (ref), inGameAssetReportAnalyticsModule (copy), var34 (ref), p0 (ref)
		var25(false)
		inGameAssetReportAnalyticsModule(var34, 1)
		p0.onReportComplete()
	end, { p0.onReportComplete, var25, var34 })
	local var60 = reactModule.useCallback(function()
		-- upvalues: var32 (ref), var33 (ref), var35 (ref), constantsModule (copy)
		if var32 then
			var33(false)
			
			return
		end
		var35({
			did_user_resize = true,
			type = constantsModule.AnalyticsActions.SetDidUserResize
		})
	end, { var32, var22, var35, var33 })
	reactModule.useEffect(function()
		-- upvalues: var36 (ref), userInputService (copy), var56 (ref), var37 (ref)
		if var36 then
			var36:Disconnect()
		end
		var37(userInputService.InputEnded:Connect(function(p6)
			-- upvalues: var56 (copy)
			if p6.KeyCode == Enum.KeyCode.Escape then
				var56()
			end
		end))
	end, { var56, var37 })
	local var61 = reactModule.useCallback(function()
		-- upvalues: var49 (ref)
		var49(nil)
	end, {})
	local var62 = reactModule.useCallback(function()
		-- upvalues: var51 (ref), httpService (copy), var28 (ref), text (copy), var47 (ref), var49 (ref), var27 (ref), constantsModule (copy)
		var51(true)
		httpService:RequestInternal({
			Method = "POST",
			Url = text,
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			},
			Body = httpService:JSONEncode({
				screenshot_id = var28,
				universe_id = game.GameId,
				contents = {}
			})
		}):Start(function(_, p7)
			-- upvalues: var51 (copy), httpService (copy), var47 (copy), var49 (copy), var27 (copy), constantsModule (copy)
			var51(false)
			
			if p7.StatusCode == 200 then
				local ok, status = pcall(httpService.JSONDecode, httpService, p7.Body)
				
				if ok and status and status.code then
					var47(status.code)
					var49(nil)
					var27(true)
					
					return
				end
			end
			var49(constantsModule.IpErrorCodes.Unknown)
		end)
	end, {
		var28,
		var47,
		var49,
		var27,
		var51
	})
	
	return withLocalization({
		mainTitle = "Feature.ReportAbuse.Label.HighlightProblemPrecise",
		coachmarkTitle = "Feature.ReportAbuse.Label.CantSelectTitle",
		coachmarkText = "Feature.ReportAbuse.Label.CantSelectSubtitle",
		next = if fFlagUpdateInGameAssetReportingCTAs then "CommonUI.Controls.Action.Continue" else "Feature.ReportAbuse.Action.Next"
	})(function(p8)
		-- upvalues: reactModule (copy), var60 (ref), isSmallPortraitMode (ref), reportPreciseSelectionPortraitHeaderFooterModule (copy), var56 (ref), reportPreciseSelectionLandscapeHeaderModule (copy), var55 (ref), var42 (ref), var53 (ref), var22 (ref), inGameAssetReportSubmitDialogModule (copy), viewportSize (ref), var57 (ref), var58 (ref), var35 (ref), fFlagPrefillPreciseSelectionChoices (copy), var30 (ref), var24 (ref), inGameAssetReportCompleteModalModule (copy), var59 (ref), var26 (ref), inGameAssetReportIPInfringementModalModule (copy), var46 (ref), var48 (ref), inGameAssetIPInfringementErrorModalModule (copy), var61 (ref), var62 (ref), var50 (ref)
		return reactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			[reactModule.Change.AbsoluteSize] = var60
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
				InGameAssetReportModeHeader = if isSmallPortraitMode then reactModule.createElement(reportPreciseSelectionPortraitHeaderFooterModule.PortraitModeHeader, {
					titleText = p8.mainTitle,
					nextText = p8.next,
					backAction = var56
				}) else reactModule.createElement(reportPreciseSelectionLandscapeHeaderModule, {
					titleText = p8.mainTitle,
					nextText = p8.next,
					nextAction = var55,
					backAction = var56,
					coachmarkTitle = p8.coachmarkTitle,
					coachmarkText = p8.coachmarkText,
					isCoachmarkOpen = var42,
					onCoachmarkClose = var53
				})
			}),
			Footer = if isSmallPortraitMode then reactModule.createElement("TextButton", {
				ZIndex = 2,
				BackgroundTransparency = 1,
				AutoButtonColor = false,
				Size = UDim2.new(1, 0, 0, 60),
				Position = UDim2.new(0, 0, 1, -60)
			}, {
				InGameAssetReportModeFooter = reactModule.createElement(reportPreciseSelectionPortraitHeaderFooterModule.PortraitModeFooter, {
					nextAction = var55,
					nextText = p8.next,
					isCoachmarkOpen = var42,
					onCoachmarkClose = var53,
					coachmarkTitle = p8.coachmarkTitle,
					coachmarkText = p8.coachmarkText
				})
			}) else nil,
			SubmitDialog = if var22 then reactModule.createElement(inGameAssetReportSubmitDialogModule, {
				screenSize = viewportSize,
				onSubmit = var57,
				onBack = var58,
				analyticsDispatch = var35,
				extractionResult = if fFlagPrefillPreciseSelectionChoices then var30 else nil
			}) else nil,
			ReportCompleteModal = if var24 then reactModule.createElement(inGameAssetReportCompleteModalModule, { screenSize = viewportSize, onClose = var59 }) else nil,
			IPInfringementModal = if var26 then reactModule.createElement(inGameAssetReportIPInfringementModalModule, {
				screenSize = viewportSize,
				reportCode = var46,
				onClose = var59
			}) else nil,
			ErrorModal = if var48 ~= nil then nil else reactModule.createElement(inGameAssetIPInfringementErrorModalModule, {
				screenSize = viewportSize,
				onBack = var61,
				errorCode = var48,
				onReportExperience = var62,
				isReportExperienceLoading = var50
			})
		})
	end)
end