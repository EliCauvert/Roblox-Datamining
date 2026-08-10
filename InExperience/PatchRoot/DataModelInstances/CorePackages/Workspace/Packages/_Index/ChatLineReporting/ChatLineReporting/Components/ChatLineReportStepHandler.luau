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
local chatLineReportSelectionModalOldModule = require(chatLineReporting.Components.ChatLineReportSelectionModalOld)
local chatLineReportVerbatimModule = require(chatLineReporting.Components.ChatLineReportVerbatim)
local chatLineReportCompleteModalModule = require(chatLineReporting.Components.ChatLineReportCompleteModal)
local reportCategoriesModule = require(chatLineReporting.Common.ReportCategories)
local fFlagChatLineReportingFocusFixesEnabled = require(parent.SharedFlags).FFlagChatLineReportingFocusFixesEnabled
local SSUIMetaLuaEngineFeature = game:GetEngineFeature("SSUIMetaLua")
local fFlagEnableGlobalChatAbuseReporting = require(parent.SharedFlags).FFlagEnableGlobalChatAbuseReporting
local fFlagGenericAbuseReportingGranularExports = require(parent.SharedFlags).FFlagGenericAbuseReportingGranularExports
local fFlagEnableChatReportingTextChannelTag = require(parent.SharedFlags).FFlagEnableChatReportingTextChannelTag
local t = { stiffness = 400, damping = 40, mass = 1 }
local t_1 = {
	[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = focusNavigationEventNameEnum.NavigateBack
}

return function(p0) --[[ line: 56 | named "ChatLineReportStepHandler" ]]
	-- upvalues: reactModule (ref), constantsModule (ref), analyticsReducerModule (ref), guiService (ref), useLocalization (ref), useTokens (ref), isSystemMessageModule (ref), fFlagEnableGlobalChatAbuseReporting (ref), SSUIMetaLuaEngineFeature (ref), reactOtterModule (ref), notificationModalsManagerModule (ref), images (ref), t (ref), chatLineReportAnalyticsModule (ref), fFlagEnableChatReportingTextChannelTag (ref), buildReportModule (ref), playersService (ref), cryoModule (ref), fFlagChatLineReportingFocusFixesEnabled (ref), chatLineReportSelectionModalOldModule (ref), defaultReportDialogModule (ref), chatLineReportVerbatimModule (ref), fFlagGenericAbuseReportingGranularExports (ref), reportCategoriesModule (ref), chatLineReportCompleteModalModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), focusRoot (ref), t_1 (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var22, var23 = reactModule.useState(constantsModule.ReportSteps.SELECT)
	local var24, var25 = reactModule.useState(nil)
	local var26, var27 = reactModule.useReducer(analyticsReducerModule, constantsModule.AnalyticsInitialState)
	local var28, var29 = reactModule.useState(not guiService.MenuIsOpen)
	local var30, var31 = reactModule.useState(guiService.MenuIsOpen)
	local var32, var33 = reactModule.useState(false)
	local var34, var35 = reactModule.useState(nil)
	local var36, var37 = reactModule.useState("")
	local var38 = useLocalization(constantsModule.ChatLineLocalizationKeys)
	local var39 = useLocalization({
		ChatToastTitleSuccess = { "Feature.ReportAbuse.Label.UserTextMuted", name = var36 },
		ChatToastTitleError = {
			"Feature.ReportAbuse.Label.UserTextMutedError",
			name = var36
		},
		ChatToastDescriptionErrorDoesNotExist = {
			"Feature.ReportAbuse.Message.UserTextMutedErrorDoesNotExist",
			name = var36
		}
	})
	local var40 = useTokens()
	reactModule.useEffect(function() --[[ line: 80 ]]
		-- upvalues: var27 (ref), constantsModule (copy), p0 (ref), isSystemMessageModule (copy), fFlagEnableGlobalChatAbuseReporting (copy), guiService (copy), var31 (ref), var29 (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 15
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end, {})
	reactModule.useEffect(function() --[[ line: 137 ]]
		-- upvalues: SSUIMetaLuaEngineFeature (copy), var28 (ref)
		if SSUIMetaLuaEngineFeature then
			pcall(function() --[[ line: 139 ]]
				-- upvalues: var28 (copy)
				local safetyService = game:GetService("SafetyService")
				
				if var28 then
					safetyService:ReportChatLineReportingOpen()
					
					return
				end
				safetyService:ReportChatLineReportingClose()
			end)
		end
	end, { var28 })
	local var41, var42 = reactOtterModule.useAnimatedBinding(1, function() --[[ line: 150 ]]
		-- upvalues: var28 (ref), var32 (ref), var34 (ref), constantsModule (copy), notificationModalsManagerModule (copy), images (copy), var39 (ref), var38 (ref), var40 (ref), p0 (ref)
		if not var28 then
			if var32 then
				if var34 and var34.key == constantsModule.SuccessfulMuteKey then
					notificationModalsManagerModule.SetUIBloxToast({
						iconImage = images[constantsModule.ToastIconImageSuccess],
						toastTitle = var39.ChatToastTitleSuccess,
						toastSubtitle = var38.ChatToastDescriptionSuccess,
						sequenceNumber = DateTime.now().UnixTimestamp,
						iconColorStyle = {
							Transparency = 0,
							Color = var40.Color.System.Success.Color3
						}
					})
				elseif var34 then
					notificationModalsManagerModule.SetUIBloxToast({
						iconImage = images[constantsModule.ToastIconImageError],
						toastTitle = var39.ChatToastTitleError,
						toastSubtitle = if var34.key == constantsModule.ErrorSelfMuteKey then var38.ChatToastDescriptionErrorSelf else var39.ChatToastDescriptionErrorDoesNotExist,
						sequenceNumber = DateTime.now().UnixTimestamp,
						iconColorStyle = {
							Transparency = 0,
							Color = var40.Color.System.Warning.Color3
						}
					})
				end
			end
			p0.unmount()
		end
	end)
	local var43 = reactModule.useMemo(function() --[[ line: 186 ]]
		-- upvalues: var28 (ref)
		return if var28 then 0 else 1
	end, { var28 })
	reactModule.useEffect(function() --[[ line: 190 ]]
		-- upvalues: var42 (ref), reactOtterModule (copy), var43 (ref), t (copy)
		var42(reactOtterModule.spring(var43, t))
	end, { var43 })
	local var44 = reactModule.useCallback(function() --[[ line: 195 ]]
		-- upvalues: var24 (ref), var23 (ref), constantsModule (copy)
		if var24 ~= nil then
			var23(constantsModule.ReportSteps.SUBMIT)
		end
	end)
	local var45 = reactModule.useCallback(function() --[[ line: 201 ]]
		-- upvalues: chatLineReportAnalyticsModule (copy), var26 (ref), var29 (ref)
		chatLineReportAnalyticsModule(var26, 2, false)
		var29(false)
	end, { var26 })
	local var46 = if var22 == constantsModule.ReportSteps.COMPLETE then reactModule.useCallback(function() --[[ line: 286 ]]
		-- upvalues: chatLineReportAnalyticsModule (copy), var26 (ref), var29 (ref)
		chatLineReportAnalyticsModule(var26, 1, false)
		var29(false)
	end, { var26 }) else var45
	local textButton = reactModule.createElement("TextButton", {
		Active = var41:map(function(p1) --[[ line: 296 ]]
			return p1 == 0
		end),
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundTransparency = var41:map(function(p2) --[[ line: 301 ]]
			return p2 + 0.3
		end),
		BackgroundColor3 = Color3.fromHex("#000000"),
		Text = "",
		Selectable = if fFlagChatLineReportingFocusFixesEnabled then false else nil,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		[reactModule.Event.Activated] = var46,
		ZIndex = 10
	}, {
		Frame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = var41:map(function(p3) --[[ line: 316 ]]
				-- upvalues: var30 (ref)
				return if var30 then UDim2.new(0, 0, -p3, 0) else UDim2.new(0, 0, p3, 0)
			end)
		}, {
			ChatLineReportStep = if var22 == constantsModule.ReportSteps.SELECT then reactModule.createElement(chatLineReportSelectionModalOldModule, {
				onContinue = var44,
				onBack = var45,
				messages = p0.messages,
				selectedMessage = var24,
				setSelectedMessage = var25,
				analyticsDispatch = var27
			}) elseif var22 == constantsModule.ReportSteps.SUBMIT then reactModule.createElement(defaultReportDialogModule, {
				analyticsContext = "ReportViaChatLine",
				topCustomComponent = reactModule.createElement(chatLineReportVerbatimModule, { selectedMessage = var24 }),
				onSubmitProps = {
					hasNextSteps = true,
					onProceedToNextStep = reactModule.useCallback(function(p5, p6) --[[ line: 213 ]]
						-- upvalues: fFlagEnableChatReportingTextChannelTag (copy), buildReportModule (copy), playersService (copy), var24 (ref), cryoModule (copy), p0 (ref), isSystemMessageModule (copy), var27 (ref), constantsModule (copy), var23 (ref)
						local t = {}
						local var50 = if fFlagEnableChatReportingTextChannelTag then buildReportModule(playersService.LocalPlayer.UserId, var24.userId, p5, p6, var24.messageId, var24.presetId, var24.presetChatVersion, if var24.textChannel then var24.textChannel.Name else nil) else buildReportModule(playersService.LocalPlayer.UserId, var24.userId, p5, p6, var24.messageId, var24.presetId, var24.presetChatVersion)
						cryoModule.Dictionary.map(p0.messages, function(p7) --[[ line: 240 ]]
							-- upvalues: isSystemMessageModule (copy), t (ref)
							if not isSystemMessageModule(p7) then
								t[#t + 1] = { channel = p7.textChannel, messageId = p7.messageId }
							end
						end)
						local list = {
							{ channel = var24.textChannel, messageId = var24.messageId }
						}
						var27({
							type = constantsModule.AnalyticsActions.SetReasonSelection,
							reason_selection = p5
						})
						var27({
							type = constantsModule.AnalyticsActions.SetCommentAdded,
							comment_added = #p6 > 0
						})
						playersService:ReportChatAbuse(t, list, var50)
						var23(constantsModule.ReportSteps.COMPLETE)
						
						return true
					end, { p0.messages, var24 })
				},
				localizationKeys = if fFlagGenericAbuseReportingGranularExports then constantsModule.SubmitDialogLocalizationKeys else constantsModule.GenericAbuseReportingLocalizationKeys,
				onCloseProps = {
					hasPreviousSteps = true,
					onBackToPreviousStep = reactModule.useCallback(function() --[[ line: 208 ]]
						-- upvalues: var23 (ref), constantsModule (copy), var25 (ref)
						var23(constantsModule.ReportSteps.SELECT)
						var25(nil)
					end)
				},
				reportCategories = reportCategoriesModule,
				onBeforeSubmitAnalytics = function(p8) --[[ line: 350 ]]
					return p8
				end
			}) elseif var22 == constantsModule.ReportSteps.COMPLETE then reactModule.createElement(chatLineReportCompleteModalModule, {
				localizationKeys = if fFlagGenericAbuseReportingGranularExports then constantsModule.CompleteDialogLocalizationKeys else constantsModule.GenericAbuseReportingLocalizationKeys,
				onDismiss = reactModule.useCallback(function(p4) --[[ line: 272 ]]
					-- upvalues: chatLineReportAnalyticsModule (copy), var26 (ref), var35 (ref), var37 (ref), var33 (ref), var29 (ref)
					if p4 then
						chatLineReportAnalyticsModule(var26, 1, true)
						var35(p4)
						var37(p4.args.RBX_NAME)
						var33(true)
						var29(false)
						
						return
					end
					chatLineReportAnalyticsModule(var26, 1, false)
					var29(false)
				end, { var26 }),
				selectedMessage = var24
			}) else nil
		})
	})
	
	return if fFlagChatLineReportingFocusFixesEnabled then reactModule.createElement(focusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		eventHandlers = reactModule.useMemo(function() --[[ line: 369 ]]
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var46 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p9) --[[ line: 372 ]]
						-- upvalues: var46 (copy)
						var46()
						p9:cancel()
					end)
				}
			}
		end, { var46 }),
		eventMap = t_1,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, { ChatLineReportStepHandler = textButton }) else textButton
end