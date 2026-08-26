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

return function(p1)
	-- upvalues: reactModule (ref), constantsModule (ref), analyticsReducerModule (ref), guiService (ref), useLocalization (ref), useTokens (ref), isSystemMessageModule (ref), fFlagEnableGlobalChatAbuseReporting (ref), SSUIMetaLuaEngineFeature (ref), reactOtterModule (ref), notificationModalsManagerModule (ref), images (ref), t (ref), chatLineReportAnalyticsModule (ref), fFlagEnableChatReportingTextChannelTag (ref), buildReportModule (ref), playersService (ref), cryoModule (ref), fFlagChatLineReportingFocusFixesEnabled (ref), chatLineReportSelectionModalOldModule (ref), defaultReportDialogModule (ref), chatLineReportVerbatimModule (ref), fFlagGenericAbuseReportingGranularExports (ref), reportCategoriesModule (ref), chatLineReportCompleteModalModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), focusRoot (ref), t_1 (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var1, var2 = reactModule.useState(constantsModule.ReportSteps.SELECT)
	local var3, var4 = reactModule.useState(nil)
	local var5, var6 = reactModule.useReducer(analyticsReducerModule, constantsModule.AnalyticsInitialState)
	local var7, var8 = reactModule.useState(not guiService.MenuIsOpen)
	local var9, var10 = reactModule.useState(guiService.MenuIsOpen)
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(nil)
	local var15, var16 = reactModule.useState("")
	local var17 = useLocalization(constantsModule.ChatLineLocalizationKeys)
	local var18 = useLocalization({
		ChatToastTitleSuccess = { "Feature.ReportAbuse.Label.UserTextMuted", name = var15 },
		ChatToastTitleError = {
			"Feature.ReportAbuse.Label.UserTextMutedError",
			name = var15
		},
		ChatToastDescriptionErrorDoesNotExist = {
			"Feature.ReportAbuse.Message.UserTextMutedErrorDoesNotExist",
			name = var15
		}
	})
	local var19 = useTokens()
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), constantsModule (copy), p1 (ref), isSystemMessageModule (copy), fFlagEnableGlobalChatAbuseReporting (copy), guiService (copy), var10 (ref), var8 (ref)
-- FATAL: Failed to generate AST for `unnamed` function:
runtime : [KeyError] :11990: 15
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
	end, {})
	reactModule.useEffect(function()
		-- upvalues: SSUIMetaLuaEngineFeature (copy), var7 (ref)
		if SSUIMetaLuaEngineFeature then
			pcall(function()
				-- upvalues: var7 (copy)
				local safetyService = game:GetService("SafetyService")
				
				if var7 then
					safetyService:ReportChatLineReportingOpen()
					
					return
				end
				safetyService:ReportChatLineReportingClose()
			end)
		end
	end, { var7 })
	local var20, var21 = reactOtterModule.useAnimatedBinding(1, function()
		-- upvalues: var7 (ref), var11 (ref), var13 (ref), constantsModule (copy), notificationModalsManagerModule (copy), images (copy), var18 (ref), var17 (ref), var19 (ref), p1 (ref)
		if not var7 then
			if var11 then
				if var13 and var13.key == constantsModule.SuccessfulMuteKey then
					notificationModalsManagerModule.SetUIBloxToast({
						iconImage = images[constantsModule.ToastIconImageSuccess],
						toastTitle = var18.ChatToastTitleSuccess,
						toastSubtitle = var17.ChatToastDescriptionSuccess,
						sequenceNumber = DateTime.now().UnixTimestamp,
						iconColorStyle = {
							Transparency = 0,
							Color = var19.Color.System.Success.Color3
						}
					})
				elseif var13 then
					notificationModalsManagerModule.SetUIBloxToast({
						iconImage = images[constantsModule.ToastIconImageError],
						toastTitle = var18.ChatToastTitleError,
						toastSubtitle = if var13.key == constantsModule.ErrorSelfMuteKey then var17.ChatToastDescriptionErrorSelf else var18.ChatToastDescriptionErrorDoesNotExist,
						sequenceNumber = DateTime.now().UnixTimestamp,
						iconColorStyle = {
							Transparency = 0,
							Color = var19.Color.System.Warning.Color3
						}
					})
				end
			end
			p1.unmount()
		end
	end)
	local var22 = reactModule.useMemo(function()
		-- upvalues: var7 (ref)
		return if var7 then 0 else 1
	end, { var7 })
	reactModule.useEffect(function()
		-- upvalues: var21 (ref), reactOtterModule (copy), var22 (ref), t (copy)
		var21(reactOtterModule.spring(var22, t))
	end, { var22 })
	local var23 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var2 (ref), constantsModule (copy)
		if var3 ~= nil then
			var2(constantsModule.ReportSteps.SUBMIT)
		end
	end)
	local var24 = reactModule.useCallback(function()
		-- upvalues: chatLineReportAnalyticsModule (copy), var5 (ref), var8 (ref)
		chatLineReportAnalyticsModule(var5, 2, false)
		var8(false)
	end, { var5 })
	local var25 = if var1 == constantsModule.ReportSteps.COMPLETE then reactModule.useCallback(function()
		-- upvalues: chatLineReportAnalyticsModule (copy), var5 (ref), var8 (ref)
		chatLineReportAnalyticsModule(var5, 1, false)
		var8(false)
	end, { var5 }) else var24
	local textButton = reactModule.createElement("TextButton", {
		Active = var20:map(function(p2)
			return p2 == 0
		end),
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundTransparency = var20:map(function(p2)
			return p2 + 0.3
		end),
		BackgroundColor3 = Color3.fromHex("#000000"),
		Text = "",
		Selectable = if fFlagChatLineReportingFocusFixesEnabled then false else nil,
		Size = UDim2.new(1, 0, 1, 0),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		[reactModule.Event.Activated] = var25,
		ZIndex = 10
	}, {
		Frame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = var20:map(function(p2)
				-- upvalues: var9 (ref)
				return if var9 then UDim2.new(0, 0, -p2, 0) else UDim2.new(0, 0, p2, 0)
			end)
		}, {
			ChatLineReportStep = if var1 == constantsModule.ReportSteps.SELECT then reactModule.createElement(chatLineReportSelectionModalOldModule, {
				onContinue = var23,
				onBack = var24,
				messages = p1.messages,
				selectedMessage = var3,
				setSelectedMessage = var4,
				analyticsDispatch = var6
			}) elseif var1 == constantsModule.ReportSteps.SUBMIT then reactModule.createElement(defaultReportDialogModule, {
				analyticsContext = "ReportViaChatLine",
				topCustomComponent = reactModule.createElement(chatLineReportVerbatimModule, { selectedMessage = var3 }),
				onSubmitProps = {
					hasNextSteps = true,
					onProceedToNextStep = reactModule.useCallback(function(p2, p3)
						-- upvalues: fFlagEnableChatReportingTextChannelTag (copy), buildReportModule (copy), playersService (copy), var3 (ref), cryoModule (copy), p1 (ref), isSystemMessageModule (copy), var6 (ref), constantsModule (copy), var2 (ref)
						local t = {}
						local var26 = if fFlagEnableChatReportingTextChannelTag then buildReportModule(playersService.LocalPlayer.UserId, var3.userId, p2, p3, var3.messageId, var3.presetId, var3.presetChatVersion, if var3.textChannel then var3.textChannel.Name else nil) else buildReportModule(playersService.LocalPlayer.UserId, var3.userId, p2, p3, var3.messageId, var3.presetId, var3.presetChatVersion)
						cryoModule.Dictionary.map(p1.messages, function(p4)
							-- upvalues: isSystemMessageModule (copy), t (ref)
							if not isSystemMessageModule(p4) then
								t[#t + 1] = { channel = p4.textChannel, messageId = p4.messageId }
							end
						end)
						local list = {
							{ channel = var3.textChannel, messageId = var3.messageId }
						}
						var6({
							type = constantsModule.AnalyticsActions.SetReasonSelection,
							reason_selection = p2
						})
						var6({
							type = constantsModule.AnalyticsActions.SetCommentAdded,
							comment_added = #p3 > 0
						})
						playersService:ReportChatAbuse(t, list, var26)
						var2(constantsModule.ReportSteps.COMPLETE)
						
						return true
					end, { p1.messages, var3 })
				},
				localizationKeys = if fFlagGenericAbuseReportingGranularExports then constantsModule.SubmitDialogLocalizationKeys else constantsModule.GenericAbuseReportingLocalizationKeys,
				onCloseProps = {
					hasPreviousSteps = true,
					onBackToPreviousStep = reactModule.useCallback(function()
						-- upvalues: var2 (ref), constantsModule (copy), var4 (ref)
						var2(constantsModule.ReportSteps.SELECT)
						var4(nil)
					end)
				},
				reportCategories = reportCategoriesModule,
				onBeforeSubmitAnalytics = function(p2)
					return p2
				end
			}) elseif var1 == constantsModule.ReportSteps.COMPLETE then reactModule.createElement(chatLineReportCompleteModalModule, {
				localizationKeys = if fFlagGenericAbuseReportingGranularExports then constantsModule.CompleteDialogLocalizationKeys else constantsModule.GenericAbuseReportingLocalizationKeys,
				onDismiss = reactModule.useCallback(function(p2)
					-- upvalues: chatLineReportAnalyticsModule (copy), var5 (ref), var14 (ref), var16 (ref), var12 (ref), var8 (ref)
					if p2 then
						chatLineReportAnalyticsModule(var5, 1, true)
						var14(p2)
						var16(p2.args.RBX_NAME)
						var12(true)
						var8(false)
						
						return
					end
					chatLineReportAnalyticsModule(var5, 1, false)
					var8(false)
				end, { var5 }),
				selectedMessage = var3
			}) else nil
		})
	})
	
	return if fFlagChatLineReportingFocusFixesEnabled then reactModule.createElement(focusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		eventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), var25 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2)
						-- upvalues: var25 (copy)
						var25()
						p2:cancel()
					end)
				}
			}
		end, { var25 }),
		eventMap = t_1,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp
	}, { ChatLineReportStepHandler = textButton }) else textButton
end