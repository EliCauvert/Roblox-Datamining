local ChatLineReporting = script:FindFirstAncestor("ChatLineReporting")
local Players = game:GetService("Players")
local Parent = ChatLineReporting.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local ReactOtterModule = require(Parent.ReactOtter)
local GuiService = game:GetService("GuiService")
local DefaultReportDialogModule = require(Parent.GenericAbuseReporting.DefaultReportDialog)
local NotificationModalsManagerModule = require(Parent.NotificationModalsManager)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local Images = require(Parent.UIBlox).App.ImageSet.Images
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ConstantsModule = require(ChatLineReporting.Common.Constants)
local AnalyticsReducerModule = require(ChatLineReporting.Common.AnalyticsReducer)
local ChatLineReportAnalyticsModule = require(ChatLineReporting.Common.ChatLineReportAnalytics)
local BuildReportModule = require(ChatLineReporting.Common.buildReport)
local IsSystemMessageModule = require(ChatLineReporting.Common.isSystemMessage)
local ChatLineReportSelectionModalOldModule = require(ChatLineReporting.Components.ChatLineReportSelectionModalOld)
local ChatLineReportVerbatimModule = require(ChatLineReporting.Components.ChatLineReportVerbatim)
local ChatLineReportCompleteModalModule = require(ChatLineReporting.Components.ChatLineReportCompleteModal)
local ReportCategoriesModule = require(ChatLineReporting.Common.ReportCategories)
local SSUIMetaLuaEngineFeature = game:GetEngineFeature("SSUIMetaLua")
local FFlagEnableGlobalChatAbuseReporting = require(Parent.SharedFlags).FFlagEnableGlobalChatAbuseReporting
local FFlagGenericAbuseReportingGranularExports = require(Parent.SharedFlags).FFlagGenericAbuseReportingGranularExports
local FFlagEnableChatReportingTextChannelTag = require(Parent.SharedFlags).FFlagEnableChatReportingTextChannelTag
local config = { stiffness = 400, damping = 40, mass = 1 }
local EventMap = {
	[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack,
	[Enum.KeyCode.Escape] = FocusNavigationEventNameEnum.NavigateBack
}

return function(p1)
	-- upvalues: ReactModule (copy), ConstantsModule (copy), AnalyticsReducerModule (copy), GuiService (copy), UseLocalizationFunction (copy), UseTokensFunction (copy), IsSystemMessageModule (copy), FFlagEnableGlobalChatAbuseReporting (copy), SSUIMetaLuaEngineFeature (copy), ReactOtterModule (copy), NotificationModalsManagerModule (copy), Images (copy), config (copy), ChatLineReportAnalyticsModule (copy), FFlagEnableChatReportingTextChannelTag (copy), BuildReportModule (copy), Players (copy), CryoModule (copy), ChatLineReportSelectionModalOldModule (copy), DefaultReportDialogModule (copy), ChatLineReportVerbatimModule (copy), FFlagGenericAbuseReportingGranularExports (copy), ReportCategoriesModule (copy), ChatLineReportCompleteModalModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), FocusRoot (copy), EventMap (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(ConstantsModule.ReportSteps.SELECT)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseReducerResult, UseReducerResult2 = ReactModule.useReducer(AnalyticsReducerModule, ConstantsModule.AnalyticsInitialState)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(not GuiService.MenuIsOpen)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(GuiService.MenuIsOpen)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(false)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(nil)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState("")
	local UseLocalizationResult = UseLocalizationFunction(ConstantsModule.ChatLineLocalizationKeys)
	local UseLocalizationResult1 = UseLocalizationFunction({
		ChatToastTitleSuccess = {
			"Feature.ReportAbuse.Label.UserTextMuted",
			name = UseStateResult7
		},
		ChatToastTitleError = {
			"Feature.ReportAbuse.Label.UserTextMutedError",
			name = UseStateResult7
		},
		ChatToastDescriptionErrorDoesNotExist = {
			"Feature.ReportAbuse.Message.UserTextMutedErrorDoesNotExist",
			name = UseStateResult7
		}
	})
	local UseTokensResult = UseTokensFunction()
	ReactModule.useEffect(function()
		-- upvalues: UseReducerResult2 (copy), ConstantsModule (upval), p1 (copy), IsSystemMessageModule (upval), FFlagEnableGlobalChatAbuseReporting (upval), GuiService (upval), UseStateResult2_3 (copy), UseStateResult2_2 (copy)
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.AccumulateForTimeSpent,
			accumulated_time_ms = workspace:GetServerTimeNow() * 1000
		})
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.SetPlaceId,
			place_id = game.PlaceId
		})
		local ViewportSize = game.Workspace.CurrentCamera.ViewportSize
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.SetViewportInformation,
			viewport_size_x = ViewportSize.X,
			viewport_size_y = ViewportSize.Y,
			is_portrait_mode = ViewportSize.X < ViewportSize.Y and ViewportSize.X < 800
		})
		local Selectable_chat_history_size = 0
		local Num_non_general_channel_chats = 0
		
		for _, message in ipairs(p1.messages) do
			if not IsSystemMessageModule(message) then
				Selectable_chat_history_size += 1
				
				if if FFlagEnableGlobalChatAbuseReporting then message.textChannel and message.textChannel.Name ~= ConstantsModule.ChannelTypes.General else message.textChannel.Name ~= ConstantsModule.ChannelTypes.General then
					Num_non_general_channel_chats += 1
				end
			end
		end
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.SetChatHistoryInformation,
			selectable_chat_history_size = Selectable_chat_history_size,
			total_chat_history_size = #p1.messages,
			num_non_general_channel_chats = Num_non_general_channel_chats
		})
		local MenuOpenedConnection = GuiService.MenuOpened:Connect(function()
			-- upvalues: UseStateResult2_3 (upval), UseStateResult2_2 (upval)
			UseStateResult2_3(true)
			UseStateResult2_2(false)
		end)
		local MenuClosedConnection = GuiService.MenuClosed:Connect(function()
			-- upvalues: UseStateResult2_3 (upval), UseStateResult2_2 (upval)
			UseStateResult2_3(false)
			UseStateResult2_2(true)
		end)
		
		return function()
			-- upvalues: MenuOpenedConnection (copy), MenuClosedConnection (copy)
			MenuOpenedConnection:Disconnect()
			MenuClosedConnection:Disconnect()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: SSUIMetaLuaEngineFeature (upval), UseStateResult3 (copy)
		if SSUIMetaLuaEngineFeature then
			pcall(function()
				-- upvalues: UseStateResult3 (upval)
				local SafetyService = game:GetService("SafetyService")
				
				if UseStateResult3 then
					SafetyService:ReportChatLineReportingOpen()
					
					return
				else
					SafetyService:ReportChatLineReportingClose()
				end
			end)
		end
	end, { UseStateResult3 })
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1, function()
		-- upvalues: UseStateResult3 (copy), UseStateResult5 (copy), UseStateResult6 (copy), ConstantsModule (upval), NotificationModalsManagerModule (upval), Images (upval), UseLocalizationResult1 (copy), UseLocalizationResult (copy), UseTokensResult (copy), p1 (copy)
		if not UseStateResult3 then
			if UseStateResult5 then
				if UseStateResult6 and UseStateResult6.key == ConstantsModule.SuccessfulMuteKey then
					NotificationModalsManagerModule.SetUIBloxToast({
						iconImage = Images[ConstantsModule.ToastIconImageSuccess],
						toastTitle = UseLocalizationResult1.ChatToastTitleSuccess,
						toastSubtitle = UseLocalizationResult.ChatToastDescriptionSuccess,
						sequenceNumber = DateTime.now().UnixTimestamp,
						iconColorStyle = {
							Transparency = 0,
							Color = UseTokensResult.Color.System.Success.Color3
						}
					})
				elseif UseStateResult6 then
					NotificationModalsManagerModule.SetUIBloxToast({
						iconImage = Images[ConstantsModule.ToastIconImageError],
						toastTitle = UseLocalizationResult1.ChatToastTitleError,
						toastSubtitle = if UseStateResult6.key == ConstantsModule.ErrorSelfMuteKey then UseLocalizationResult.ChatToastDescriptionErrorSelf else UseLocalizationResult1.ChatToastDescriptionErrorDoesNotExist,
						sequenceNumber = DateTime.now().UnixTimestamp,
						iconColorStyle = {
							Transparency = 0,
							Color = UseTokensResult.Color.System.Warning.Color3
						}
					})
				end
			end
			p1.unmount()
		end
	end)
	local UseMemoResult = ReactModule.useMemo(function(): number
		-- upvalues: UseStateResult3 (copy)
		return if UseStateResult3 then 0 else 1
	end, { UseStateResult3 })
	ReactModule.useEffect(function()
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseMemoResult (copy), config (upval)
		UseAnimatedBindingResult2(ReactOtterModule.spring(UseMemoResult, config))
	end, { UseMemoResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult1 (copy), UseStateResult2 (copy), ConstantsModule (upval)
		if UseStateResult1 ~= nil then
			UseStateResult2(ConstantsModule.ReportSteps.SUBMIT)
		end
	end)
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: ChatLineReportAnalyticsModule (upval), UseReducerResult (copy), UseStateResult2_2 (copy)
		ChatLineReportAnalyticsModule(UseReducerResult, 2, false)
		UseStateResult2_2(false)
	end, { UseReducerResult })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), ConstantsModule (upval), UseStateResult2_1 (copy)
		UseStateResult2(ConstantsModule.ReportSteps.SELECT)
		UseStateResult2_1(nil)
	end)
	local UseResult3 = ReactModule.useCallback(function(Reason_selection, p2): boolean
		-- upvalues: FFlagEnableChatReportingTextChannelTag (upval), BuildReportModule (upval), Players (upval), UseStateResult1 (copy), CryoModule (upval), p1 (copy), IsSystemMessageModule (upval), UseReducerResult2 (copy), ConstantsModule (upval), UseStateResult2 (copy)
		local EligibleChatLines = {}
		local ReportModule = if FFlagEnableChatReportingTextChannelTag then BuildReportModule(Players.LocalPlayer.UserId, UseStateResult1.userId, Reason_selection, p2, UseStateResult1.messageId, UseStateResult1.presetId, UseStateResult1.presetChatVersion, if UseStateResult1.textChannel then UseStateResult1.textChannel.Name else nil) else BuildReportModule(Players.LocalPlayer.UserId, UseStateResult1.userId, Reason_selection, p2, UseStateResult1.messageId, UseStateResult1.presetId, UseStateResult1.presetChatVersion)
		CryoModule.Dictionary.map(p1.messages, function(p3)
			-- upvalues: IsSystemMessageModule (upval), EligibleChatLines (copy)
			if not IsSystemMessageModule(p3) then
				EligibleChatLines[#EligibleChatLines + 1] = { channel = p3.textChannel, messageId = p3.messageId }
			end
		end)
		local TargetChatLines = {
			{
				channel = UseStateResult1.textChannel,
				messageId = UseStateResult1.messageId
			}
		}
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.SetReasonSelection,
			reason_selection = Reason_selection
		})
		UseReducerResult2({
			type = ConstantsModule.AnalyticsActions.SetCommentAdded,
			comment_added = #p2 > 0
		})
		Players:ReportChatAbuse(EligibleChatLines, TargetChatLines, ReportModule)
		UseStateResult2(ConstantsModule.ReportSteps.COMPLETE)
		
		return true
	end, { p1.messages, UseStateResult1 })
	local UseResult4 = ReactModule.useCallback(function(p2)
		-- upvalues: ChatLineReportAnalyticsModule (upval), UseReducerResult (copy), UseStateResult2_5 (copy), UseStateResult2_6 (copy), UseStateResult2_4 (copy), UseStateResult2_2 (copy)
		if p2 then
			ChatLineReportAnalyticsModule(UseReducerResult, 1, true)
			UseStateResult2_5(p2)
			UseStateResult2_6(p2.args.RBX_NAME)
			UseStateResult2_4(true)
			UseStateResult2_2(false)
			
			return
		else
			ChatLineReportAnalyticsModule(UseReducerResult, 1, false)
			UseStateResult2_2(false)
		end
	end, { UseReducerResult })
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: ChatLineReportAnalyticsModule (upval), UseReducerResult (copy), UseStateResult2_2 (copy)
		ChatLineReportAnalyticsModule(UseReducerResult, 1, false)
		UseStateResult2_2(false)
	end, { UseReducerResult })
	local Callback = if UseStateResult == ConstantsModule.ReportSteps.COMPLETE then UseResult5 else UseResult1
	
	return ReactModule.createElement(FocusRoot, {
		isAutoFocusRoot = true,
		isIsolated = true,
		eventHandlers = ReactModule.useMemo(function()
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), Callback (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p2)
						-- upvalues: Callback (upval)
						Callback()
						p2:cancel()
					end)
				}
			}
		end, { Callback }),
		eventMap = EventMap,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp
	}, {
		ChatLineReportStepHandler = ReactModule.createElement("TextButton", {
			Active = UseAnimatedBindingResult:map(function(p2): boolean
				return p2 == 0
			end),
			AutoButtonColor = false,
			BorderSizePixel = 0,
			BackgroundTransparency = UseAnimatedBindingResult:map(function(p2: number): number
				return p2 + 0.3
			end),
			BackgroundColor3 = Color3.fromHex("#000000"),
			Text = "",
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			[ReactModule.Event.Activated] = Callback,
			ZIndex = 10
		}, {
			Frame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UseAnimatedBindingResult:map(function(YScale): UDim2
					-- upvalues: UseStateResult4 (copy)
					return if UseStateResult4 then UDim2.new(0, 0, -YScale, 0) else UDim2.new(0, 0, YScale, 0)
				end)
			}, {
				ChatLineReportStep = if UseStateResult == ConstantsModule.ReportSteps.SELECT then ReactModule.createElement(ChatLineReportSelectionModalOldModule, {
					onContinue = UseResult,
					onBack = UseResult1,
					messages = p1.messages,
					selectedMessage = UseStateResult1,
					setSelectedMessage = UseStateResult2_1,
					analyticsDispatch = UseReducerResult2
				}) elseif UseStateResult == ConstantsModule.ReportSteps.SUBMIT then ReactModule.createElement(DefaultReportDialogModule, {
					analyticsContext = "ReportViaChatLine",
					topCustomComponent = ReactModule.createElement(ChatLineReportVerbatimModule, { selectedMessage = UseStateResult1 }),
					onSubmitProps = { hasNextSteps = true, onProceedToNextStep = UseResult3 },
					localizationKeys = if FFlagGenericAbuseReportingGranularExports then ConstantsModule.SubmitDialogLocalizationKeys else ConstantsModule.GenericAbuseReportingLocalizationKeys,
					onCloseProps = {
						hasPreviousSteps = true,
						onBackToPreviousStep = UseResult2
					},
					reportCategories = ReportCategoriesModule,
					onBeforeSubmitAnalytics = function(p2)
						return p2
					end
				}) elseif UseStateResult == ConstantsModule.ReportSteps.COMPLETE then ReactModule.createElement(ChatLineReportCompleteModalModule, {
					localizationKeys = if FFlagGenericAbuseReportingGranularExports then ConstantsModule.CompleteDialogLocalizationKeys else ConstantsModule.GenericAbuseReportingLocalizationKeys,
					onDismiss = UseResult4,
					selectedMessage = UseStateResult1
				}) else nil
			})
		})
	})
end