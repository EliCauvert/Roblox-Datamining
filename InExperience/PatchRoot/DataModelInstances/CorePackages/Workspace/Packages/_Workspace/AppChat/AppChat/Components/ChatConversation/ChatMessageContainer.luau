local IXPService = game:GetService("IXPService")
local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local SetTimeoutFunction = require(Parent.LuauPolyfill).setTimeout
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseGetConversationFromIdModule = require(AppChat.Hooks.useGetConversationFromId)
local OptionsModule = require(AppChat.Components.ChatConversation.MessageInteraction.Options)
local OptionsEnumModule = require(AppChat.Components.ChatConversation.MessageInteraction.OptionsEnum)
local ChatMessageContainerConstantsModule = require(script.Parent.ChatMessageContainerConstants)
local EnumScreensModule = require(AppChat.EnumScreens)
local CryoModule = require(Parent.Cryo)
local FoundationModule = require(Parent.Foundation)
local Skeleton = FoundationModule.Skeleton
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local ConversationModule = require(AppChat.Models.Conversation)
local GetReplyLabelDescriptorModule = require(AppChat.Utils.getReplyLabelDescriptor)
local _ = require(AppChat.Analytics.EventNames)
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local LoggerModule = require(script.Parent.Logger)
local NoticeTextModule = require(script.Parent.NoticeText)
local SystemMessageModule = require(script.Parent.SystemMessage)
local UserProfilesModule = require(Parent.UserProfiles)
local ChatConversationTelemetryEventsModule = require(AppChat.Components.ChatConversation.ChatConversationTelemetryEvents)
local ChatConversationTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local GlobalLongPressSignalModule = require(AppChat.Components.ChatConversation.Utils.GlobalLongPressSignal)
local MessageFtuxTooltipModule = require(script.Parent.MessageFtuxTooltip)
local MessageFtuxTooltip = MessageFtuxTooltipModule.MessageFtuxTooltip
local MessageFtuxTooltipVariant = MessageFtuxTooltipModule.MessageFtuxTooltipVariant
local MessageFtuxTooltipDismissSignal = MessageFtuxTooltipModule.MessageFtuxTooltipDismissSignal
local SwipeDirectionModule = require(AppChat.Enums.SwipeDirection)
local GetFFlagDebugAppChatModule = require(AppChat.Flags.getFFlagDebugAppChat)
local GetReplyingToStoreModule = require(AppChat.Stores.GetReplyingToStore)
local UseReplyingToMessageDispatchModule = require(AppChat.Components.ChatConversation.MessageInteraction.ReplyingContext.useReplyingToMessageDispatch)
local FFlagAppChatSignalsReplyStoreModule = require(AppChat.Flags.FFlagAppChatSignalsReplyStore)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTelemetryModule = require(AppChat.Telemetry.useTelemetry)
local UseTriggerFeedbackFunction = require(Parent.InteractionFeedback).useTriggerFeedback
local HapticFeedbackContext = require(AppChat.Utils.HapticFeedback).HapticFeedbackContext
local HapticFeedbackType = require(AppChat.Utils.HapticFeedback).HapticFeedbackType
local UseSwipeGestureModule = require(AppChat.Hooks.useSwipeGesture)
local UserTile = require(Parent.UserTile).UserTile
local LayoutMode = require(Parent.UserTile).LayoutMode
local UserPresence = require(Parent.Foundation).Enums.UserPresence
local FFlagAppChatEnableMessageContextMenuModule = require(AppChat.Flags.FFlagAppChatEnableMessageContextMenu)
local FFlagAppChatConsoleFocusFixesModule = require(AppChat.Flags.FFlagAppChatConsoleFocusFixes)
local FFlagAppChatAlignAvatarToMessageGroupBottomModule = require(AppChat.Flags.FFlagAppChatAlignAvatarToMessageGroupBottom)
local UseDescendantSelectedFunction = require(script.Parent.Hooks.useDescendantSelected).useDescendantSelected
local AppChatEnableRepliesUIIxpEnabled2 = game:DefineFastFlag("AppChatEnableRepliesUIIxpEnabled2", false)
local AppChatEnableRepliesUIIxpLayer1 = game:DefineFastString("AppChatEnableRepliesUIIxpLayer1", "Party.ConversationPage")
local AppChatMessageLongPressDistanceThreshold = game:DefineFastInt("AppChatMessageLongPressDistanceThreshold", 25)
local MessageModelModule = require(AppChat.Models.MessageModel)
local AppChatUseSymmetricSwipe = game:DefineFastFlag("AppChatUseSymmetricSwipe", false)
local AppChatReplyIconSwipeOffset = game:DefineFastInt("AppChatReplyIconSwipeOffset", 25)
local ShouldReadMessageListFromSignalsStore = require(AppChat.Flags.SignalsMigrationConfig).shouldReadMessageListFromSignalsStore or FFlagAppChatSignalsReplyStoreModule
local GetConversationMessageViewModelStoreModule = if ShouldReadMessageListFromSignalsStore then require(AppChat.Stores.GetConversationMessageViewModelStore) else nil
local _UDim2 = UDim2.new(0, 0, 0.5, 0)
local _UDim2_1 = UDim2.new(1, 0, 0.5, 0)
local _Vector2 = Vector2.new(0, 0.5)
local _Vector2_1 = Vector2.new(1, 0.5)
local config = {
	failed = false,
	filteredForReceivers = false,
	isIncoming = false,
	isNewSender = false,
	parentWidth = 0,
	messageId = "",
	conversationId = "",
	messageType = nil,
	messageTypePaddingOffset = 0,
	moderated = false,
	messageMaxWidth = 0,
	inputBoxRef = nil,
	viewProfileOnAvatarPressed = true,
	messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.",
	messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.",
	messageHiddenNoticeText = "PLACEHOLDER This message is not available",
	unknownUserKey = "Feature.Chat.Label.UnknownUser",
	isPending = false,
	visibility = nil,
	unitTestTouchEnabled = false,
	Font = Enum.Font.Gotham,
	openViewProfile = function() --[[ Line: 101 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("openViewProfile was not passed to ChatMessage")
	end,
	renderMessage = function() --[[ Line: 104 ]]
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("renderMessage was not passed to ChatMessage")
	end,
	closeKeyboard = function() --[[ Line: 107 ]] end
}
local TextButton: string = if GetFFlagDebugAppChatModule() then "TextButton" else "Frame"

function ChatMessageContainer(p1) --[[ Line: 122 ]]
	-- upvalues: CryoModule (copy), config (copy), MessageModelModule (copy), ReactModule (copy), FFlagAppChatConsoleFocusFixesModule (copy), UseStyleFunction (copy), UseChatPagePaddingModule (copy), FoundationModule (copy), AppChatUseSymmetricSwipe (copy), SwipeDirectionModule (copy), _UDim2 (copy), _UDim2_1 (copy), AppChatReplyIconSwipeOffset (copy), _Vector2 (copy), _Vector2_1 (copy), UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), UseTriggerFeedbackFunction (copy), UseDescendantSelectedFunction (copy), ReactFocusNavigationModule (copy), GlobalLongPressSignalModule (copy), MessageFtuxTooltipDismissSignal (copy), MessageFtuxTooltipVariant (copy), ChatConversationTelemetryEventsModule (copy), UseNavigationFunction (copy), UseGetConversationFromIdModule (copy), FFlagAppChatSignalsReplyStoreModule (copy), GetReplyingToStoreModule (copy), ShouldReadMessageListFromSignalsStore (copy), GetConversationMessageViewModelStoreModule (copy), UseReplyingToMessageDispatchModule (copy), UseLocalUserIdFunction (copy), HapticFeedbackContext (copy), HapticFeedbackType (copy), UseSwipeGestureModule (copy), EnumScreensModule (copy), SetTimeoutFunction (copy), AppChatMessageLongPressDistanceThreshold (copy), UserInputService (copy), FFlagAppChatEnableMessageContextMenuModule (copy), ChatMessageContainerConstantsModule (copy), OptionsEnumModule (copy), ConversationModule (copy), GetReplyLabelDescriptorModule (copy), UserProfilesModule (copy), UseLocalizationFunction (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), TextService (copy), GetFFlagDebugAppChatModule (copy), OptionsModule (copy), FFlagAppChatAlignAvatarToMessageGroupBottomModule (copy), UserTile (copy), LayoutMode (copy), UserPresence (copy), NormalizeFontFaceFunction (copy), Skeleton (copy), MessageFtuxTooltip (copy), AppChatEnableRepliesUIIxpEnabled2 (copy), IXPService (copy), AppChatEnableRepliesUIIxpLayer1 (copy), TextButton (copy), SystemMessageModule (copy), NoticeTextModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local IsVisibilityMatch: boolean = if JoinResult.visibility then JoinResult.visibility == MessageModelModule.VisibilityTypes.Hidden else false
	local UseResult = ReactModule.useCallback(function() --[[ Line: 127 ]]
		-- upvalues: JoinResult (copy)
		if JoinResult.viewProfileOnAvatarPressed then
			JoinResult.openViewProfile(JoinResult.senderUserId)
		end
	end, {
		JoinResult.senderUserId,
		if FFlagAppChatConsoleFocusFixesModule then JoinResult.openViewProfile else nil,
		if FFlagAppChatConsoleFocusFixesModule then JoinResult.viewProfileOnAvatarPressed else nil
	})
	local UseStyleResult = UseStyleFunction()
	local ShouldShowName = JoinResult.shouldShowName
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseMemoResult2 = nil
	local UseStateResult = nil
	local UseNavigationResult = nil
	local UseGetConversationFromIdModuleResult = nil
	local UseLocalUserIdResult = nil
	local UseSwipeGestureModuleResult = nil
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 152 ]]
		-- upvalues: AppChatUseSymmetricSwipe (upval), JoinResult (copy), SwipeDirectionModule (upval), FoundationModule (upval), _UDim2 (upval), _UDim2_1 (upval), AppChatReplyIconSwipeOffset (upval), _Vector2 (upval), _Vector2_1 (upval)
		return if AppChatUseSymmetricSwipe then {
			direction = if JoinResult.isIncoming then SwipeDirectionModule.Right else SwipeDirectionModule.Left,
			iconName = if JoinResult.isIncoming then FoundationModule.Enums.IconName.ArrowThickToRight else FoundationModule.Enums.IconName.ArrowThickToLeft,
			messagePosition = if JoinResult.isIncoming then _UDim2 else _UDim2_1,
			iconOffset = if JoinResult.isIncoming then AppChatReplyIconSwipeOffset else -AppChatReplyIconSwipeOffset,
			iconAnchorPoint = if JoinResult.isIncoming then _Vector2 else _Vector2_1
		} else {
			direction = SwipeDirectionModule.Right,
			iconName = FoundationModule.Enums.IconName.ArrowThickToRight,
			messagePosition = _UDim2,
			iconOffset = AppChatReplyIconSwipeOffset,
			iconAnchorPoint = _Vector2
		}
	end, { JoinResult.isIncoming })
	local UseResult7 = nil
	local UseResult8 = nil
	local UseResult5 = nil
	local UseResult6 = nil
	local UseResult9 = nil
	local UseResult10 = nil
	local Callback = nil
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(Vector2.zero)
	local UseTelemetryModuleResult = UseTelemetryModule(ChatConversationTelemetryLayerModule.Context)
	local UseTriggerFeedbackResult = UseTriggerFeedbackFunction()
	local UseStateResult2
	UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local v1 = nil
	local v2 = nil
	
	if FFlagAppChatConsoleFocusFixesModule then
		v1, v92 = UseDescendantSelectedFunction()
	end
	local UseResult1 = nil
	
	if FFlagAppChatConsoleFocusFixesModule then
		local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
		UseResult1 = ReactModule.useCallback(function() --[[ Line: 205 ]]
			-- upvalues: UseRefResult1 (copy), UseFocusGuiObjectResult (copy)
			local Current = UseRefResult1.current
			
			if Current then
				UseFocusGuiObjectResult(Current)
			end
		end, { UseRefResult1, UseFocusGuiObjectResult })
	end
	ReactModule.useEffect(function() --[[ Line: 212 ]]
		-- upvalues: GlobalLongPressSignalModule (upval), UseStateResult2_2 (copy)
		local DismissedConnection = GlobalLongPressSignalModule.dismissed:connect(function() --[[ Line: 213 ]]
			-- upvalues: UseStateResult2_2 (upval)
			UseStateResult2_2(false)
		end)
		
		return function() --[[ Line: 216 ]]
			-- upvalues: DismissedConnection (copy)
			DismissedConnection:disconnect()
		end
	end)
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 222 ]]
		-- upvalues: JoinResult (copy)
		return {
			conversationId = JoinResult.conversationId,
			targetMessageSenderId = JoinResult.senderUserId,
			targetMessageId = JoinResult.messageId,
			targetMessageSentAt = if JoinResult.sent then JoinResult.sent.dateTime else nil,
			targetMessageLength = if JoinResult.content then #JoinResult.content else nil,
			targetMessageVisibility = JoinResult.visibility
		}
	end, {
		JoinResult.conversationId, JoinResult.senderUserId, JoinResult.messageId,
		JoinResult.sent, JoinResult.content, JoinResult.visibility
	})
	UseMemoResult2 = if FFlagAppChatConsoleFocusFixesModule then ReactModule.useMemo(function() --[[ Line: 243 ]]
		-- upvalues: IsVisibilityMatch (copy), UseStateResult1 (copy), v1 (ref)
		return not IsVisibilityMatch and (UseStateResult1 or v1)
	end, { UseStateResult1, IsVisibilityMatch, v1 }) else ReactModule.useMemo(function() --[[ Line: 247 ]]
		-- upvalues: IsVisibilityMatch (copy), UseStateResult1 (copy)
		return not IsVisibilityMatch and UseStateResult1
	end, { UseStateResult1, IsVisibilityMatch })
	ReactModule.useEffect(function() --[[ Line: 253 ]]
		-- upvalues: UseMemoResult2 (ref), JoinResult (copy), MessageFtuxTooltipDismissSignal (upval), MessageFtuxTooltipVariant (upval)
		if UseMemoResult2 and JoinResult.isLastIncomingChatMessage then
			MessageFtuxTooltipDismissSignal.dismiss(MessageFtuxTooltipVariant.Replies)
		end
	end, { UseMemoResult2, JoinResult.isLastIncomingChatMessage })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 258 ]]
		-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), UseMemoResult1 (copy)
		UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationMessageReplyIconImpression, UseMemoResult1)
	end, { UseTelemetryModuleResult, UseMemoResult1 })
	UseNavigationResult = UseNavigationFunction()
	UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(JoinResult.conversationId)
	local ReplyingToStoreModule = if FFlagAppChatSignalsReplyStoreModule then GetReplyingToStoreModule(false) else nil
	local FromChannelsApiResult = nil
	
	if ShouldReadMessageListFromSignalsStore and GetConversationMessageViewModelStoreModule then
		local Message = GetConversationMessageViewModelStoreModule(false).conversationMessageStore.messages[JoinResult.messageId]
		FromChannelsApiResult = if Message then MessageModelModule.fromChannelsApi(Message, JoinResult.conversationId) else nil
	elseif UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.messages then
		FromChannelsApiResult = UseGetConversationFromIdModuleResult.messages:Get(JoinResult.messageId)
	end
	local UseReplyingToMessageDispatchModuleResult = UseReplyingToMessageDispatchModule()
	UseLocalUserIdResult = UseLocalUserIdFunction()
	UseSwipeGestureModuleResult = UseSwipeGestureModule({
		onSwipeThresholdReached = ReactModule.useCallback(function() --[[ Line: 282 ]]
			-- upvalues: IsVisibilityMatch (copy), UseTriggerFeedbackResult (copy), HapticFeedbackContext (upval), HapticFeedbackType (upval)
			if not IsVisibilityMatch then
				UseTriggerFeedbackResult(HapticFeedbackContext.Default, HapticFeedbackType.Press)
			end
		end, { IsVisibilityMatch, UseTriggerFeedbackResult }),
		onSwipeComplete = ReactModule.useCallback(function() --[[ Line: 289 ]]
			-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), UseMemoResult1 (copy), IsVisibilityMatch (copy), FFlagAppChatSignalsReplyStoreModule (upval), ReplyingToStoreModule (copy), JoinResult (copy), UseReplyingToMessageDispatchModuleResult (copy), FromChannelsApiResult (ref)
			UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationMessageSwiped, UseMemoResult1)
			
			if not IsVisibilityMatch then
				if FFlagAppChatSignalsReplyStoreModule and ReplyingToStoreModule then
					ReplyingToStoreModule.setReplyingTo(JoinResult.messageId)
					
					return
				end
				UseReplyingToMessageDispatchModuleResult(FromChannelsApiResult)
			end
		end, {
			UseReplyingToMessageDispatchModuleResult, FromChannelsApiResult,
			UseTelemetryModuleResult, UseMemoResult1, IsVisibilityMatch,
			if FFlagAppChatSignalsReplyStoreModule then ReplyingToStoreModule else nil,
			if FFlagAppChatSignalsReplyStoreModule then JoinResult.messageId else nil
		}),
		direction = UseMemoResult.direction
	})
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 316 ]]
		-- upvalues: UseNavigationResult (ref), EnumScreensModule (upval), JoinResult (copy)
		UseNavigationResult.navigate(EnumScreensModule.MessageContextMenu, {
			messageId = JoinResult.messageId,
			conversationId = JoinResult.conversationId,
			inputBoxRef = JoinResult.inputBoxRef
		})
	end, {
		UseNavigationResult.navigate,
		JoinResult.messageId,
		JoinResult.conversationId,
		JoinResult.inputBoxRef
	})
	local UseResult4 = ReactModule.useCallback(function(p2, Input, p3) --[[ Line: 325 ]]
		-- upvalues: UseRefResult2 (copy), SetTimeoutFunction (upval), AppChatMessageLongPressDistanceThreshold (upval), Callback (ref)
		if Input then
			UseRefResult2.current = Vector2.new(Input.Position.X, Input.Position.Y)
		end
		SetTimeoutFunction(function() --[[ Line: 329 ]]
			-- upvalues: Input (copy), UseRefResult2 (upval), AppChatMessageLongPressDistanceThreshold (upval), Callback (upval), p2 (copy)
			local Distance = if Input then (Vector2.new(Input.Position.X, Input.Position.Y) - UseRefResult2.current).Magnitude else 0
			
			if Input and (Input.UserInputState == Enum.UserInputState.Begin or Input.UserInputState == Enum.UserInputState.Change) and Distance < AppChatMessageLongPressDistanceThreshold then
				Callback(p2, Input)
			end
		end, p3)
	end, { Callback })
	Callback = ReactModule.useCallback(function(Activated, p2, MessageContextMenu) --[[ Line: 352 ]]
		-- upvalues: JoinResult (copy), UserInputService (upval), ReactModule (upval), UseStateResult2_1 (copy), UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), UseMemoResult1 (copy), IsVisibilityMatch (copy), UseStateResult2_2 (copy), FFlagAppChatEnableMessageContextMenuModule (upval), UseResult3 (copy), UseResult4 (copy), ChatMessageContainerConstantsModule (upval), UseStateResult3 (copy), GlobalLongPressSignalModule (upval), OptionsEnumModule (upval), UseTriggerFeedbackResult (copy), HapticFeedbackContext (upval), HapticFeedbackType (upval), FFlagAppChatSignalsReplyStoreModule (upval), ReplyingToStoreModule (copy), UseReplyingToMessageDispatchModuleResult (copy), FromChannelsApiResult (ref)
		if JoinResult.isPending then return end
		if UserInputService.MouseEnabled then
			if Activated == ReactModule.Event.MouseEnter then
				UseStateResult2_1(true)
			end
			if Activated == ReactModule.Event.MouseLeave then
				UseStateResult2_1(false)
			end
			if Activated == ReactModule.Event.MouseButton1Down then
				JoinResult.closeKeyboard()
			end
		end
		if UserInputService.GamepadEnabled or UserInputService.TouchEnabled or JoinResult.unitTestTouchEnabled then
			if Activated == ReactModule.Event.TouchLongPress then
				UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationMessageLongPressed, UseMemoResult1)
				
				if not IsVisibilityMatch then
					UseStateResult2_2(true)
					
					if FFlagAppChatEnableMessageContextMenuModule then
						UseResult3()
					end
					UseResult4(ReactModule.Event.InputEnded, p2, ChatMessageContainerConstantsModule.PEEK_VIEW_ANIMATION_MILLISEC)
				end
			end
			if Activated == ReactModule.Event.InputBegan and p2 then
				UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationMessagePressed, UseMemoResult1)
				
				if not IsVisibilityMatch and not UseStateResult3 then
					GlobalLongPressSignalModule.dismiss()
				end
				UseResult4(ReactModule.Event.TouchLongPress, p2, ChatMessageContainerConstantsModule.LONG_PRESS_DELAY_MILLISEC)
			end
			if Activated == ReactModule.Event.TouchTap then
				JoinResult.closeKeyboard()
			end
		end
		if Activated == ReactModule.Event.Activated then
			GlobalLongPressSignalModule.dismiss()
			
			if MessageContextMenu == OptionsEnumModule.MessageContextMenu then
				if ChatConversationTelemetryEventsModule.ConversationMessageOpenMenuIconClicked then
					UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationMessageOpenMenuIconClicked, UseMemoResult1)
				end
				UseResult3()
			end
			if MessageContextMenu == OptionsEnumModule.Reply then
				UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationMessageReplyIconClicked, UseMemoResult1)
				UseTriggerFeedbackResult(HapticFeedbackContext.Default, HapticFeedbackType.Press)
				
				if FFlagAppChatSignalsReplyStoreModule and ReplyingToStoreModule then
					ReplyingToStoreModule.setReplyingTo(JoinResult.messageId)
					
					return
				end
				UseReplyingToMessageDispatchModuleResult(FromChannelsApiResult)
			end
		end
	end, {
		JoinResult.isPending, JoinResult.unitTestTouchEnabled,
		UserInputService.MouseEnabled, UserInputService.TouchEnabled, UseResult4,
		UseStateResult2_1, UseStateResult2_2, UseStateResult2,
		UseTelemetryModuleResult, UseResult3, UseReplyingToMessageDispatchModuleResult,
		UseTriggerFeedbackResult, IsVisibilityMatch,
		if FFlagAppChatSignalsReplyStoreModule then ReplyingToStoreModule else nil,
		if FFlagAppChatSignalsReplyStoreModule then nil else FromChannelsApiResult,
		if FFlagAppChatSignalsReplyStoreModule then JoinResult.messageId else nil
	})
	UseResult5 = ReactModule.useCallback(function(p2, p3) --[[ Line: 451 ]]
		-- upvalues: UserInputService (upval), UseSwipeGestureModuleResult (ref), MessageFtuxTooltipDismissSignal (upval), MessageFtuxTooltipVariant (upval), UseResult4 (copy), ReactModule (upval), ChatMessageContainerConstantsModule (upval)
		if UserInputService.TouchEnabled and UseSwipeGestureModuleResult then
			UseSwipeGestureModuleResult.onInputBegan(p2, p3)
			MessageFtuxTooltipDismissSignal.dismiss(MessageFtuxTooltipVariant.Replies)
		end
		UseResult4(ReactModule.Event.InputBegan, p3, ChatMessageContainerConstantsModule.INPUT_BEGAN_DELAY_MILLISEC)
	end, { UseResult4, UseSwipeGestureModuleResult })
	UseResult6 = ReactModule.useCallback(function(_) --[[ Line: 460 ]]
		-- upvalues: Callback (ref), ReactModule (upval)
		Callback(ReactModule.Event.InputEnded)
	end, { Callback })
	UseResult7 = ReactModule.useCallback(function(_) --[[ Line: 464 ]]
		-- upvalues: Callback (ref), ReactModule (upval)
		Callback(ReactModule.Event.MouseEnter)
	end, { Callback })
	UseResult8 = ReactModule.useCallback(function(_) --[[ Line: 468 ]]
		-- upvalues: Callback (ref), ReactModule (upval)
		Callback(ReactModule.Event.MouseLeave)
	end, { Callback })
	UseResult9 = ReactModule.useCallback(function(_) --[[ Line: 472 ]]
		-- upvalues: Callback (ref), ReactModule (upval)
		Callback(ReactModule.Event.TouchTap)
	end, { Callback })
	UseResult10 = ReactModule.useCallback(function(_) --[[ Line: 476 ]]
		-- upvalues: Callback (ref), ReactModule (upval)
		Callback(ReactModule.Event.MouseButton1Down)
	end, { Callback })
	local SenderTargetId = JoinResult.repliesTo and JoinResult.repliesTo.senderTargetId
	
	local function getDisplayNameText(SenderName, RepliedToName) --[[ Line: 482 ]]
		-- upvalues: UseLocalUserIdResult (ref), JoinResult (copy), SenderTargetId (copy), UseGetConversationFromIdModuleResult (ref), ConversationModule (upval), GetReplyLabelDescriptorModule (upval)
		local IsUseLocalUserIdResultMatch = UseLocalUserIdResult == JoinResult.senderUserId
		local IsSenderUserIdMatch = JoinResult.senderUserId == JoinResult.repliesTo.senderTargetId
		local IsUseLocalUserIdResultMatch1 = UseLocalUserIdResult == JoinResult.repliesTo.senderTargetId
		
		if SenderTargetId then
			local ConversationType = UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.conversationType
			
			return if ConversationType == ConversationModule.Type.ONE_TO_ONE_CONVERSATION or ConversationType == ConversationModule.Type.MULTI_USER_CONVERSATION then GetReplyLabelDescriptorModule({
				senderIsLocalUser = IsUseLocalUserIdResultMatch,
				senderRepliedToSelf = IsSenderUserIdMatch,
				senderRepliedToLocalUser = IsUseLocalUserIdResultMatch1,
				isGroup = ConversationType == ConversationModule.Type.MULTI_USER_CONVERSATION,
				senderName = SenderName,
				repliedToName = RepliedToName
			}) else JoinResult.unknownUserKey
		else
			return SenderName
		end
	end
	
	local UserIds = { JoinResult.senderUserId }
	
	if SenderTargetId then
		table.insert(UserIds, JoinResult.repliesTo.senderTargetId)
	end
	local UseUserProfilesFetchResult = UserProfilesModule.Hooks.useUserProfilesFetch({
		userIds = UserIds,
		query = UserProfilesModule.Queries.userProfilesCombinedNameAndUsernameByUserIds
	})
	local Flag = nil
	local DisplayNameText = nil
	
	if UseUserProfilesFetchResult.data then
		Flag = false
		local CombinedNameFromId = UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, JoinResult.senderUserId) or JoinResult.unknownUserKey
		DisplayNameText = if SenderTargetId then getDisplayNameText(CombinedNameFromId, UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, JoinResult.repliesTo.senderTargetId) or JoinResult.unknownUserKey) else CombinedNameFromId
	else
		Flag = true
		DisplayNameText = nil
	end
	local DisplayName = UseLocalizationFunction(if SenderTargetId then { displayName = DisplayNameText } else {}).displayName or DisplayNameText
	local UseResult11 = ReactModule.useCallback(function(): UDim2 --[[ Line: 549 ]]
		-- upvalues: JoinResult (copy), ChatMessageContainerConstantsModule (upval), FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), DisplayName (ref), UseStyleResult (copy), UseTokensResult (copy), TextService (upval)
		local _Vector2 = Vector2.new(math.max(1, JoinResult.messageMaxWidth - ChatMessageContainerConstantsModule.TAIL_WIDTH), 1e999)
		local TextSize = if FoundationFontFaceMigration then GetTextSizeFunction(DisplayName, UseStyleResult.Font.BaseSize * UseStyleResult.Font.Footer.RelativeSize, UseTokensResult.Typography.CaptionSmall.Font, _Vector2, { addTemporaryPadding = false }) else TextService:GetTextSize(DisplayName, UseStyleResult.Font.BaseSize * UseStyleResult.Font.Footer.RelativeSize, UseStyleResult.Font.Footer.Font, _Vector2)
		
		return UDim2.new(0, TextSize.X, 0, TextSize.Y)
	end, {
		UseStyleResult.Font.BaseSize * UseStyleResult.Font.Footer.RelativeSize,
		UseStyleResult.Font.Footer.Font,
		JoinResult.messageMaxWidth - ChatMessageContainerConstantsModule.TAIL_WIDTH,
		DisplayName,
		if FoundationFontFaceMigration then UseTokensResult.Typography.CaptionSmall.Font else nil
	})
	local NewMessageTypePaddingOffset = if JoinResult.showDateTime then 0 else (if JoinResult.isNewSender or SenderTargetId then ChatMessageContainerConstantsModule.CHAT_MESSAGE_MAX_SPACE else ChatMessageContainerConstantsModule.CHAT_MESSAGE_MIN_SPACE) + JoinResult.messageTypePaddingOffset
	local Left = UseChatPagePaddingModuleResult.left
	local NewLeft = Left + UseTokensResult.Size.Size_700
	local Left1 = JoinResult.isIncoming and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseResult12 = ReactModule.useCallback(function() --[[ Line: 586 ]]
		-- upvalues: GetFFlagDebugAppChatModule (upval), UseStateResult2_3 (copy)
		if GetFFlagDebugAppChatModule() then
			UseStateResult2_3(function(p2): boolean --[[ Line: 588 ]]
				return not p2
			end)
		end
	end, { UseStateResult2_3 })
	local UseStateResult4_1 = UseStateResult4 or (JoinResult.moderated or (JoinResult.filteredForReceivers or IsVisibilityMatch))
	local MessageId = if UseStateResult4 then JoinResult.messageId elseif IsVisibilityMatch then JoinResult.messageHiddenNoticeText else JoinResult.moderated and JoinResult.messageModeratedNoticeText or JoinResult.messageDefaultNoticeText
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 600 ]]
		-- upvalues: ReactModule (upval), FoundationModule (upval), UseTokensResult (copy), JoinResult (copy)
		return ReactModule.createElement(FoundationModule.Icon, {
			name = FoundationModule.Enums.IconName.TriangleExclamation,
			size = FoundationModule.Enums.IconSize.Large,
			style = UseTokensResult.Color.System.Alert,
			LayoutOrder = if JoinResult.isIncoming then 0 else 3
		})
	end, { UseTokensResult, UseStyleResult, JoinResult.isIncoming })
	local UseMemoResult4 = nil
	UseMemoResult4 = if JoinResult.failed or JoinResult.moderated then UseMemoResult3 elseif UseMemoResult2 then ReactModule.createElement(OptionsModule, {
		LayoutOrder = if JoinResult.isIncoming then 2 else 1,
		isIncoming = JoinResult.isIncoming,
		handleEvent = Callback,
		emitImpressionTelemetryEvent = UseResult2
	}) else nil
	local IsIncoming = JoinResult.isIncoming
	local MapResult = if UseSwipeGestureModuleResult and UseSwipeGestureModuleResult.swipeProgress then UseSwipeGestureModuleResult.swipeProgress:map(function(p2: number) --[[ Line: 626 ]]
		-- upvalues: UseTokensResult (copy)
		return {
			Color3 = UseTokensResult.Color.Content.Default.Color3,
			Transparency = 1 - math.pow(p2, 3)
		}
	end) else nil
	local MapResult1 = if UseSwipeGestureModuleResult and UseSwipeGestureModuleResult.swipeOffset then UseSwipeGestureModuleResult.swipeOffset:map(function(p2): UDim2 --[[ Line: 637 ]]
		-- upvalues: UseMemoResult (copy), SwipeDirectionModule (upval)
		return UDim2.new(0, if UseMemoResult.direction == SwipeDirectionModule.Right then p2 else -p2, 0, 0)
	end) else nil
	local MapResult2 = if UseSwipeGestureModuleResult and UseSwipeGestureModuleResult.swipeProgress then UseSwipeGestureModuleResult.swipeProgress:map(function(p2): UDim2 --[[ Line: 645 ]]
		-- upvalues: UseMemoResult (copy)
		return UseMemoResult.messagePosition + UDim2.new(0, p2 * UseMemoResult.iconOffset, 0, 0)
	end) else nil
	
	local function renderMessage() --[[ Line: 652 ]]
		-- upvalues: ReactModule (upval), MapResult1 (copy), UseResult7 (ref), UseResult8 (ref), NewMessageTypePaddingOffset (ref), JoinResult (copy), Left (copy), NewLeft (copy), UseChatPagePaddingModuleResult (copy), Left1 (copy), FoundationModule (upval), FFlagAppChatAlignAvatarToMessageGroupBottomModule (upval), UserTile (upval), LayoutMode (upval), UserPresence (upval), UseResult (copy), UseTokensResult (copy), ShouldShowName (copy), ChatMessageContainerConstantsModule (upval), IsIncoming (copy), SenderTargetId (copy), Flag (ref), FoundationFontFaceMigration (upval), UseStyleResult (copy), NormalizeFontFaceFunction (upval), UseResult11 (copy), DisplayName (ref), Skeleton (upval), FFlagAppChatConsoleFocusFixesModule (upval), IsVisibilityMatch (copy), v2 (ref), UseResult1 (ref), UseResult5 (ref), UseResult6 (ref), UseResult9 (ref), UseResult10 (ref), UseStateResult (ref), UseMemoResult4 (ref), UseRefResult1 (copy), UseRefResult (copy), MessageFtuxTooltip (upval), MessageFtuxTooltipVariant (upval), UseMemoResult (copy), MapResult2 (copy), MapResult (copy)
		local Frame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			Position = MapResult1,
			[ReactModule.Event.MouseEnter] = UseResult7,
			[ReactModule.Event.MouseLeave] = UseResult8
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, NewMessageTypePaddingOffset),
				PaddingLeft = UDim.new(0, JoinResult.thumbnail and Left or NewLeft),
				PaddingRight = UDim.new(0, UseChatPagePaddingModuleResult.right - 0)
			}),
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Left1
			}),
			AvatarContainer = if JoinResult.thumbnail then ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 1,
				tag = {
					["col auto-x size-0-full"] = true,
					["align-y-top"] = false,
					["align-y-bottom"] = FFlagAppChatAlignAvatarToMessageGroupBottomModule
				}
			}, {
				Avatar = ReactModule.createElement(FoundationModule.View, { tag = "size-700-700" }, {
					AvatarCircle = ReactModule.createElement(UserTile, {
						layoutOrder = 1,
						userId = JoinResult.senderUserId,
						layoutMode = LayoutMode.compact,
						userPresenceType = UserPresence.None,
						onActivated = UseResult
					})
				})
			}) else nil,
			MessageWithDisplayName = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(1, JoinResult.isIncoming and -NewLeft or 0, 0, 0)
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Left1
				}),
				Padding = ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, JoinResult.isIncoming and UseTokensResult.Size.Size_200 or 0)
				}),
				DisplayNameContainer = ShouldShowName and ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 1,
					Size = UDim2.new(0, JoinResult.messageMaxWidth - ChatMessageContainerConstantsModule.TAIL_WIDTH, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Padding = ReactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, ChatMessageContainerConstantsModule.GROUPED_MESSAGE_DISPLAY_NAME_LEFT_PADDING),
						PaddingRight = if IsIncoming then UDim.new(0, 0) else UDim.new(0, ChatMessageContainerConstantsModule.TAIL_WIDTH),
						PaddingBottom = if SenderTargetId then UDim.new(0, ChatMessageContainerConstantsModule.REPLIED_DISPLAY_NAME_BOTTOM_PADDING) else UDim.new(0, ChatMessageContainerConstantsModule.GROUPED_MESSAGE_DISPLAY_NAME_BOTTOM_PADDING)
					}),
					DisplayName = if Flag then nil else ReactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Font = if FoundationFontFaceMigration then nil else UseStyleResult.Font.Footer.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.CaptionSmall.Font) else nil,
						Size = UseResult11(),
						AnchorPoint = if IsIncoming then Vector2.new(0, 0) else Vector2.new(1, 0),
						Position = if IsIncoming then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0),
						Text = DisplayName,
						TextColor3 = UseStyleResult.Theme.TextDefault.Color,
						TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Footer.RelativeSize,
						TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
						TextXAlignment = if IsIncoming then Enum.TextXAlignment.Left else Enum.TextXAlignment.Right,
						TextYAlignment = Enum.TextYAlignment.Top
					}),
					ShimmerName = if Flag then ReactModule.createElement(Skeleton, {
						LayoutOrder = 2,
						AnchorPoint = if IsIncoming then Vector2.new(0, 0) else Vector2.new(1, 0),
						Position = if IsIncoming then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0),
						Size = UDim2.new(0, ChatMessageContainerConstantsModule.SHIMMER_WIDTH, 0, ChatMessageContainerConstantsModule.SHIMMER_HEIGHT)
					}) else nil
				}),
				MessageWithIcons = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = if FFlagAppChatConsoleFocusFixesModule then UDim2.new(1, 0, 0, 0) else UDim2.new(1, JoinResult.isIncoming and -NewLeft or 0, 0, 0),
					Selectable = if FFlagAppChatConsoleFocusFixesModule then not IsVisibilityMatch else nil,
					ref = if FFlagAppChatConsoleFocusFixesModule then v2 else nil,
					[ReactModule.Event.SelectionGained] = if FFlagAppChatConsoleFocusFixesModule then UseResult1 else nil
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						SortOrder = Enum.SortOrder.LayoutOrder,
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Left1,
						VerticalAlignment = Enum.VerticalAlignment.Center,
						Padding = UDim.new(0, 10),
						ItemLineAlignment = Enum.ItemLineAlignment.Center
					}),
					Message = JoinResult.renderMessage({
						LayoutOrder = if JoinResult.isIncoming then 1 else 2,
						[ReactModule.Event.InputBegan] = UseResult5,
						[ReactModule.Event.InputEnded] = UseResult6,
						[ReactModule.Event.TouchTap] = UseResult9,
						[ReactModule.Event.MouseButton1Down] = UseResult10
					}, {
						isPressed = UseStateResult,
						Icons = UseMemoResult4,
						bubbleRef = if FFlagAppChatConsoleFocusFixesModule then UseRefResult1 else nil,
						ref = UseRefResult
					}),
					MessageFtuxTooltip = if JoinResult.isLastIncomingChatMessage and not IsVisibilityMatch then ReactModule.createElement(MessageFtuxTooltip, {
						variant = MessageFtuxTooltipVariant.Replies,
						messageRef = UseRefResult,
						isReversed = JoinResult.isIncoming
					}) else nil
				})
			})
		})
		
		return if IsVisibilityMatch then Frame else ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-0 auto-y",
			ClipsDescendants = false,
			LayoutOrder = 2,
			ZIndex = 2
		}, {
			ReplyIconFilled = ReactModule.createElement(FoundationModule.Icon, {
				ZIndex = 1,
				name = UseMemoResult.iconName,
				size = FoundationModule.Enums.IconSize.Medium,
				variant = FoundationModule.Enums.IconVariant.Filled,
				AnchorPoint = UseMemoResult.iconAnchorPoint,
				Position = MapResult2,
				style = MapResult
			}),
			Content = Frame
		})
	end
	
	ReactModule.useEffect(function() --[[ Line: 820 ]]
		-- upvalues: AppChatEnableRepliesUIIxpEnabled2 (upval), JoinResult (copy), IXPService (upval), AppChatEnableRepliesUIIxpLayer1 (upval)
		if AppChatEnableRepliesUIIxpEnabled2 and JoinResult.isLastIncomingChatMessage then
			IXPService:LogFlagLinkedUserLayerExposure(AppChatEnableRepliesUIIxpLayer1)
		end
	end, { JoinResult.isLastIncomingChatMessage })
	
	return ReactModule.createElement(TextButton, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		Text = if GetFFlagDebugAppChatModule() then "" else nil,
		[ReactModule.Event.Activated] = if GetFFlagDebugAppChatModule() then UseResult12 else nil
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Left1,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		DateTime = JoinResult.showDateTime and ReactModule.createElement(SystemMessageModule, {
			LayoutOrder = 1,
			Text = JoinResult.sent:GetLongRelativeTime(),
			maxWidth = ChatMessageContainerConstantsModule.DATETIME_MAX_WIDTH
		}),
		MessageWithAvatar = renderMessage(),
		Notice = UseStateResult4_1 and ReactModule.createElement(NoticeTextModule, {
			LayoutOrder = 3,
			Font = JoinResult.Font,
			HorizontalAlignment = Left1,
			Text = MessageId,
			TextColor3 = if IsVisibilityMatch then UseTokensResult.Color.Content.Muted.Color3 else JoinResult.moderated and UseStyleResult.Theme.Alert.Color or UseStyleResult.Theme.UIDefault.Color,
			TextTransparency = if IsVisibilityMatch then UseTokensResult.Color.Content.Muted.Transparency else JoinResult.moderated and UseStyleResult.Theme.Alert.Transparency or UseStyleResult.Theme.UIDefault.Transparency,
			TextXAlignment = JoinResult.isIncoming and Enum.TextXAlignment.Left or Enum.TextXAlignment.Right,
			TextSize = UseTokensResult.Typography.CaptionSmall.FontSize,
			margin = {
				bottom = 0,
				top = UseTokensResult.Padding.Small,
				left = JoinResult.isIncoming and NewLeft + ChatMessageContainerConstantsModule.NOTICE_HORIZONTAL_PADDING or 0,
				right = if JoinResult.isIncoming then 0 else UseChatPagePaddingModuleResult.right or 0
			},
			maxWidth = JoinResult.parentWidth,
			width = UDim.new(1, JoinResult.isIncoming and -NewLeft or 0)
		}),
		debug = JoinResult.debugElement or nil
	})
end

return ChatMessageContainer