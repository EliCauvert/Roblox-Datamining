local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ChatUIPrimitivesModule = require(Parent.ChatUIPrimitives)
local ExpChatPerfTracker = ChatUIPrimitivesModule.Telemetry.ExpChatPerfTracker
local InputTypeConstants = require(Parent.InputType).InputTypeConstants
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local ChatInputBoxDisabledModule = require(Parent.AppChat.ChatInputBoxDisabled)
local _ = require(Parent.AppChat.ConversationChannels)
local CreateConversationFromFriendPlaceholderModule = require(Parent.AppChat.createConversationFromFriendPlaceholder)
local MessageCharacterLimitModule = require(Parent.AppChat.MessageCharacterLimit)
local GetConversationMessageStoreModule = require(Parent.AppChat.GetConversationMessageStore)
local GetConversationMessageListStoreModule = require(Parent.AppChat.GetConversationMessageListStore)
local IngestNewerMessagesModule = require(Parent.AppChat.ingestNewerMessages)
local ChatConversationTelemetryLayerModule = require(Parent.AppChat.ChatConversationTelemetryLayer)
local ChatConversationTelemetryEventsModule = require(Parent.AppChat.ChatConversationTelemetryEvents)
local SendMessageErrorModule = require(Parent.AppChat.SendMessageError)
local UseChatTimeoutDetailsFromHydrationModule = require(Parent.AppChat.useChatTimeoutDetailsFromHydration)
local UseTelemetryModule = require(Parent.AppChat.useTelemetry)
local InterventionSharedModule = require(Parent.InterventionShared)
local ChatInputBoxDisabledPressedSignal = InterventionSharedModule.Signals.chatInputBoxDisabledPressedSignal
local InterventionTreatmentShownSignal = InterventionSharedModule.Signals.interventionTreatmentShownSignal
local Constants = InterventionSharedModule.Utils.Constants
local FFlagFriendsChatEnforceInputCharacterLimitModule = require(FriendsChat.Flags.FFlagFriendsChatEnforceInputCharacterLimit)
local FFlagAppChatReactiveFeatureRestrictions = require(Parent.SharedFlags).FFlagAppChatReactiveFeatureRestrictions
local FFlagExpChatComposerFigmaParity = require(Parent.SharedFlags).FFlagExpChatComposerFigmaParity
local FFlagAppChatUniversalFeatureRestriction = require(Parent.SharedFlags).FFlagAppChatUniversalFeatureRestriction
local FFlagExpChatTabShortcutNav = require(Parent.SharedFlags).FFlagExpChatTabShortcutNav
local ExpChatConversationListAdapterModule = require(script.Parent.Parent.ConversationList.ExpChatConversationListAdapter)
local GetFriendsChatNavigationStoreModule = require(FriendsChat.Stores.GetFriendsChatNavigationStore)
local UseConsumeFocusInputBarRequestModule = require(script.Parent.useConsumeFocusInputBarRequest)
local UseFocusConversationInputModule = require(script.Parent.useFocusConversationInput)
local UseFocusBackButtonOnUpModule = require(script.Parent.useFocusBackButtonOnUp)
local FFlagFriendsChatConversationListFocusNav = require(Parent.SharedFlags).FFlagFriendsChatConversationListFocusNav
local GetConversationInputPlaceholderModule = require(script.Parent.getConversationInputPlaceholder)
local ResolveFadeModule = require(script.Parent.Parent.Utils.resolveFade)
local UseInExperienceLocalizationFunction = ChatUIPrimitivesModule.Hooks.useInExperienceLocalization
local LayoutConstantsModule = require(FriendsChat.LayoutConstants)
local GetConversationMessageSentInfoModule = require(script.Parent.Parent.Telemetry.ChatConversation.getConversationMessageSentInfo)
local FFlagFriendsChatMessageSendPerfTrackingModule = require(FriendsChat.Flags.FFlagFriendsChatMessageSendPerfTracking)
local FriendsChatTabNameModule = require(FriendsChat.FriendsChatTabName)
local SerializeParticipantIdsForTelemetryModule = require(script.Parent.Parent.Telemetry.App.serializeParticipantIdsForTelemetry)
local ChatInputBarView = ChatUIPrimitivesModule.ChatInputBarView
local UseChatInputBarSettingsModule = require(Parent.ExpChatIntegration.useChatInputBarSettings)
local UseChatInputBarOnFocusModule = require(Parent.ExpChatIntegration.useChatInputBarOnFocus)
local UseChatWindowSettingsModule = require(Parent.ExpChatIntegration.useChatWindowSettings)
local UseInterpolatedClientSettingsModule = require(Parent.ExpChatIntegration.useInterpolatedClientSettings)
local NewResult = require(Parent.ExpChatShared).Logger:new(script.Name)
local Autocomplete = { commands = nil, emojis = true }

local function isSendResponseAccepted(p1): boolean --[[ Line: 105 ]]
	if p1 == nil or p1.responseBody == nil then
		return false
	elseif p1.responseCode ~= nil and p1.responseCode ~= 200 then
		return false
	elseif p1.StatusCode ~= nil and p1.StatusCode ~= 200 then
		return false
	else
		local Messages = p1.responseBody.messages
		
		if Messages == nil or #Messages == 0 then
			return false
		else
			local Status = Messages[1].status
			
			return Status == nil or (Status == "" or Status == "success")
		end
	end
end

return function(Frame) --[[ Line: 125 | Named "FriendsChatInputBarHost" ]]
	-- upvalues: FoundationModule (copy), ExpChatConversationListAdapterModule (copy), UseChatTimeoutDetailsFromHydrationModule (copy), SignalsReactModule (copy), UseChatWindowSettingsModule (copy), ReactModule (copy), UseChatInputBarSettingsModule (copy), UseInExperienceLocalizationFunction (copy), ChatUIPrimitivesModule (copy), InputTypeConstants (copy), GetConversationInputPlaceholderModule (copy), UserInputService (copy), UseLocalizationFunction (copy), UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), UseInterpolatedClientSettingsModule (copy), UseChatInputBarOnFocusModule (copy), GetFriendsChatNavigationStoreModule (copy), FFlagFriendsChatConversationListFocusNav (copy), UseFocusConversationInputModule (copy), UseConsumeFocusInputBarRequestModule (copy), FFlagExpChatTabShortcutNav (copy), UseFocusBackButtonOnUpModule (copy), InterventionTreatmentShownSignal (copy), Constants (copy), HttpService (copy), FFlagFriendsChatMessageSendPerfTrackingModule (copy), ExpChatPerfTracker (copy), FriendsChatTabNameModule (copy), Players (copy), NewResult (copy), CreateConversationFromFriendPlaceholderModule (copy), GetConversationMessageStoreModule (copy), GetConversationMessageListStoreModule (copy), SerializeParticipantIdsForTelemetryModule (copy), AppChatNetworkingModule (copy), ChatConversationTelemetryEventsModule (copy), GetConversationMessageSentInfoModule (copy), isSendResponseAccepted (copy), SignalsExperimentalModule (copy), IngestNewerMessagesModule (copy), SendMessageErrorModule (copy), FFlagAppChatUniversalFeatureRestriction (copy), Parent (copy), FFlagAppChatReactiveFeatureRestrictions (copy), InterventionSharedModule (copy), ChatInputBoxDisabledPressedSignal (copy), ChatInputBoxDisabledModule (copy), ResolveFadeModule (copy), LayoutConstantsModule (copy), ChatInputBarView (copy), FFlagExpChatComposerFigmaParity (copy), Autocomplete (copy), FFlagFriendsChatEnforceInputCharacterLimitModule (copy), MessageCharacterLimitModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local ConversationId = Frame.conversationId
	local IsFriendPlaceholder = ExpChatConversationListAdapterModule.isFriendPlaceholder(ConversationId)
	local NoIsFriendPlaceholder: boolean = ConversationId ~= nil and (ConversationId ~= "" and not IsFriendPlaceholder)
	local UseSignalStateResult = SignalsReactModule.useSignalState((UseChatTimeoutDetailsFromHydrationModule({
		conversationId = if NoIsFriendPlaceholder then ConversationId else nil,
		conversationModerationType = Frame.conversationModerationType
	})))
	local IsTimedOut = UseSignalStateResult.isTimedOut
	local UseChatWindowSettingsModuleResult = UseChatWindowSettingsModule()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 141 ]]
		-- upvalues: UseChatWindowSettingsModuleResult (copy)
		return {
			BackgroundColor3 = UseChatWindowSettingsModuleResult.ChatWindowBackgroundColor3,
			BackgroundTransparency = UseChatWindowSettingsModuleResult.ChatWindowBackgroundTransparency
		}
	end, { UseChatWindowSettingsModuleResult })
	local NoIsTimedOut = not IsTimedOut
	local UseChatInputBarSettingsModuleResult = UseChatInputBarSettingsModule()
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 152 ]]
		-- upvalues: Frame (copy), UseChatInputBarSettingsModuleResult (copy)
		return if Frame.isSpatialUIEnabled and UseChatInputBarSettingsModuleResult and UseChatInputBarSettingsModuleResult.SpatialPanelTextSize then UseChatInputBarSettingsModuleResult.SpatialPanelTextSize elseif UseChatInputBarSettingsModuleResult then UseChatInputBarSettingsModuleResult.TextSize else nil
	end, {
		UseChatInputBarSettingsModuleResult,
		Frame.isSpatialUIEnabled
	})
	local UseInExperienceLocalizationResult = UseInExperienceLocalizationFunction()
	local UseLastInputGroupResult = ChatUIPrimitivesModule.Hooks.useLastInputGroup()
	local IsUseLastInputGroupResultMatch = UseLastInputGroupResult == InputTypeConstants.Touch
	local IsUseLastInputGroupResultMatch1 = UseLastInputGroupResult == InputTypeConstants.Gamepad
	local KeyboardKeyCode = if UseChatInputBarSettingsModuleResult and UseChatInputBarSettingsModuleResult.KeyboardKeyCode then UseChatInputBarSettingsModuleResult.KeyboardKeyCode else Enum.KeyCode.Slash
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 174 ]]
		-- upvalues: GetConversationInputPlaceholderModule (upval), IsUseLastInputGroupResultMatch1 (copy), IsUseLastInputGroupResultMatch (copy), KeyboardKeyCode (copy), UseInExperienceLocalizationResult (copy), UserInputService (upval)
		return GetConversationInputPlaceholderModule({
			isGamepad = IsUseLastInputGroupResultMatch1,
			isTouch = IsUseLastInputGroupResultMatch
		}, KeyboardKeyCode, UseInExperienceLocalizationResult, UserInputService)
	end, {
		IsUseLastInputGroupResultMatch1,
		IsUseLastInputGroupResultMatch,
		KeyboardKeyCode,
		UseInExperienceLocalizationResult
	})
	local CoreScriptsTextChatInputBarHintPrivacySettingsDisabled = UseInExperienceLocalizationResult("CoreScripts.TextChat.InputBar.Hint.PrivacySettingsDisabled")
	local UseLocalizationResult = UseLocalizationFunction({ timeoutDisabled = "Feature.Chat.Label.ChatDisabled" })
	local UseTelemetryModuleResult = UseTelemetryModule(ChatConversationTelemetryLayerModule.Context)
	local UseRefResult = ReactModule.useRef(UseTelemetryModuleResult.emit)
	UseRefResult.current = UseTelemetryModuleResult.emit
	local UseInterpolatedClientSettingsModuleResult = UseInterpolatedClientSettingsModule(Frame.chatWindowSettings or UseMemoResult)
	local UseChatInputBarOnFocusModuleResult = UseChatInputBarOnFocusModule()
	local FriendsChatNavigationStoreModule = GetFriendsChatNavigationStoreModule(false)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 206 ]]
		-- upvalues: FFlagFriendsChatConversationListFocusNav (upval), FriendsChatNavigationStoreModule (copy), UseChatInputBarOnFocusModuleResult (copy)
		if not FFlagFriendsChatConversationListFocusNav then
			FriendsChatNavigationStoreModule.setInputBarFocused(true)
		end
		UseChatInputBarOnFocusModuleResult.onFocusGained()
	end, {
		UseChatInputBarOnFocusModuleResult.onFocusGained,
		FriendsChatNavigationStoreModule
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 212 ]]
		-- upvalues: FFlagFriendsChatConversationListFocusNav (upval), FriendsChatNavigationStoreModule (copy), UseChatInputBarOnFocusModuleResult (copy)
		if not FFlagFriendsChatConversationListFocusNav then
			FriendsChatNavigationStoreModule.setInputBarFocused(false)
		end
		UseChatInputBarOnFocusModuleResult.onFocusLost()
	end, {
		UseChatInputBarOnFocusModuleResult.onFocusLost,
		FriendsChatNavigationStoreModule
	})
	local UseFocusConversationInputModuleResult = UseFocusConversationInputModule(Frame.rootRef, NoIsTimedOut)
	local Ref = UseFocusConversationInputModuleResult.ref
	UseConsumeFocusInputBarRequestModule(UseFocusConversationInputModuleResult.focus)
	
	if FFlagExpChatTabShortcutNav then
		ChatUIPrimitivesModule.Hooks.useInputBarTabNavigation(Ref)
	end
	if FFlagFriendsChatConversationListFocusNav then
		UseFocusBackButtonOnUpModule(Ref, Frame.backButtonRef)
	end
	local UseCursorResult = if FFlagFriendsChatConversationListFocusNav then FoundationModule.Hooks.useCursor(FoundationModule.Enums.CursorType.RoundedRect) else nil
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 242 ]]
		-- upvalues: Ref (copy)
		local Current = Ref.current
		
		if Current then
			Current:ReleaseFocus()
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 253 ]]
		-- upvalues: UseResult1 (copy)
		return function() --[[ Line: 254 ]]
			-- upvalues: UseResult1 (upval)
			UseResult1()
		end
	end, { UseResult1 })
	ReactModule.useEffect(function() --[[ Line: 259 ]]
		-- upvalues: InterventionTreatmentShownSignal (upval), Constants (upval), Ref (copy)
		local Connection = InterventionTreatmentShownSignal:connect(function(PartyChatNudgeDialog) --[[ Line: 260 ]]
			-- upvalues: Constants (upval), Ref (upval)
			if PartyChatNudgeDialog == Constants.TreatmentType.PartyChatNudgeDialog or PartyChatNudgeDialog == Constants.TreatmentType.PartyChatTimeoutDialog then
				local Current = Ref.current
				
				if Current then
					Current:ReleaseFocus()
				end
			end
		end)
		
		return function() --[[ Line: 271 ]]
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 454 ]]
		-- upvalues: FFlagAppChatUniversalFeatureRestriction (upval), Parent (upval), UseResult2 (copy), FFlagAppChatReactiveFeatureRestrictions (upval), InterventionSharedModule (upval), ChatInputBoxDisabledPressedSignal (upval), UseSignalStateResult (copy)
		if not FFlagAppChatUniversalFeatureRestriction then
			ChatInputBoxDisabledPressedSignal:fire({
				endTimestamp = UseSignalStateResult.timeoutEndTimestamp,
				decisionEventId = UseSignalStateResult.decisionEventId,
				duration = UseSignalStateResult.duration
			})
			
			return
		end
		local AbuseVectorModule = require(Parent.UniversalFeatureRestrictions.AbuseVector)
		local ShowFeatureRestrictionModule: (any, any) -> () = require(Parent.UniversalFeatureRestrictions.showFeatureRestriction)
		local config = {
			onShown = UseResult2,
			onAppeal = function() --[[ Line: 460 ]] end
		}
		
		if FFlagAppChatReactiveFeatureRestrictions then
			local PartyChatTimeoutReceivedSignal = InterventionSharedModule.Signals.partyChatTimeoutReceivedSignal
			
			function config.onAcknowledgementSuccess() --[[ Line: 464 ]]
				-- upvalues: PartyChatTimeoutReceivedSignal (copy)
				PartyChatTimeoutReceivedSignal:fire(nil)
			end
		end
		ShowFeatureRestrictionModule(AbuseVectorModule.PartyChat, config)
	end, {
		UseResult2,
		UseSignalStateResult.timeoutEndTimestamp,
		UseSignalStateResult.decisionEventId,
		UseSignalStateResult.duration
	})
	local UseMemoResult1_1 = UseMemoResult1 or UseTokensResult.Typography.CaptionMedium.FontSize
	local Largest = math.max(UseTokensResult.Typography.CaptionMedium.LineHeight, UseMemoResult1_1)
	
	return ReactModule.createElement("Frame", {
		Name = "friendsChatInput",
		LayoutOrder = Frame.LayoutOrder,
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = UseInterpolatedClientSettingsModuleResult.BackgroundColor3 or UseChatWindowSettingsModuleResult.ChatWindowBackgroundColor3,
		BackgroundTransparency = ResolveFadeModule(UseInterpolatedClientSettingsModuleResult.BackgroundTransparency, Frame.transparencyValue),
		Active = true,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Size = UDim2.fromScale(1, 0),
		[ReactModule.Event.MouseEnter] = Frame.onHovered,
		[ReactModule.Event.MouseLeave] = Frame.onUnhovered,
		ref = Frame.rootRef
	}, {
		bottomCorner = ReactModule.createElement("UICorner", {
			BottomLeftRadius = UDim.new(0, LayoutConstantsModule.PanelBottomCornerRadius),
			BottomRightRadius = UDim.new(0, LayoutConstantsModule.PanelBottomCornerRadius),
			TopLeftRadius = UDim.new(0, 0),
			TopRightRadius = UDim.new(0, 0)
		}),
		padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, LayoutConstantsModule.InputBarTopPadding),
			PaddingBottom = UDim.new(0, LayoutConstantsModule.InputBarBottomPadding + LayoutConstantsModule.PanelBottomCornerRadius),
			PaddingLeft = UDim.new(0, LayoutConstantsModule.InputBarSidePadding),
			PaddingRight = UDim.new(0, LayoutConstantsModule.InputBarSidePadding)
		}),
		inputBar = ReactModule.createElement(ChatInputBarView, {
			showSideChip = false,
			onSend = ReactModule.useCallback(function(p1) --[[ Line: 277 ]]
				-- upvalues: IsTimedOut (copy), HttpService (upval), FFlagFriendsChatMessageSendPerfTrackingModule (upval), ExpChatPerfTracker (upval), FriendsChatTabNameModule (upval), ConversationId (copy), Players (upval), IsFriendPlaceholder (copy), ExpChatConversationListAdapterModule (upval), NewResult (upval), CreateConversationFromFriendPlaceholderModule (upval), Frame (copy), NoIsFriendPlaceholder (copy), GetConversationMessageStoreModule (upval), GetConversationMessageListStoreModule (upval), SerializeParticipantIdsForTelemetryModule (upval), AppChatNetworkingModule (upval), UseRefResult (copy), ChatConversationTelemetryEventsModule (upval), GetConversationMessageSentInfoModule (upval), isSendResponseAccepted (upval), SignalsExperimentalModule (upval), IngestNewerMessagesModule (upval), SendMessageErrorModule (upval)
				if IsTimedOut then return end
				local Text = if typeof(p1) == "string" then p1 else ""
				
				if Text ~= "" then
					local Text1 = "sending-friends-message-" .. HttpService:GenerateGUID(false)
					local StartResult = if FFlagFriendsChatMessageSendPerfTrackingModule then ExpChatPerfTracker.start(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = Text1 }, { tabName = FriendsChatTabNameModule }) else false
					task.spawn(function() --[[ Line: 306 ]]
						-- upvalues: ConversationId (upval), Players (upval), IsFriendPlaceholder (upval), StartResult (ref), ExpChatPerfTracker (upval), Text1 (copy), ExpChatConversationListAdapterModule (upval), NewResult (upval), CreateConversationFromFriendPlaceholderModule (upval), Frame (upval), NoIsFriendPlaceholder (upval), GetConversationMessageStoreModule (upval), GetConversationMessageListStoreModule (upval), Text (copy), SerializeParticipantIdsForTelemetryModule (upval), AppChatNetworkingModule (upval), UseRefResult (upval), ChatConversationTelemetryEventsModule (upval), GetConversationMessageSentInfoModule (upval), isSendResponseAccepted (upval), SignalsExperimentalModule (upval), IngestNewerMessagesModule (upval), SendMessageErrorModule (upval)
						local ConversationId1 = ConversationId or ""
						local LocalPlayer = Players.LocalPlayer
						
						if IsFriendPlaceholder and ConversationId ~= nil then
							if StartResult then
								ExpChatPerfTracker.cancel(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = Text1 })
							end
							local Conversation = ExpChatConversationListAdapterModule.getConversationStore().getConversation(ConversationId, false)
							
							if Conversation == nil then
								NewResult:warning(`Unable to find friend placeholder {ConversationId}`)
								
								return
							end
							local ConversationFromFriendPlaceholderModule = CreateConversationFromFriendPlaceholderModule(Conversation, if LocalPlayer then LocalPlayer.UserId else 0)
							
							if ConversationFromFriendPlaceholderModule == nil then
								NewResult:warning(`Unable to create conversation for friend placeholder {ConversationId}`)
								
								return
							end
							local v1, v2 = ConversationFromFriendPlaceholderModule:await()
							
							if not v1 or v2 == nil then
								NewResult:warning(`Failed to create conversation for friend placeholder {ConversationId}`)
								
								return
							end
							ConversationId1 = v2.id
							
							if Frame.onFriendPlaceholderConversationCreated ~= nil then
								Frame.onFriendPlaceholderConversationCreated(ConversationId1)
							end
						elseif not NoIsFriendPlaceholder then
							if StartResult then
								ExpChatPerfTracker.cancel(ExpChatPerfTracker.Events.MessageSendToWindowRenderInterval, { messageId = Text1 })
							end
							return
						end
						local ConversationMessageStoreModule = GetConversationMessageStoreModule(false)
						local ConversationMessageListStoreModule = GetConversationMessageListStoreModule(false)
						ConversationMessageStoreModule.upsertMessages({
							[Text1] = {
								type = "user",
								status = "Pending",
								id = Text1,
								content = Text,
								created_at = tostring(os.time()),
								sender_user_id = if LocalPlayer then LocalPlayer.UserId else nil,
								conversationId = ConversationId1
							}
						})
						ConversationMessageListStoreModule.prependMessages(ConversationId1, { Text1 })
						local Repeated = string.rep("#", utf8.len(Text) or #Text)
						local Conversation = ExpChatConversationListAdapterModule.getConversationStore().getConversation(ConversationId1, false)
						local SerializeParticipantIdsForTelemetryModuleResult = SerializeParticipantIdsForTelemetryModule(if Conversation then Conversation.participants else nil, if LocalPlayer then LocalPlayer.UserId else 0)
						AppChatNetworkingModule.http.SendChatTextMessage(nil, ConversationId1, Text):andThen(function(Result) --[[ Line: 387 ]]
							-- upvalues: UseRefResult (upval), ChatConversationTelemetryEventsModule (upval), GetConversationMessageSentInfoModule (upval), SerializeParticipantIdsForTelemetryModuleResult (copy), isSendResponseAccepted (upval), ConversationMessageStoreModule (copy), Text1 (upval), Repeated (copy), SignalsExperimentalModule (upval), IngestNewerMessagesModule (upval), ConversationId1 (ref), ExpChatConversationListAdapterModule (upval), LocalPlayer (copy), ConversationMessageListStoreModule (copy)
							UseRefResult.current(ChatConversationTelemetryEventsModule.ConversationMessageSent, GetConversationMessageSentInfoModule(Result, SerializeParticipantIdsForTelemetryModuleResult))
							
							if isSendResponseAccepted(Result) then
								local Messages = Result.responseBody.messages or {}
								SignalsExperimentalModule.batch(function() --[[ Line: 404 ]]
									-- upvalues: IngestNewerMessagesModule (upval), ConversationId1 (upval), Messages (copy), ConversationMessageStoreModule (upval), Text1 (upval), Repeated (upval), ExpChatConversationListAdapterModule (upval), LocalPlayer (upval), ConversationMessageListStoreModule (upval)
									if #IngestNewerMessagesModule(ConversationId1, Messages) == 0 then
										ConversationMessageStoreModule.updateMessage(Text1, { status = "Failed", content = Repeated })
										
										return
									else
										ExpChatConversationListAdapterModule.updateConversationPreviewFromMessages(ConversationId1, Messages, {
											hasUnreadMessages = false,
											localUserId = if LocalPlayer then LocalPlayer.UserId else 0
										})
										ConversationMessageListStoreModule.removeMessage(ConversationId1, Text1)
										ConversationMessageStoreModule.removeMessage(Text1)
									end
								end)
								
								return
							else
								ConversationMessageStoreModule.updateMessage(Text1, { status = "Failed", content = Repeated })
							end
						end):catch(function(Err) --[[ Line: 429 ]]
							-- upvalues: NewResult (upval), ConversationId1 (ref), UseRefResult (upval), ChatConversationTelemetryEventsModule (upval), SendMessageErrorModule (upval), SerializeParticipantIdsForTelemetryModuleResult (copy), ConversationMessageStoreModule (copy), Text1 (upval), Repeated (copy)
							NewResult:warning(`Failed to send message to {ConversationId1}: {tostring(Err)}`)
							UseRefResult.current(ChatConversationTelemetryEventsModule.ConversationMessageSent, {
								messageSentResult = SendMessageErrorModule.OtherFailure,
								recipientIds = SerializeParticipantIdsForTelemetryModuleResult
							})
							ConversationMessageStoreModule.updateMessage(Text1, { status = "Failed", content = Repeated })
						end)
					end)
					
					return
				end
			end, {
				ConversationId,
				NoIsFriendPlaceholder,
				IsFriendPlaceholder,
				IsTimedOut,
				Frame.onFriendPlaceholderConversationCreated
			}),
			canLocalUserChat = NoIsTimedOut or false,
			composerLayout = FFlagExpChatComposerFigmaParity,
			disabledOverlay = if IsTimedOut then ReactModule.createElement(FoundationModule.View, {
				tag = "auto-y",
				Size = UDim2.fromScale(1, 0),
				padding = {
					top = UDim.new(0, UseMemoResult1_1 / 2),
					bottom = UDim.new(0, UseMemoResult1_1 / 2),
					left = UDim.new(0, UseTokensResult.Padding.Large),
					right = UDim.new(0, UseTokensResult.Padding.XSmall)
				}
			}, {
				TimeoutContent = ReactModule.createElement("CanvasGroup", {
					BackgroundTransparency = 1,
					ZIndex = 5,
					GroupTransparency = Frame.transparencyValue or 0,
					Size = UDim2.new(1, 0, 0, Largest)
				}, {
					DisabledInput = ReactModule.createElement(ChatInputBoxDisabledModule, {
						bodyText = UseLocalizationResult.timeoutDisabled,
						contentSize = UseMemoResult1_1,
						endTimestamp = UseSignalStateResult.timeoutEndTimestamp,
						font = Enum.Font.BuilderSans,
						onActivated = UseResult3,
						contentVerticalAlignment = Enum.VerticalAlignment.Center
					})
				})
			}) else nil,
			textSize = UseMemoResult1,
			textBoxRef = Ref,
			selectionImageObject = UseCursorResult,
			placeholderText = UseMemoResult2,
			disabledChatPlaceholderText = CoreScriptsTextChatInputBarHintPrivacySettingsDisabled,
			autocomplete = Autocomplete,
			transparencyValue = Frame.transparencyValue,
			onFocusGained = UseResult,
			onFocusLost = UseResult1,
			maximumCharacterLimit = if FFlagFriendsChatEnforceInputCharacterLimitModule then MessageCharacterLimitModule else nil
		})
	})
end