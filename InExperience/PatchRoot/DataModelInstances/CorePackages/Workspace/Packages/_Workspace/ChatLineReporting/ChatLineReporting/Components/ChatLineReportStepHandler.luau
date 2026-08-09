local chatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local playersService = game:GetService("Players")
local parent = chatLineReporting.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local focusRoot = focusNavigationUtilsModule.FocusRoot
local inputHandlersModule = require(parent.InputHandlers)
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local reactOtterModule = require(parent.ReactOtter)
local guiService = game:GetService("GuiService")
local defaultReportDialogModule = require(parent.GenericAbuseReporting.DefaultReportDialog)
local notificationModalsManagerModule = require(parent.NotificationModalsManager)
local useTokens = require(parent.Foundation).Hooks.useTokens
local images = require(parent.UIBlox).App.ImageSet.Images
local useLocalization = require(parent.Localization).Hooks.useLocalization
local constantsModule = require(chatLineReporting.Common.Constants)
local analyticsReducerModule = require(chatLineReporting.Common.AnalyticsReducer)
local chatLineReportAnalyticsModule = require(chatLineReporting.Common.ChatLineReportAnalytics)
local buildReportModule = require(chatLineReporting.Common.buildReport)
local isSystemMessageModule = require(chatLineReporting.Common.isSystemMessage)
local chatLineReportSelectionModalModule = require(chatLineReporting.Components.ChatLineReportSelectionModal)
local chatLineReportSelectionModalOldModule = require(chatLineReporting.Components.ChatLineReportSelectionModalOld)
local chatLineReportVerbatimModule = require(chatLineReporting.Components.ChatLineReportVerbatim)
local chatLineReportCompleteModalModule = require(chatLineReporting.Components.ChatLineReportCompleteModal)
local reportCategoriesModule = require(chatLineReporting.Common.ReportCategories)
local chatLineSelectionModeModule = require(chatLineReporting.Enums.ChatLineSelectionMode)
local fFlagChatLineReportingFocusFixesEnabled = require(parent.SharedFlags).FFlagChatLineReportingFocusFixesEnabled
local fFlagChatLineReportingReworkEnabledModule = require(chatLineReporting.Flags.FFlagChatLineReportingReworkEnabled)
local SSUIMetaLuaEngineFeature = game:GetEngineFeature("SSUIMetaLua")
local fFlagEnableGlobalChatAbuseReporting = require(parent.SharedFlags).FFlagEnableGlobalChatAbuseReporting
local fFlagGenericAbuseReportingGranularExports = require(parent.SharedFlags).FFlagGenericAbuseReportingGranularExports
local t = { stiffness = 400, damping = 40, mass = 1 }
local t_1 = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p0) --[[ line: 58 | named "ChatLineReportStepHandler" ]]
	-- upvalues: reactModule (ref), constantsModule (ref), analyticsReducerModule (ref), guiService (ref), useLocalization (ref), useTokens (ref), isSystemMessageModule (ref), fFlagEnableGlobalChatAbuseReporting (ref), SSUIMetaLuaEngineFeature (ref), reactOtterModule (ref), notificationModalsManagerModule (ref), images (ref), t (ref), chatLineReportAnalyticsModule (ref), buildReportModule (ref), playersService (ref), cryoModule (ref), fFlagChatLineReportingFocusFixesEnabled (ref), fFlagChatLineReportingReworkEnabledModule (ref), chatLineReportSelectionModalModule (ref), chatLineReportSelectionModalOldModule (ref), chatLineSelectionModeModule (ref), defaultReportDialogModule (ref), chatLineReportVerbatimModule (ref), fFlagGenericAbuseReportingGranularExports (ref), reportCategoriesModule (ref), chatLineReportCompleteModalModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), focusRoot (ref), t_1 (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var25, var26 = reactModule.useState(constantsModule.ReportSteps.SELECT)
	local var27, var28 = reactModule.useState(nil)
	local var29, var30 = reactModule.useReducer(analyticsReducerModule, constantsModule.AnalyticsInitialState)
	local var31, var32 = reactModule.useState(not guiService.MenuIsOpen)
	local var33, var34 = reactModule.useState(guiService.MenuIsOpen)
	local var35, var36 = reactModule.useState(false)
	local var37, var38 = reactModule.useState(nil)
	local var39, var40 = reactModule.useState("")
	local var41 = useLocalization(constantsModule.ChatLineLocalizationKeys)
	local var42 = useLocalization({
		ChatToastTitleSuccess = { "Feature.ReportAbuse.Label.UserTextMuted", name = var39 },
		ChatToastTitleError = {
			"Feature.ReportAbuse.Label.UserTextMutedError",
			name = var39
		},
		ChatToastDescriptionErrorDoesNotExist = {
			"Feature.ReportAbuse.Message.UserTextMutedErrorDoesNotExist",
			name = var39
		}
	})
	local var43 = useTokens()
	reactModule.useEffect(function() --[[ line: 82 ]]
		-- upvalues: var30 (ref), constantsModule (copy), p0 (ref), isSystemMessageModule (copy), fFlagEnableGlobalChatAbuseReporting (copy), guiService (copy), var34 (ref), var32 (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 15
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end, {})
	reactModule.useEffect(function() --[[ line: 139 ]]
		-- upvalues: SSUIMetaLuaEngineFeature (copy), var31 (ref)
		if SSUIMetaLuaEngineFeature then
			pcall(function() --[[ line: 141 ]]
				-- upvalues: var31 (copy)
				local safetyService = game:GetService("SafetyService")
				
				if var31 then
					safetyService:ReportChatLineReportingOpen()
					
					return
				end
				safetyService:ReportChatLineReportingClose()
			end)
		end
	end, { var31 })
	local var44, var45 = reactOtterModule.useAnimatedBinding(1, function() --[[ line: 152 ]]
		-- upvalues: var31 (ref), var35 (ref), var37 (ref), constantsModule (copy), notificationModalsManagerModule (copy), images (copy), var42 (ref), var41 (ref), var43 (ref), p0 (ref)
		if not var31 then
			if var35 then
				if var37 and var37.key == constantsModule.SuccessfulMuteKey then
					notificationModalsManagerModule.SetUIBloxToast({
						iconImage = images[constantsModule.ToastIconImageSuccess],
						toastTitle = var42.ChatToastTitleSuccess,
						toastSubtitle = var41.ChatToastDescriptionSuccess,
						sequenceNumber = DateTime.now().UnixTimestamp,
						iconColorStyle = {
							Transparency = 0,
							Color = var43.Color.System.Success.Color3
						}
					})
				elseif var37 then
					notificationModalsManagerModule.SetUIBloxToast({
						iconImage = images[constantsModule.ToastIconImageError],
						toastTitle = var42.ChatToastTitleError,
						toastSubtitle = if var37.key == constantsModule.ErrorSelfMuteKey then var41.ChatToastDescriptionErrorSelf else var42.ChatToastDescriptionErrorDoesNotExist,
						sequenceNumber = DateTime.now().UnixTimestamp,
						iconColorStyle = {
							Transparency = 0,
							Color = var43.Color.System.Warning.Color3
						}
					})
				end
			end
			p0.unmount()
		end
	end)
	local var46 = reactModule.useMemo(function() --[[ line: 188 ]]
		-- upvalues: var31 (ref)
		return if var31 then 0 else 1
	end, { var31 })
	reactModule.useEffect(function() --[[ line: 192 ]]
		-- upvalues: var45 (ref), reactOtterModule (copy), var46 (ref), t (copy)
		var45(reactOtterModule.spring(var46, t))
	end, { var46 })
	local var47 = reactModule.useCallback(function() --[[ line: 197 ]]
		-- upvalues: var27 (ref), var26 (ref), constantsModule (copy)
		if var27 ~= nil then
			var26(constantsModule.ReportSteps.SUBMIT)
		end
	end)
	local var48 = reactModule.useCallback(function() --[[ line: 203 ]]
		-- upvalues: chatLineReportAnalyticsModule (copy), var29 (ref), var32 (ref)
		chatLineReportAnalyticsModule(var29, 2, false)
		var32(false)
	end, { var29 })
	local var49 = if var25 == constantsModule.ReportSteps.COMPLETE then reactModule.useCallback(function() --[[ line: 274 ]]
		-- upvalues: chatLineReportAnalyticsModule (copy), var29 (ref), var32 (ref)
		chatLineReportAnalyticsModule(var29, 1, false)
		var32(false)
	end, { var29 }) else var48
	local textButton = reactModule.createElement("TextButton", {
		Active = var44:map(function(p1) --[[ line: 284 ]]
			return p1 == 0
		end),
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundTransparency = var44:map(function(p2) --[[ line: 289 ]]
			return p2 + 0.3
		end),
		BackgroundColor3 = Color3.fromHex("#000000"),
		Text = "",
		Selectable = if fFlagChatLineReportingFocusFixesEnabled then false else nil,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		[reactModule.Event.Activated] = var49,
		ZIndex = 10
	}, {
		Frame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = var44:map(function(p3) --[[ line: 304 ]]
				-- upvalues: var33 (ref)
				return if var33 then UDim2.new(0, 0, -p3, 0) else UDim2.new(0, 0, p3, 0)
			end)
		}, {
			ChatLineReportStep = if var25 == constantsModule.ReportSteps.SELECT then reactModule.createElement(if fFlagChatLineReportingReworkEnabledModule then chatLineReportSelectionModalModule else chatLineReportSelectionModalOldModule, {
				onContinue = var47,
				onBack = var48,
				messages = p0.messages,
				selectedMessage = var27,
				setSelectedMessage = var28,
				analyticsDispatch = var30,
				mode = chatLineSelectionModeModule.Radio
			}) elseif var25 == constantsModule.ReportSteps.SUBMIT then reactModule.createElement(defaultReportDialogModule, {
				analyticsContext = "ReportViaChatLine",
				topCustomComponent = reactModule.createElement(chatLineReportVerbatimModule, { selectedMessage = var27 }),
				onSubmitProps = {
					hasNextSteps = true,
					onProceedToNextStep = reactModule.useCallback(function(p5, p6) --[[ line: 215 ]]
						-- upvalues: buildReportModule (copy), playersService (copy), var27 (ref), cryoModule (copy), p0 (ref), isSystemMessageModule (copy), var30 (ref), constantsModule (copy), var26 (ref)
						local t = {}
						local var53 = buildReportModule(playersService.LocalPlayer.UserId, var27.userId, p5, p6, var27.messageId, var27.presetId, var27.presetChatVersion)
						cryoModule.Dictionary.map(p0.messages, function(p7) --[[ line: 228 ]]
							-- upvalues: isSystemMessageModule (copy), t (ref)
							if not isSystemMessageModule(p7) then
								t[#t + 1] = { channel = p7.textChannel, messageId = p7.messageId }
							end
						end)
						local list = {
							{ channel = var27.textChannel, messageId = var27.messageId }
						}
						var30({
							type = constantsModule.AnalyticsActions.SetReasonSelection,
							reason_selection = p5
						})
						var30({
							type = constantsModule.AnalyticsActions.SetCommentAdded,
							comment_added = #p6 > 0
						})
						playersService:ReportChatAbuse(t, list, var53)
						var26(constantsModule.ReportSteps.COMPLETE)
						
						return true
					end, { p0.messages, var27 })
				},
				localizationKeys = if fFlagGenericAbuseReportingGranularExports then constantsModule.SubmitDialogLocalizationKeys else constantsModule.GenericAbuseReportingLocalizationKeys,
				onCloseProps = {
					hasPreviousSteps = true,
					onBackToPreviousStep = reactModule.useCallback(function() --[[ line: 210 ]]
						-- upvalues: var26 (ref), constantsModule (copy), var28 (ref)
						var26(constantsModule.ReportSteps.SELECT)
						var28(nil)
					end)
				},
				reportCategories = reportCategoriesModule,
				onBeforeSubmitAnalytics = function(p8) --[[ line: 344 ]]
					return p8
				end
			}) elseif var25 == constantsModule.ReportSteps.COMPLETE then reactModule.createElement(chatLineReportCompleteModalModule, {
				localizationKeys = if fFlagGenericAbuseReportingGranularExports then constantsModule.CompleteDialogLocalizationKeys else constantsModule.GenericAbuseReportingLocalizationKeys,
				onDismiss = reactModule.useCallback(function(p4) --[[ line: 260 ]]
					-- upvalues: chatLineReportAnalyticsModule (copy), var29 (ref), var38 (ref), var40 (ref), var36 (ref), var32 (ref)
					if p4 then
						chatLineReportAnalyticsModule(var29, 1, true)
						var38(p4)
						var40(p4.args.RBX_NAME)
						var36(true)
						var32(false)
						
						return
					end
					chatLineReportAnalyticsModule(var29, 1, false)
					var32(false)
				end, { var29 }),
				selectedMessage = var27
			}) else nil
		})
	})
	
	return if fFlagChatLineReportingFocusFixesEnabled then reactModule.createElement(focusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		eventHandlers = reactModule.useMemo(function() --[[ line: 363 ]]
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var49 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p9) --[[ line: 366 ]]
						-- upvalues: var49 (copy)
						var49()
						p9:cancel()
					end)
				}
			}
		end, { var49 }),
		eventMap = t_1,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, { ChatLineReportStepHandler = textButton }) else textButton
end