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

return function(p1)
	-- upvalues: reactModule (ref), analyticsReducerModule (ref), constantsModule (ref), setTimeout (ref), clearTimeout (ref), preciseSelectionBugfixesEnabled (ref), screenshotManager (ref), sceneAnalysisModule (ref), inGameAssetReportAnalyticsModule (ref), experienceStateCaptureService (ref), userInputService (ref), httpService (ref), text (ref), getHighlightModeVariantModule (ref), buildReportModule (ref), playersService (ref), withLocalization (ref), fFlagUpdateInGameAssetReportingCTAs (ref), reportPreciseSelectionPortraitHeaderFooterModule (ref), reportPreciseSelectionLandscapeHeaderModule (ref), inGameAssetReportSubmitDialogModule (ref), fFlagPrefillPreciseSelectionChoices (ref), inGameAssetReportCompleteModalModule (ref), inGameAssetReportIPInfringementModalModule (ref), inGameAssetIPInfringementErrorModalModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState("")
	local var9, var10 = reactModule.useState(nil)
	local var11, var12 = reactModule.useState(true)
	local var13, var14 = reactModule.useReducer(analyticsReducerModule, constantsModule.AnalyticsInitialState)
	local var15, var16 = reactModule.useState(nil)
	local var17, var18 = reactModule.useState(nil)
	local var19, var20 = reactModule.useState(nil)
	local var21, var22 = reactModule.useState(false)
	local var23, var24 = reactModule.useState(nil)
	local var25, var26 = reactModule.useState("")
	local var27, var28 = reactModule.useState(nil)
	local var29, var30 = reactModule.useState(false)
	local viewportSize = game.Workspace.CurrentCamera.ViewportSize
	local isSmallPortraitMode = p1.getIsSmallPortraitMode(viewportSize)
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), constantsModule (copy), var24 (ref), setTimeout (copy), var22 (ref)
		var14({
			type = constantsModule.AnalyticsActions.AccumulateForTimeSpent,
			accumulated_time_ms = workspace:GetServerTimeNow() * 1000
		})
		var14({
			type = constantsModule.AnalyticsActions.SetPlaceId,
			place_id = game.PlaceId
		})
		var24(setTimeout(function()
			-- upvalues: var22 (copy)
			var22(true)
		end, 10000))
	end, { var22, var24 })
	local var31 = reactModule.useCallback(function()
		-- upvalues: var22 (ref), var23 (ref), clearTimeout (copy)
		var22(false)
		
		if var23 then
			clearTimeout(var23)
		end
	end, { var22, var23 })
	local var32 = reactModule.useCallback(function()
		-- upvalues: preciseSelectionBugfixesEnabled (copy), var7 (ref), screenshotManager (copy), var8 (ref), var31 (ref), var2 (ref), var14 (ref), constantsModule (copy), viewportSize (ref), isSmallPortraitMode (ref)
		if preciseSelectionBugfixesEnabled then
			if var7 == "" then
				screenshotManager:TakeScreenshotWithCallback(var8, nil)
			end
		elseif not var7 then
			screenshotManager:TakeScreenshotWithCallback(var8, nil)
		end
		var31()
		var2(true)
		var14({
			type = constantsModule.AnalyticsActions.SetViewportInformation,
			viewport_size_x = viewportSize.X,
			viewport_size_y = viewportSize.Y,
			is_portrait_mode = isSmallPortraitMode
		})
		var14({
			type = constantsModule.AnalyticsActions.IncrementNextCount
		})
	end, {
		var2, var8, var7, viewportSize, isSmallPortraitMode, var14, var31
	})
	local var33 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), sceneAnalysisModule (copy), var19 (ref), var32 (ref)
		var10(sceneAnalysisModule.interpretAndExtractItemsFromInstanceForPreciseSelection(var19))
		var32()
	end, { var32, var10, var19 })
	local var34 = reactModule.useCallback(function()
		-- upvalues: inGameAssetReportAnalyticsModule (copy), var13 (ref), p1 (ref)
		inGameAssetReportAnalyticsModule(var13, 2)
		p1.backAction()
	end, { p1.backAction, var13 })
	reactModule.useEffect(function()
		-- upvalues: var17 (ref), experienceStateCaptureService (copy), var20 (ref), var14 (ref), constantsModule (copy), preciseSelectionBugfixesEnabled (copy), var31 (ref), userInputService (copy), var10 (ref), sceneAnalysisModule (copy), var32 (ref), var18 (ref)
		if var17 then
			var17:Disconnect()
		end
		var18(experienceStateCaptureService.ItemSelectedInCaptureMode:Connect(function(p2)
			-- upvalues: var20 (copy), var14 (copy), constantsModule (copy), preciseSelectionBugfixesEnabled (copy), var31 (copy), userInputService (copy), var10 (copy), sceneAnalysisModule (copy), var32 (copy)
			var20(p2)
			
			if p2 then
				var14({
					type = constantsModule.AnalyticsActions.IncremementAnnotationCount
				})
				
				if preciseSelectionBugfixesEnabled then
					var31()
				end
			end
			if userInputService.PreferredInput ~= Enum.PreferredInput.Touch then
				var10(sceneAnalysisModule.interpretAndExtractItemsFromInstanceForPreciseSelection(p2))
				var32()
			end
		end))
	end, {
		var20, var18, var32, var10, var14, var31
	})
	local var35 = reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: var9 (ref), var28 (ref), constantsModule (copy), var7 (ref), httpService (copy), text (copy), var26 (ref), var6 (ref), var2 (ref), var4 (ref), var14 (ref), getHighlightModeVariantModule (copy), buildReportModule (copy), playersService (copy)
		if p2 == "ip infringement" then
			if not var9 or not var9.extractedAssets then
				var28(constantsModule.IpErrorCodes.ClientNoAssetsExtracted)
				
				return
			end
			local t = {}
			
			for i, v in pairs(var9.extractedAssets) do
				for i_1, v_1 in ipairs(v) do
					local var36 = if i == "Package" then v_1.id else v_1
					
					if var36 then
						local match = string.match(var36, "%d+")
						
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
						screenshot_id = var7,
						universe_id = game.GameId,
						contents = t
					})
				}):Start(function(_, p5)
					-- upvalues: httpService (copy), var26 (copy), var6 (copy), var28 (copy), constantsModule (copy)
					if p5.StatusCode == 200 then
						local ok, status = pcall(httpService.JSONDecode, httpService, p5.Body)
						
						if ok and status and status.code then
							var26(status.code)
							var6(true)
							
							return
						end
						var28(constantsModule.IpErrorCodes.Unknown)
						
						return
					else
						local unknown = constantsModule.IpErrorCodes.Unknown
						local ok, status = pcall(httpService.JSONDecode, httpService, p5.Body)
						
						if ok and status and (status.app_error_code and status.app_error_code ~= "") then
							unknown = status.app_error_code
						end
						var28(unknown)
					end
				end)
				
				return
			end
			var28(constantsModule.IpErrorCodes.ClientNoAssetsExtracted)
			
			return
		else
			var2(false)
			var4(true)
			var14({
				final_annotation_count = 0,
				type = constantsModule.AnalyticsActions.SetExtractionResults,
				results = var9
			})
			var14({
				type = constantsModule.AnalyticsActions.SetReasonSelection,
				reason_selection = p2
			})
			var14({
				type = constantsModule.AnalyticsActions.SetSurfaceSelection,
				surface_selection = p3
			})
			var14({
				type = constantsModule.AnalyticsActions.SetCommentAdded,
				comment_added = #p4 > 0
			})
			local var37 = getHighlightModeVariantModule()
			var14({
				type = constantsModule.AnalyticsActions.SetVariant,
				variant = var37
			})
			local var38 = buildReportModule(playersService.LocalPlayer.UserId, var7, var9, p2, p3, p4, {}, nil, var37)
			
			if var38 then
				playersService:ReportAbuseV3(playersService.LocalPlayer, var38)
			end
		end
	end, {
		var9, var2, var4, var7, var28, var6, var26, var14
	})
	local var39 = reactModule.useCallback(function()
		-- upvalues: var10 (ref), var2 (ref), experienceStateCaptureService (copy)
		var10(nil)
		var2(false)
		experienceStateCaptureService:ResetHighlight()
	end, { var2, var10 })
	local var40 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), inGameAssetReportAnalyticsModule (copy), var13 (ref), p1 (ref)
		var4(false)
		inGameAssetReportAnalyticsModule(var13, 1)
		p1.onReportComplete()
	end, { p1.onReportComplete, var4, var13 })
	local var41 = reactModule.useCallback(function()
		-- upvalues: var11 (ref), var12 (ref), var14 (ref), constantsModule (copy)
		if var11 then
			var12(false)
			
			return
		end
		var14({
			did_user_resize = true,
			type = constantsModule.AnalyticsActions.SetDidUserResize
		})
	end, { var11, var1, var14, var12 })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref), userInputService (copy), var34 (ref), var16 (ref)
		if var15 then
			var15:Disconnect()
		end
		var16(userInputService.InputEnded:Connect(function(p5)
			-- upvalues: var34 (copy)
			if p5.KeyCode == Enum.KeyCode.Escape then
				var34()
			end
		end))
	end, { var34, var16 })
	local var42 = reactModule.useCallback(function()
		-- upvalues: var28 (ref)
		var28(nil)
	end, {})
	local var43 = reactModule.useCallback(function()
		-- upvalues: var30 (ref), httpService (copy), var7 (ref), text (copy), var26 (ref), var28 (ref), var6 (ref), constantsModule (copy)
		var30(true)
		httpService:RequestInternal({
			Method = "POST",
			Url = text,
			Headers = {
				["Content-Type"] = "application/json",
				Accept = "application/json"
			},
			Body = httpService:JSONEncode({
				screenshot_id = var7,
				universe_id = game.GameId,
				contents = {}
			})
		}):Start(function(_, p5)
			-- upvalues: var30 (copy), httpService (copy), var26 (copy), var28 (copy), var6 (copy), constantsModule (copy)
			var30(false)
			
			if p5.StatusCode == 200 then
				local ok, status = pcall(httpService.JSONDecode, httpService, p5.Body)
				
				if ok and status and status.code then
					var26(status.code)
					var28(nil)
					var6(true)
					
					return
				end
			end
			var28(constantsModule.IpErrorCodes.Unknown)
		end)
	end, {
		var7,
		var26,
		var28,
		var6,
		var30
	})
	
	return withLocalization({
		mainTitle = "Feature.ReportAbuse.Label.HighlightProblemPrecise",
		coachmarkTitle = "Feature.ReportAbuse.Label.CantSelectTitle",
		coachmarkText = "Feature.ReportAbuse.Label.CantSelectSubtitle",
		next = if fFlagUpdateInGameAssetReportingCTAs then "CommonUI.Controls.Action.Continue" else "Feature.ReportAbuse.Action.Next"
	})(function(p5)
		-- upvalues: reactModule (copy), var41 (ref), isSmallPortraitMode (ref), reportPreciseSelectionPortraitHeaderFooterModule (copy), var34 (ref), reportPreciseSelectionLandscapeHeaderModule (copy), var33 (ref), var21 (ref), var31 (ref), var1 (ref), inGameAssetReportSubmitDialogModule (copy), viewportSize (ref), var35 (ref), var39 (ref), var14 (ref), fFlagPrefillPreciseSelectionChoices (copy), var9 (ref), var3 (ref), inGameAssetReportCompleteModalModule (copy), var40 (ref), var5 (ref), inGameAssetReportIPInfringementModalModule (copy), var25 (ref), var27 (ref), inGameAssetIPInfringementErrorModalModule (copy), var42 (ref), var43 (ref), var29 (ref)
		return reactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			[reactModule.Change.AbsoluteSize] = var41
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
					titleText = p5.mainTitle,
					nextText = p5.next,
					backAction = var34
				}) else reactModule.createElement(reportPreciseSelectionLandscapeHeaderModule, {
					titleText = p5.mainTitle,
					nextText = p5.next,
					nextAction = var33,
					backAction = var34,
					coachmarkTitle = p5.coachmarkTitle,
					coachmarkText = p5.coachmarkText,
					isCoachmarkOpen = var21,
					onCoachmarkClose = var31
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
					nextAction = var33,
					nextText = p5.next,
					isCoachmarkOpen = var21,
					onCoachmarkClose = var31,
					coachmarkTitle = p5.coachmarkTitle,
					coachmarkText = p5.coachmarkText
				})
			}) else nil,
			SubmitDialog = if var1 then reactModule.createElement(inGameAssetReportSubmitDialogModule, {
				screenSize = viewportSize,
				onSubmit = var35,
				onBack = var39,
				analyticsDispatch = var14,
				extractionResult = if fFlagPrefillPreciseSelectionChoices then var9 else nil
			}) else nil,
			ReportCompleteModal = if var3 then reactModule.createElement(inGameAssetReportCompleteModalModule, { screenSize = viewportSize, onClose = var40 }) else nil,
			IPInfringementModal = if var5 then reactModule.createElement(inGameAssetReportIPInfringementModalModule, {
				screenSize = viewportSize,
				reportCode = var25,
				onClose = var40
			}) else nil,
			ErrorModal = if var27 ~= nil then nil else reactModule.createElement(inGameAssetIPInfringementErrorModalModule, {
				screenSize = viewportSize,
				onBack = var42,
				errorCode = var27,
				onReportExperience = var43,
				isReportExperienceLoading = var29
			})
		})
	end)
end