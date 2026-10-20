local IXPService = game:GetService("IXPService")
local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")
local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local SetTimeoutFunction = require(Parent.LuauPolyfill).setTimeout
local ReactModule = require(Parent.React)
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
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local ConversationModule = require(AppChat.Models.Conversation)
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
local AppChatEnableRepliesUIIxpEnabled2 = game:DefineFastFlag("AppChatEnableRepliesUIIxpEnabled2", false)
local AppChatEnableRepliesUIIxpLayer1 = game:DefineFastString("AppChatEnableRepliesUIIxpLayer1", "Party.ConversationPage")
local AppChatMessageLongPressDistanceThreshold = game:DefineFastInt("AppChatMessageLongPressDistanceThreshold", 25)
local MessageModelModule = require(AppChat.Models.MessageModel)
local FFlagAppChatUseSwipeForRepliesModule = require(AppChat.Flags.FFlagAppChatUseSwipeForReplies)
local AppChatUseSymmetricSwipe = game:DefineFastFlag("AppChatUseSymmetricSwipe", false)
local AppChatReplyIconSwipeOffset = game:DefineFastInt("AppChatReplyIconSwipeOffset", 25)
local FFlagAppChatSignalsMessageStoreModule = require(AppChat.Flags.FFlagAppChatSignalsMessageStore)
local GetConversationMessageViewModelStoreModule = if FFlagAppChatSignalsMessageStoreModule then require(AppChat.Stores.GetConversationMessageViewModelStore) else nil
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
	openViewProfile = function()
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("openViewProfile was not passed to ChatMessage")
	end,
	renderMessage = function()
		-- upvalues: LoggerModule (copy)
		LoggerModule:warning("renderMessage was not passed to ChatMessage")
	end,
	closeKeyboard = function() end
}
local TextButton: string = if GetFFlagDebugAppChatModule() then "TextButton" else "Frame"

function ChatMessageContainer(p1)
	-- upvalues: CryoModule (copy), config (copy), MessageModelModule (copy), ReactModule (copy), UseStyleFunction (copy), UseChatPagePaddingModule (copy), FoundationModule (copy), FFlagAppChatUseSwipeForRepliesModule (copy), AppChatUseSymmetricSwipe (copy), SwipeDirectionModule (copy), _UDim2 (copy), _UDim2_1 (copy), AppChatReplyIconSwipeOffset (copy), _Vector2 (copy), _Vector2_1 (copy), UseTelemetryModule (copy), ChatConversationTelemetryLayerModule (copy), UseTriggerFeedbackFunction (copy), GlobalLongPressSignalModule (copy), MessageFtuxTooltipDismissSignal (copy), MessageFtuxTooltipVariant (copy), ChatConversationTelemetryEventsModule (copy), UseNavigationFunction (copy), UseGetConversationFromIdModule (copy), FFlagAppChatSignalsReplyStoreModule (copy), GetReplyingToStoreModule (copy), FFlagAppChatSignalsMessageStoreModule (copy), GetConversationMessageViewModelStoreModule (copy), UseReplyingToMessageDispatchModule (copy), UseLocalUserIdFunction (copy), HapticFeedbackContext (copy), HapticFeedbackType (copy), UseSwipeGestureModule (copy), EnumScreensModule (copy), SetTimeoutFunction (copy), AppChatMessageLongPressDistanceThreshold (copy), UserInputService (copy), FFlagAppChatEnableMessageContextMenuModule (copy), ChatMessageContainerConstantsModule (copy), OptionsEnumModule (copy), ConversationModule (copy), UserProfilesModule (copy), UseLocalizationFunction (copy), TextService (copy), GetFFlagDebugAppChatModule (copy), OptionsModule (copy), UserTile (copy), LayoutMode (copy), UserPresence (copy), Skeleton (copy), MessageFtuxTooltip (copy), AppChatEnableRepliesUIIxpEnabled2 (copy), IXPService (copy), AppChatEnableRepliesUIIxpLayer1 (copy), TextButton (copy), SystemMessageModule (copy), NoticeTextModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local IsVisibilityMatch: boolean = if JoinResult.visibility then JoinResult.visibility == MessageModelModule.VisibilityTypes.Hidden else false
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: JoinResult (copy)
		if JoinResult.viewProfileOnAvatarPressed then
			JoinResult.openViewProfile(JoinResult.senderUserId)
		end
	end, { JoinResult.senderUserId })
	local UseStyleResult = UseStyleFunction()
	local ShouldShowName = JoinResult.shouldShowName
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseMemoResult2 = nil
	local UseStateResult = nil
	local UseNavigationResult = nil
	local UseGetConversationFromIdModuleResult = nil
	local UseLocalUserIdResult = nil
	local v1 = nil
	local UseMemoResult = if FFlagAppChatUseSwipeForRepliesModule then ReactModule.useMemo(function()
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
	end, {}) else nil
	local UseResult6 = nil
	local UseResult7 = nil
	local UseResult4 = nil
	local UseResult5 = nil
	local UseResult8 = nil
	local UseResult9 = nil
	local Callback = nil
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(Vector2.zero)
	local UseTelemetryModuleResult = UseTelemetryModule(ChatConversationTelemetryLayerModule.Context)
	local UseTriggerFeedbackResult = UseTriggerFeedbackFunction()
	local UseStateResult2
	UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: GlobalLongPressSignalModule (upval), UseStateResult2_2 (copy)
		local DismissedConnection = GlobalLongPressSignalModule.dismissed:connect(function()
			-- upvalues: UseStateResult2_2 (upval)
			UseStateResult2_2(false)
		end)
		
		return function()
			-- upvalues: DismissedConnection (copy)
			DismissedConnection:disconnect()
		end
	end)
	local UseMemoResult1 = ReactModule.useMemo(function()
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
	UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: IsVisibilityMatch (copy), UseStateResult1 (copy), FFlagAppChatUseSwipeForRepliesModule (upval), UseStateResult3 (copy)
		return not IsVisibilityMatch and (UseStateResult1 or not FFlagAppChatUseSwipeForRepliesModule and UseStateResult3)
	end, { UseStateResult1, UseStateResult3, IsVisibilityMatch })
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult2 (ref), JoinResult (copy), MessageFtuxTooltipDismissSignal (upval), MessageFtuxTooltipVariant (upval)
		if UseMemoResult2 and JoinResult.isLastIncomingChatMessage then
			MessageFtuxTooltipDismissSignal.dismiss(MessageFtuxTooltipVariant.Replies)
		end
	end, { UseMemoResult2, JoinResult.isLastIncomingChatMessage })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), UseMemoResult1 (copy)
		UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationMessageReplyIconImpression, UseMemoResult1)
	end, { UseTelemetryModuleResult, UseMemoResult1 })
	UseNavigationResult = UseNavigationFunction()
	UseGetConversationFromIdModuleResult = UseGetConversationFromIdModule(JoinResult.conversationId)
	local ReplyingToStoreModule = if FFlagAppChatSignalsReplyStoreModule then GetReplyingToStoreModule(false) else nil
	local FromChannelsApiResult = nil
	
	if FFlagAppChatSignalsMessageStoreModule and GetConversationMessageViewModelStoreModule then
		local Message = GetConversationMessageViewModelStoreModule(false).conversationMessageStore.messages[JoinResult.messageId]
		FromChannelsApiResult = if Message then MessageModelModule.fromChannelsApi(Message, JoinResult.conversationId) else nil
	elseif UseGetConversationFromIdModuleResult and UseGetConversationFromIdModuleResult.messages then
		FromChannelsApiResult = UseGetConversationFromIdModuleResult.messages:Get(JoinResult.messageId)
	end
	local UseReplyingToMessageDispatchModuleResult = UseReplyingToMessageDispatchModule()
	UseLocalUserIdResult = UseLocalUserIdFunction()
	
	if FFlagAppChatUseSwipeForRepliesModule then
		v1 = UseSwipeGestureModule({
			onSwipeThresholdReached = ReactModule.useCallback(function()
				-- upvalues: IsVisibilityMatch (copy), UseTriggerFeedbackResult (copy), HapticFeedbackContext (upval), HapticFeedbackType (upval)
				if not IsVisibilityMatch then
					UseTriggerFeedbackResult(HapticFeedbackContext.Default, HapticFeedbackType.Press)
				end
			end, {}),
			onSwipeComplete = ReactModule.useCallback(function()
				-- upvalues: ChatConversationTelemetryEventsModule (upval), UseTelemetryModuleResult (copy), UseMemoResult1 (copy), IsVisibilityMatch (copy), FFlagAppChatSignalsReplyStoreModule (upval), ReplyingToStoreModule (copy), JoinResult (copy), UseReplyingToMessageDispatchModuleResult (copy), FromChannelsApiResult (ref)
				if ChatConversationTelemetryEventsModule.ConversationMessageSwiped then
					UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationMessageSwiped, UseMemoResult1)
				end
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
	end
	local UseResult2 = ReactModule.useCallback(function()
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
	local UseResult3 = ReactModule.useCallback(function(p2, Input, p3)
		-- upvalues: UseRefResult1 (copy), SetTimeoutFunction (upval), AppChatMessageLongPressDistanceThreshold (upval), Callback (ref)
		if Input then
			UseRefResult1.current = Vector2.new(Input.Position.X, Input.Position.Y)
		end
		SetTimeoutFunction(function()
			-- upvalues: Input (copy), UseRefResult1 (upval), AppChatMessageLongPressDistanceThreshold (upval), Callback (upval), p2 (copy)
			local Distance = if Input then (Vector2.new(Input.Position.X, Input.Position.Y) - UseRefResult1.current).Magnitude else 0
			
			if Input and (Input.UserInputState == Enum.UserInputState.Begin or Input.UserInputState == Enum.UserInputState.Change) and Distance < AppChatMessageLongPressDistanceThreshold then
				Callback(p2, Input)
			end
		end, p3)
	end, { Callback })
	Callback = ReactModule.useCallback(function(Activated, p2, MessageContextMenu)
		-- upvalues: JoinResult (copy), UserInputService (upval), ReactModule (upval), UseStateResult2_1 (copy), UseTelemetryModuleResult (copy), ChatConversationTelemetryEventsModule (upval), UseMemoResult1 (copy), IsVisibilityMatch (copy), FFlagAppChatUseSwipeForRepliesModule (upval), UseTriggerFeedbackResult (copy), HapticFeedbackContext (upval), HapticFeedbackType (upval), UseStateResult2_2 (copy), FFlagAppChatEnableMessageContextMenuModule (upval), UseResult2 (copy), UseResult3 (copy), ChatMessageContainerConstantsModule (upval), UseStateResult3 (copy), GlobalLongPressSignalModule (upval), OptionsEnumModule (upval), FFlagAppChatSignalsReplyStoreModule (upval), ReplyingToStoreModule (copy), UseReplyingToMessageDispatchModuleResult (copy), FromChannelsApiResult (ref)
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
					if not FFlagAppChatUseSwipeForRepliesModule then
						UseTriggerFeedbackResult(HapticFeedbackContext.Default, HapticFeedbackType.Release)
					end
					UseStateResult2_2(true)
					
					if FFlagAppChatEnableMessageContextMenuModule then
						UseResult2()
					end
					UseResult3(ReactModule.Event.InputEnded, p2, ChatMessageContainerConstantsModule.PEEK_VIEW_ANIMATION_MILLISEC)
				end
			end
			if Activated == ReactModule.Event.InputBegan and p2 then
				UseTelemetryModuleResult.emit(ChatConversationTelemetryEventsModule.ConversationMessagePressed, UseMemoResult1)
				
				if not IsVisibilityMatch and not UseStateResult3 then
					GlobalLongPressSignalModule.dismiss()
				end
				UseResult3(ReactModule.Event.TouchLongPress, p2, ChatMessageContainerConstantsModule.LONG_PRESS_DELAY_MILLISEC)
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
				UseResult2()
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
		UserInputService.MouseEnabled, UserInputService.TouchEnabled, UseResult3,
		UseStateResult2_1, UseStateResult2_2, UseStateResult2,
		UseTelemetryModuleResult, UseResult2, UseReplyingToMessageDispatchModuleResult,
		UseTriggerFeedbackResult, IsVisibilityMatch,
		if FFlagAppChatSignalsReplyStoreModule then ReplyingToStoreModule else nil,
		if FFlagAppChatSignalsReplyStoreModule then FromChannelsApiResult else nil,
		if FFlagAppChatSignalsReplyStoreModule then JoinResult.messageId else nil
	})
	UseResult4 = ReactModule.useCallback(function(p2, p3)
		-- upvalues: FFlagAppChatUseSwipeForRepliesModule (upval), UserInputService (upval), v1 (ref), MessageFtuxTooltipDismissSignal (upval), MessageFtuxTooltipVariant (upval), UseResult3 (copy), ReactModule (upval), ChatMessageContainerConstantsModule (upval)
		if FFlagAppChatUseSwipeForRepliesModule and UserInputService.TouchEnabled and v1 then
			v1.onInputBegan(p2, p3)
			MessageFtuxTooltipDismissSignal.dismiss(MessageFtuxTooltipVariant.Replies)
		end
		UseResult3(ReactModule.Event.InputBegan, p3, ChatMessageContainerConstantsModule.INPUT_BEGAN_DELAY_MILLISEC)
	end, { UseResult3, v1 })
	UseResult5 = ReactModule.useCallback(function(_)
		-- upvalues: Callback (ref), ReactModule (upval)
		Callback(ReactModule.Event.InputEnded)
	end, { Callback })
	UseResult6 = ReactModule.useCallback(function(_)
		-- upvalues: Callback (ref), ReactModule (upval)
		Callback(ReactModule.Event.MouseEnter)
	end, { Callback })
	UseResult7 = ReactModule.useCallback(function(_)
		-- upvalues: Callback (ref), ReactModule (upval)
		Callback(ReactModule.Event.MouseLeave)
	end, { Callback })
	UseResult8 = ReactModule.useCallback(function(_)
		-- upvalues: Callback (ref), ReactModule (upval)
		Callback(ReactModule.Event.TouchTap)
	end, { Callback })
	UseResult9 = ReactModule.useCallback(function(_)
		-- upvalues: Callback (ref), ReactModule (upval)
		Callback(ReactModule.Event.MouseButton1Down)
	end, { Callback })
	local SenderTargetId = JoinResult.repliesTo and JoinResult.repliesTo.senderTargetId
	
	local function getDisplayNameText(CombinedNameFromId, CombinedNameFromId1)
		-- upvalues: UseLocalUserIdResult (ref), JoinResult (copy), SenderTargetId (copy), UseGetConversationFromIdModuleResult (ref), ConversationModule (upval)
		local IsUseLocalUserIdResultMatch = UseLocalUserIdResult == JoinResult.senderUserId
		local IsSenderUserIdMatch = JoinResult.senderUserId == JoinResult.repliesTo.senderTargetId
		local IsUseLocalUserIdResultMatch1 = UseLocalUserIdResult == JoinResult.repliesTo.senderTargetId
		
		if not SenderTargetId then
			return CombinedNameFromId
		elseif IsUseLocalUserIdResultMatch and IsSenderUserIdMatch then
			return "Feature.Chat.Label.YouRepliedToYou"
		elseif UseGetConversationFromIdModuleResult.conversationType == ConversationModule.Type.ONE_TO_ONE_CONVERSATION then
			if IsUseLocalUserIdResultMatch and not IsSenderUserIdMatch then
				return "Feature.Chat.Label.OneToOne.YouRepliedToThem"
			elseif not IsUseLocalUserIdResultMatch and IsUseLocalUserIdResultMatch1 then
				return "Feature.Chat.Label.OneToOne.ThemRepliedToYou"
			elseif not IsUseLocalUserIdResultMatch and IsSenderUserIdMatch then
				return "Feature.Chat.Label.OneToOne.ThemRepliedToThem"
			end
		end
		if UseGetConversationFromIdModuleResult.conversationType == ConversationModule.Type.MULTI_USER_CONVERSATION then
			if IsUseLocalUserIdResultMatch and not IsSenderUserIdMatch then
				return {
					"Feature.Chat.Label.Group.YouRepliedToThem",
					DISPLAY_NAME = CombinedNameFromId1
				}
			elseif not IsUseLocalUserIdResultMatch and IsUseLocalUserIdResultMatch1 then
				return {
					"Feature.Chat.Label.Group.ThemRepliedToYou",
					DISPLAY_NAME = CombinedNameFromId
				}
			elseif not IsUseLocalUserIdResultMatch and IsSenderUserIdMatch then
				return {
					"Feature.Chat.Label.Group.ThemRepliedToThem",
					DISPLAY_NAME = CombinedNameFromId
				}
			elseif not IsUseLocalUserIdResultMatch and not IsUseLocalUserIdResultMatch1 then
				return {
					"Feature.Chat.Label.Group.ThemRepliedToOther",
					DISPLAY_NAME_1 = CombinedNameFromId,
					DISPLAY_NAME_2 = CombinedNameFromId1
				}
			end
		end
		return JoinResult.unknownUserKey
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
	local DisplayName = nil
	
	if UseUserProfilesFetchResult.data then
		Flag = false
		local CombinedNameFromId = UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, JoinResult.senderUserId) or JoinResult.unknownUserKey
		DisplayName = if SenderTargetId then getDisplayNameText(CombinedNameFromId, UserProfilesModule.Selectors.getCombinedNameFromId(UseUserProfilesFetchResult.data, JoinResult.repliesTo.senderTargetId) or JoinResult.unknownUserKey) else CombinedNameFromId
	else
		Flag = true
		DisplayName = nil
	end
	local DisplayName1 = UseLocalizationFunction(if SenderTargetId then { displayName = DisplayName } else {}).displayName or DisplayName
	local UseResult10 = ReactModule.useCallback(function(): UDim2
		-- upvalues: JoinResult (copy), ChatMessageContainerConstantsModule (upval), TextService (upval), DisplayName1 (ref), UseStyleResult (copy)
		local TextSize = TextService:GetTextSize(DisplayName1, UseStyleResult.Font.BaseSize * UseStyleResult.Font.Footer.RelativeSize, UseStyleResult.Font.Footer.Font, (Vector2.new(math.max(1, JoinResult.messageMaxWidth - ChatMessageContainerConstantsModule.TAIL_WIDTH), 1e999)))
		
		return UDim2.new(0, TextSize.X, 0, TextSize.Y)
	end, {
		UseStyleResult.Font.BaseSize * UseStyleResult.Font.Footer.RelativeSize,
		UseStyleResult.Font.Footer.Font,
		JoinResult.messageMaxWidth - ChatMessageContainerConstantsModule.TAIL_WIDTH,
		DisplayName1
	})
	local NewMessageTypePaddingOffset = if JoinResult.showDateTime then 0 else (if JoinResult.isNewSender or SenderTargetId then ChatMessageContainerConstantsModule.CHAT_MESSAGE_MAX_SPACE else ChatMessageContainerConstantsModule.CHAT_MESSAGE_MIN_SPACE) + JoinResult.messageTypePaddingOffset
	local Left = UseChatPagePaddingModuleResult.left
	local NewLeft = Left + UseTokensResult.Size.Size_700
	local Left1 = JoinResult.isIncoming and Enum.HorizontalAlignment.Left or Enum.HorizontalAlignment.Right
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: GetFFlagDebugAppChatModule (upval), UseStateResult2_3 (copy)
		if GetFFlagDebugAppChatModule() then
			UseStateResult2_3(function(p2): boolean
				return not p2
			end)
		end
	end, { UseStateResult2_3 })
	local UseStateResult4_1 = UseStateResult4 or (JoinResult.moderated or (JoinResult.filteredForReceivers or IsVisibilityMatch))
	local MessageId = if UseStateResult4 then JoinResult.messageId elseif IsVisibilityMatch then JoinResult.messageHiddenNoticeText else JoinResult.moderated and JoinResult.messageModeratedNoticeText or JoinResult.messageDefaultNoticeText
	local UseMemoResult3 = ReactModule.useMemo(function()
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
		emitImpressionTelemetryEvent = UseResult1
	}) else nil
	local IsIncoming = JoinResult.isIncoming
	local MapResult = if FFlagAppChatUseSwipeForRepliesModule and v1 and v1.swipeProgress then v1.swipeProgress:map(function(p2: number)
		-- upvalues: UseTokensResult (copy)
		return {
			Color3 = UseTokensResult.Color.Content.Default.Color3,
			Transparency = 1 - math.pow(p2, 3)
		}
	end) else nil
	local MapResult1 = if FFlagAppChatUseSwipeForRepliesModule and v1 and v1.swipeOffset then v1.swipeOffset:map(function(p2): UDim2
		-- upvalues: UseMemoResult (ref), SwipeDirectionModule (upval)
		return UDim2.new(0, if UseMemoResult.direction == SwipeDirectionModule.Right then p2 else -p2, 0, 0)
	end) else nil
	local MapResult2 = if FFlagAppChatUseSwipeForRepliesModule and v1 and v1.swipeProgress then v1.swipeProgress:map(function(p2): UDim2
		-- upvalues: UseMemoResult (ref)
		return UseMemoResult.messagePosition + UDim2.new(0, p2 * UseMemoResult.iconOffset, 0, 0)
	end) else nil
	
	local function renderMessage()
		-- upvalues: ReactModule (upval), FFlagAppChatUseSwipeForRepliesModule (upval), MapResult1 (copy), UseResult6 (ref), UseResult7 (ref), NewMessageTypePaddingOffset (ref), JoinResult (copy), Left (copy), NewLeft (copy), UseChatPagePaddingModuleResult (copy), Left1 (copy), FoundationModule (upval), UserTile (upval), LayoutMode (upval), UserPresence (upval), UseResult (copy), UseTokensResult (copy), ShouldShowName (copy), ChatMessageContainerConstantsModule (upval), IsIncoming (copy), SenderTargetId (copy), Flag (ref), UseStyleResult (copy), UseResult10 (copy), DisplayName1 (ref), Skeleton (upval), UseResult4 (ref), UseResult5 (ref), UseResult8 (ref), UseResult9 (ref), UseStateResult (ref), UseMemoResult4 (ref), UseRefResult (copy), IsVisibilityMatch (copy), MessageFtuxTooltip (upval), MessageFtuxTooltipVariant (upval), UseMemoResult (ref), MapResult2 (copy), MapResult (copy)
		local Frame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.Y,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			Position = if FFlagAppChatUseSwipeForRepliesModule then MapResult1 else nil,
			[ReactModule.Event.MouseEnter] = UseResult6,
			[ReactModule.Event.MouseLeave] = UseResult7
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
					["align-y-top"] = false
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
						Font = UseStyleResult.Font.Footer.Font,
						Size = UseResult10(),
						AnchorPoint = if IsIncoming then Vector2.new(0, 0) else Vector2.new(1, 0),
						Position = if IsIncoming then UDim2.fromScale(0, 0) else UDim2.fromScale(1, 0),
						Text = DisplayName1,
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
					Size = UDim2.new(1, JoinResult.isIncoming and -NewLeft or 0, 0, 0)
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
						[ReactModule.Event.InputBegan] = UseResult4,
						[ReactModule.Event.InputEnded] = UseResult5,
						[ReactModule.Event.TouchTap] = UseResult8,
						[ReactModule.Event.MouseButton1Down] = UseResult9
					}, {
						isPressed = UseStateResult,
						Icons = UseMemoResult4,
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
		
		return if FFlagAppChatUseSwipeForRepliesModule and not IsVisibilityMatch then ReactModule.createElement(FoundationModule.View, {
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
		}) else Frame
	end
	
	ReactModule.useEffect(function()
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
		[ReactModule.Event.Activated] = if GetFFlagDebugAppChatModule() then UseResult11 else nil
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