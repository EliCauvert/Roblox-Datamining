local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactModule = require(Parent.Roact)
local WithStyleFunction = require(Parent.UIBlox).Style.withStyle
local MemoizeFunction = require(Parent.AppCommonLib).memoize
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local CoreGui = ReactFocusNavigationModule.EngineInterface.CoreGui
local FocusNavigationService = ReactFocusNavigationModule.FocusNavigationService
local FocusBehaviorsModule = require(Parent.FocusBehaviors)
local UserInputService = game:GetService("UserInputService")
local IXPService = game:GetService("IXPService")
local RoactNavigationModule = require(Parent.RoactNavigation)
local MessageListModule = require(script.Parent.MessageList)
local SignalsMigrationConfigModule = require(AppChat.Flags.SignalsMigrationConfig)
local ReplyComposeBarContainerModule = require(script.Parent.ReplyComposeBarContainer)
local ChatInputBarModule = if require(AppChat.Flags.FFlagAppChatNewChatInputBar) then require(script.Parent.ChatInputBar) else require(script.Parent.ChatInputBarDeprecated)
local UserTypingIndicatorModule = require(script.Parent.UserTypingIndicator)
local NewResult = require(AppChat.Logger):new(script.Name)
local WithChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.withChatPagePadding)
local _ = require(AppChat.Models.ConversationChannels)
local StatusCodes = require(Parent.Http).StatusCodes
local _DateTime = require(Parent.Time).DateTime
local ChatConversationMoreMenuModule = require(script.Parent.ChatConversationMoreMenu)
local KeyboardOffsetEventHandlerModule = require(script.Parent.KeyboardOffsetEventHandler)
local GlobalLongPressSignalModule = require(script.Parent.Utils.GlobalLongPressSignal)
local FFlagAppChatConsoleFocusFixesModule = require(AppChat.Flags.FFlagAppChatConsoleFocusFixes)
local GetReplyingToStoreModule = require(AppChat.Stores.GetReplyingToStore)
local FFlagAppChatSignalsReplyStoreModule = require(AppChat.Flags.FFlagAppChatSignalsReplyStore)
local SmartSuggestionsChipRowContainerModule = require(script.Parent.SmartSuggestions.SmartSuggestionsChipRowContainer)
local FFlagAppChatSmartSuggestionsModule = require(AppChat.Flags.FFlagAppChatSmartSuggestions)
local ConversationExitTypeModule = require(AppChat.Analytics.Enums.ConversationExitType)
local SendMessageErrorModule = require(AppChat.Analytics.Enums.SendMessageError)
local WithRoactChatAnalyticsModule = require(AppChat.LegacyAnalytics.withRoactChatAnalytics)
local ConnectTelemetryModule = require(AppChat.Telemetry.connectTelemetry)
local ChatConversationTelemetryEventsModule = require(script.Parent.ChatConversationTelemetryEvents)
local ChatConversationTelemetryLayerModule = require(AppChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local AppChatNewChatInputBarIxpEnabled = game:DefineFastFlag("AppChatNewChatInputBarIxpEnabled", false)
local AppChatNewChatInputBarIxpLayer = game:DefineFastString("AppChatNewChatInputBarIxpLayer", "")
local FFlagAppChatEnableDoubleOptIn = require(Parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatMessageTTIMilestonesModule = require(AppChat.Flags.FFlagAppChatMessageTTIMilestones)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local ConversationTopModalContainerModule = if FFlagAppChatEnableDoubleOptIn then require(script.Parent.ConversationTopModalContainer) else require(script.Parent.ConversationTopModalContainerDeprecated)
local ConversationBottomModalContainerModule = require(script.Parent.ConversationModal.ConversationBottomModalContainer)
local ChatConversation = RoactModule.PureComponent:extend("ChatConversation")
ChatConversation.defaultProps = {
	topBarHeight = 0,
	conversationId = nil,
	conversationTitle = nil,
	itemList = {},
	inputBoxRef = nil,
	wideMode = false,
	getOlderMessages = function() end,
	isDebugEnabled = false,
	sendMessage = function() end,
	navigateToToast = function() end,
	markConversationAsRead = function() end,
	postTypingStatus = function() end,
	navigateBack = function() end,
	openViewProfile = function() end,
	updateConversationTitle = function() end,
	openGameDetailsPage = function() end,
	navigateToScreen = function() end,
	navigateToSquadLobby = function() end,
	onChatInputBarReady = function() end,
	viewProfileOnAvatarPressed = true,
	chatInputPlaceholder = "Say something",
	usersTyping = {},
	invalidMessageTypeText = "PLACEHOLDER This message could not be displayed",
	messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.",
	messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.",
	newText = "New",
	networkErrorText = "PLACEHOLDER There was a network error, please try again later",
	unknownUserText = "PLACEHOLDER unknown user",
	oneUserTyping = "PLACEHOLDER {DISPLAY_NAME} is typing...",
	twoUsersTyping = "PLACEHOLDER {DISPLAY_NAME_1} and {DISPLAY_NAME_2} are typing...",
	severalUsersTyping = "PLACEHOLDER Several users are typing...",
	bottomModalText = "PLACEHOLDER At this time, Chat is not available with this user.",
	readingMessagesIsEnabled = true,
	onConversationUnmount = function() end,
	chatIsVisible = true,
	moreMenuEnabled = false,
	keyboardOffset = nil,
	replyingToMessageId = nil,
	replyingToMessage = nil,
	replyingToMessageDispatch = function() end,
	shouldShowChatInputBar = true,
	shouldDisableChatInputBar = false,
	shouldShowLegacyBottomModal = false,
	telemetry = { emit = function() end },
	scrollToTopOnInitialOsaLoad = false,
	isInitialMessageLoading = false,
	displayNamesAvailable = true,
	shouldHideMoreMenuButton = false
}

function ChatConversation.init(p1)
	-- upvalues: RoactModule (copy), UserInputService (copy), MemoizeFunction (copy), NewResult (copy), FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), FFlagAppChatSignalsReplyStoreModule (copy), StatusCodes (copy), SendMessageErrorModule (copy), ChatConversationTelemetryEventsModule (copy), _DateTime (copy), ConversationExitTypeModule (copy), GetReplyingToStoreModule (copy), GlobalLongPressSignalModule (copy), FocusNavigationService (copy), CoreGui (copy)
	p1.state = {
		inputBarHeight = 0,
		keyboardOffset = 0,
		conversationBannerHeight = 0,
		messageListHeight = 0,
		bottomModalHeight = 0,
		tooltipText = ""
	}
	p1.inputBoxRef = p1.props.inputBoxRef or RoactModule.createRef()
	p1.inputBarRef = RoactModule.createRef()
	p1.conversationViewRef = RoactModule.createRef()
	p1.messageListRef = RoactModule.createRef()
	
	function p1.getKeyboardOffset()
		-- upvalues: UserInputService (upval), p1 (copy)
		if UserInputService.OnScreenKeyboardVisible and p1.inputBoxRef:getValue() and p1.inputBoxRef:getValue():IsFocused() then
			if p1.props.keyboardOffset ~= nil then
				return p1.props.keyboardOffset
			end
			local Value = p1.conversationViewRef:getValue()
			
			if Value then
				return Value.AbsolutePosition.Y + Value.AbsoluteSize.Y - UserInputService.OnScreenKeyboardPosition.Y
			end
		end
		return 0
	end
	
	function p1.updateKeyboardOffset()
		-- upvalues: p1 (copy)
		if not p1.isMounted then return end
		local KeyboardOffset = p1.getKeyboardOffset()
		
		if p1.state.keyboardOffset ~= KeyboardOffset then
			p1:setState({ keyboardOffset = KeyboardOffset })
		end
	end
	
	function p1.onKeyboardOffsetChanged(KeyboardOffset: number)
		-- upvalues: p1 (copy)
		if not p1.isMounted then return end
		if not p1.inputBoxRef:getValue() or not p1.inputBoxRef:getValue():IsFocused() then
			KeyboardOffset = 0
		end
		if p1.state.keyboardOffset ~= KeyboardOffset then
			p1:setState({ keyboardOffset = KeyboardOffset })
		end
	end
	
	function p1.clearKeyboardOffset()
		-- upvalues: p1 (copy)
		p1:setState({ keyboardOffset = 0 })
	end
	
	p1.loadNext = MemoizeFunction(function(Callback, p2)
		-- upvalues: p1 (copy)
		return function()
			-- upvalues: Callback (copy), p2 (copy), p1 (upval)
			local CallbackResult = Callback(p2)
			
			if CallbackResult then
				CallbackResult:catch(function()
					-- upvalues: p1 (upval)
					p1.showNetworkErrorToast()
				end)
			end
		end
	end)
	p1.markAsRead = MemoizeFunction(function(Callback, p2)
		-- upvalues: p1 (copy)
		return function()
			-- upvalues: p1 (upval), Callback (copy), p2 (copy)
			if p1.props.readingMessagesIsEnabled then
				Callback(p2)
			end
		end
	end)
	
	function p1.showNetworkErrorToast()
		-- upvalues: p1 (copy)
		p1.props.navigateToToast({
			toastProps = {
				toastContent = { toastTitle = p1.props.networkErrorText }
			}
		})
	end
	
	p1.onSendChat = MemoizeFunction(function(Callback1, p2, Callback3, p3, p4, Callback2, Callback, p5)
		-- upvalues: NewResult (upval), FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), AppChatPerfTrackerModule (upval), FFlagAppChatSignalsReplyStoreModule (upval), p1 (copy), StatusCodes (upval), SendMessageErrorModule (upval), ChatConversationTelemetryEventsModule (upval), _DateTime (upval)
		return function(p6)
			-- upvalues: p4 (copy), NewResult (upval), p2 (ref), Callback2 (copy), p3 (copy), Callback (copy), FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), AppChatPerfTrackerModule (upval), FFlagAppChatSignalsReplyStoreModule (upval), p1 (upval), Callback1 (copy), StatusCodes (upval), Callback3 (copy), SendMessageErrorModule (upval), p5 (copy), ChatConversationTelemetryEventsModule (upval), _DateTime (upval)
			if p4 and p4.source == "friends" then
				NewResult:info("Creating a conversation for friend conversation {} via onSendChat", p2)
				local v1, v2 = Callback2(p2, p3):await()
				
				if not v1 or not v2 then
					NewResult:error("Could not create conversation. Error: {}", (tostring(v2)))
					
					return
				end
				NewResult:debug("Created conversation {} for friend conversation {} via onSendChat", v2.id, p2)
				p2 = v2.id
				Callback(v2.id)
			end
			NewResult:info("Sending message '{}' to conversationId {} via onSendChat", p6, p2)
			
			if FFlagAppChatPerfTrackingModule then
				if FFlagAppChatMessageTTIMilestonesModule then
					AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.MessageSendTTI, { conversationId = tostring(p2) })
				else
					AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.MessageSendToPendingRender, { conversationId = tostring(p2) })
					AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.MessageSendToFinalRender, { conversationId = tostring(p2) })
				end
			end
			local CallbackResult = Callback1(p2, p6, if FFlagAppChatSignalsReplyStoreModule and p1.props.replyingToMessageId then { id = p1.props.replyingToMessageId } elseif FFlagAppChatSignalsReplyStoreModule then nil else p1.props.replyingToMessage)
			
			if CallbackResult then
				CallbackResult:andThen(function(Result)
					-- upvalues: StatusCodes (upval), p1 (upval), Callback3 (upval), p2 (upval)
					if Result and Result.StatusCode == StatusCodes.CONFLICT then
						p1.showNetworkErrorToast()
						
						return
					end
					if Callback3 then
						Callback3(p2)
					end
				end)
			elseif Callback3 then
				Callback3(p2)
			end
			p1.closeReplying()
			local config = {
				messageSentResult = SendMessageErrorModule.OtherFailure,
				recipientIds = p1.props.recipientIdsSerialized
			}
			
			if CallbackResult then
				CallbackResult:andThen(function(Result)
					-- upvalues: SendMessageErrorModule (upval), StatusCodes (upval), _DateTime (upval), p5 (upval), ChatConversationTelemetryEventsModule (upval), p1 (upval)
					local Id = nil
					local Id1 = nil
					local SenderUserId = nil
					local TargetMessageSentAt: string? = nil
					local CountContent = nil
					local StatusCode = Result and Result.StatusCode
					local NoResponse = nil
					
					if Result then
						if StatusCode == StatusCodes.CONFLICT then
							NoResponse = SendMessageErrorModule.Conflict
						elseif Result.responseBody then
							if Result.responseBody.messages and #Result.responseBody.messages ~= 0 then
								if Result.responseBody.messages[1].status then
									NoResponse = Result.responseBody.messages[1].status
									Id = Result.responseBody.messages[1].id
									
									if Result.responseBody.messages[1].replies_to then
										local RepliesTo = Result.responseBody.messages[1].replies_to
										Id1 = RepliesTo.id
										SenderUserId = RepliesTo.sender_user_id
										TargetMessageSentAt = tostring(_DateTime.fromIsoDate(RepliesTo.created_at).dateTime)
										CountContent = if RepliesTo.content then #RepliesTo.content else nil
									end
								else
									NoResponse = SendMessageErrorModule.NoMessageStatus
								end
							else
								NoResponse = SendMessageErrorModule.NoMessages
							end
						else
							NoResponse = SendMessageErrorModule.NoResponseBody
						end
					else
						NoResponse = SendMessageErrorModule.NoResponse
					end
					p5.emit(ChatConversationTelemetryEventsModule.ConversationMessageSent, {
						messageSentResult = NoResponse,
						messageId = Id,
						recipientIds = p1.props.recipientIdsSerialized,
						targetMessageId = Id1,
						targetMessageSenderId = SenderUserId,
						targetMessageSentAt = TargetMessageSentAt,
						targetMessageLength = CountContent
					})
				end):catch(function()
					-- upvalues: p5 (upval), ChatConversationTelemetryEventsModule (upval), config (copy)
					p5.emit(ChatConversationTelemetryEventsModule.ConversationMessageSent, config)
				end)
				
				return
			else
				p5.emit(ChatConversationTelemetryEventsModule.ConversationMessageSent, config)
			end
		end
	end)
	p1.onSendBtnClicked = MemoizeFunction(function(p2)
		-- upvalues: ChatConversationTelemetryEventsModule (upval)
		return function(SendBtnClickResult)
			-- upvalues: p2 (copy), ChatConversationTelemetryEventsModule (upval)
			p2.emit(ChatConversationTelemetryEventsModule.ConversationSendBtnClicked, { sendBtnClickResult = SendBtnClickResult })
		end
	end)
	
	function p1.isMoreMenuEnabled()
		-- upvalues: p1 (copy)
		return p1.props.moreMenuEnabled
	end
	
	p1.reportInputBarReady = if FFlagAppChatPerfTrackingModule then function(p2: number)
		-- upvalues: p1 (copy)
		if p1.props.onChatInputBarReady and p1.props.shouldShowChatInputBar and p2 > 0 then
			p1.props.onChatInputBarReady()
		end
	end else nil
	
	function p1.onHeightChanged(Frame: Frame)
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), p1 (copy)
		if FFlagAppChatPerfTrackingModule then
			p1.reportInputBarReady(Frame.AbsoluteSize.Y)
		end
		p1:setState(function(p2, _)
			-- upvalues: Frame (copy)
			return if Frame.AbsoluteSize.Y == p2.inputBarHeight then {} else { inputBarHeight = Frame.AbsoluteSize.Y }
		end)
	end
	
	p1.lastTypingRequest = 0
	
	function p1.chatInputTextChanged()
		-- upvalues: p1 (copy)
		if p1.props.conversation and p1.props.conversation.source == "friends" then return end
		local CurrentTime = tick()
		
		if CurrentTime - p1.lastTypingRequest >= 3 then
			p1.lastTypingRequest = CurrentTime
			p1.props.postTypingStatus(p1.props.conversationId, true)
		end
	end
	
	p1.exitTypeForAnalytics = ConversationExitTypeModule.Default
	
	function p1.fireAnalyticsEventOnUnmount()
		-- upvalues: p1 (copy), ConversationExitTypeModule (upval)
		p1.props.onConversationUnmount(p1.exitTypeForAnalytics)
		p1.exitTypeForAnalytics = ConversationExitTypeModule.Default
	end
	
	function p1.closeKeyboard()
		-- upvalues: p1 (copy)
		if p1.inputBoxRef:getValue() then
			p1.inputBoxRef:getValue():ReleaseFocus()
		end
	end
	
	function p1.closeReplying()
		-- upvalues: FFlagAppChatSignalsReplyStoreModule (upval), GetReplyingToStoreModule (upval), p1 (copy)
		if FFlagAppChatSignalsReplyStoreModule then
			GetReplyingToStoreModule(false).clear()
			
			return
		else
			p1.props.replyingToMessageDispatch(nil)
		end
	end
	
	function p1.onPointerInput()
		-- upvalues: GlobalLongPressSignalModule (upval), p1 (copy)
		GlobalLongPressSignalModule.dismiss()
		p1.closeKeyboard()
	end
	
	function p1.onSizeChange()
		-- upvalues: p1 (copy)
		p1.updateKeyboardOffset()
	end
	
	function p1.calculateScrollOffset(ScrollFrame)
		return ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.CanvasPosition.Y - ScrollFrame.AbsoluteWindowSize.Y
	end
	
	function p1.setBannerHeight(ConversationBannerHeight)
		-- upvalues: p1 (copy)
		p1:setState({ conversationBannerHeight = ConversationBannerHeight })
	end
	
	function p1.setBottomModalHeight(BottomModalHeight)
		-- upvalues: p1 (copy)
		p1:setState({ bottomModalHeight = BottomModalHeight })
	end
	
	function p1.onMessageListSizeChange(Frame)
		-- upvalues: p1 (copy)
		p1:setState({ messageListHeight = Frame.AbsoluteSize.Y })
	end
	
	p1.focusNavigationService = FocusNavigationService.new(CoreGui)
end

function ChatConversation.didMount(p1)
	-- upvalues: FFlagAppChatConsoleFocusFixesModule (copy), FocusBehaviorsModule (copy), AppChatNewChatInputBarIxpEnabled (copy), IXPService (copy), AppChatNewChatInputBarIxpLayer (copy)
	p1.isMounted = true
	p1.markAsRead(p1.props.markConversationAsRead, p1.props.conversationId)()
	local Value = p1.inputBarRef:getValue()
	p1.focusNavigationService:registerFocusBehavior(p1.conversationViewRef:getValue(), if FFlagAppChatConsoleFocusFixesModule then FocusBehaviorsModule.default(Value) else FocusBehaviorsModule.mostRecentOrDefault(Value))
	
	if not p1.props.wideMode and p1.focusNavigationService.focusedGuiObject:getValue() ~= nil then
		p1.focusNavigationService:focusGuiObject(Value)
	end
	if AppChatNewChatInputBarIxpEnabled and p1.props.shouldShowChatInputBar then
		IXPService:LogFlagLinkedUserLayerExposure(AppChatNewChatInputBarIxpLayer)
	end
end

function ChatConversation.willUpdate(p1, p2, _)
	if p2.chatIsVisible ~= p1.props.chatIsVisible and not p2.chatIsVisible then
		p1.closeKeyboard()
	end
end

function ChatConversation.didUpdate(p1, DefaultProps, p2)
	-- upvalues: FFlagAppChatConsoleFocusFixesModule (copy), FFlagAppChatSignalsReplyStoreModule (copy), FFlagAppChatPerfTrackingModule (copy)
	if p1.props.wideMode and p1.props.navigation.getParam("navigatedWithFocus") then
		local Value = p1.inputBarRef:getValue()
		p1.props.navigation.setParams({ navigatedWithFocus = false })
		p1.focusNavigationService:focusGuiObject(Value)
	end
	if FFlagAppChatConsoleFocusFixesModule and DefaultProps.conversationId == p1.props.conversationId then
		local ReplyingToMessageId = if FFlagAppChatSignalsReplyStoreModule then DefaultProps.replyingToMessageId else DefaultProps.replyingToMessage
		local ReplyingToMessageId1 = if FFlagAppChatSignalsReplyStoreModule then p1.props.replyingToMessageId else p1.props.replyingToMessage
		
		if ReplyingToMessageId1 ~= nil and ReplyingToMessageId1 ~= ReplyingToMessageId and p1.focusNavigationService.focusedGuiObject:getValue() ~= nil then
			local Value = p1.inputBarRef:getValue()
			
			if Value then
				p1.focusNavigationService:focusGuiObject(Value)
			end
		end
	end
	if DefaultProps.conversationId ~= p1.props.conversationId then
		if FFlagAppChatPerfTrackingModule then
			p1.reportInputBarReady(p1.state.inputBarHeight)
		end
		if p1.inputBoxRef:getValue() then
			p1.inputBoxRef:getValue().Text = ""
			p1.inputBoxRef:getValue():ReleaseFocus()
		end
		p1.closeReplying()
		p1.markAsRead(p1.props.markConversationAsRead, p1.props.conversationId, false)()
	end
	if FFlagAppChatPerfTrackingModule and DefaultProps.shouldShowChatInputBar ~= p1.props.shouldShowChatInputBar then
		p1.reportInputBarReady(p1.state.inputBarHeight)
	end
	local ListRef = p1.messageListRef and (p1.messageListRef.current and p1.messageListRef.current._listRef)
	local NativeScrollRef = ListRef and (ListRef._scrollRef and ListRef._scrollRef.getNativeScrollRef())
	local MessageListHeightDelta = p1.state.messageListHeight - p2.messageListHeight
	
	if ListRef and NativeScrollRef and p2.messageListHeight ~= 0 and MessageListHeightDelta ~= 0 then
		local ScrollOffset: number = p1.calculateScrollOffset(NativeScrollRef._nativeRef.current)
		
		if ScrollOffset <= 0 then return end
		ListRef:scrollToOffset({ offset = ScrollOffset + MessageListHeightDelta })
	end
end

function ChatConversation.willUnmount(p1)
	p1.fireAnalyticsEventOnUnmount()
	p1.closeReplying()
	p1.keyboardConnections = {}
	p1.isMounted = false
	p1.focusNavigationService:teardown()
end

function ChatConversation.render(p1)
	-- upvalues: SignalsMigrationConfigModule (copy), RoactModule (copy), AppChat (copy), WithRoactChatAnalyticsModule (copy), WithStyleFunction (copy), WithChatPagePaddingModule (copy), KeyboardOffsetEventHandlerModule (copy), ConversationTopModalContainerModule (copy), FFlagAppChatEnableDoubleOptIn (copy), MessageListModule (copy), UserTypingIndicatorModule (copy), ReactModule (copy), FoundationModule (copy), FFlagAppChatSignalsReplyStoreModule (copy), FFlagAppChatSmartSuggestionsModule (copy), SmartSuggestionsChipRowContainerModule (copy), ReplyComposeBarContainerModule (copy), ChatConversationMoreMenuModule (copy), ChatInputBarModule (copy), ConversationBottomModalContainerModule (copy)
	local DisplayNamesAvailable = #p1.props.usersTyping > 0 and p1.props.displayNamesAvailable
	local IsFriends: boolean = if p1.props.conversation then p1.props.conversation.source == "friends" else false
	local Text = "MessageList" .. tostring(p1.props.conversationId)
	local Element = if SignalsMigrationConfigModule.shouldUseViewRecyclerMessageList and p1.props.conversationId ~= nil then RoactModule.createElement(require(AppChat.Components.MessageListV2.MessageListV2Container), {
		conversationId = p1.props.conversationId,
		itemList = p1.props.itemList,
		loadNext = if IsFriends then nil else p1.loadNext(p1.props.getOlderMessages, p1.props.conversationId),
		markAsRead = p1.markAsRead(p1.props.markConversationAsRead, p1.props.conversationId),
		closeKeyboard = p1.closeKeyboard,
		onDetailsOpened = p1.closeKeyboard,
		inputBoxRef = p1.inputBoxRef,
		openGameDetailsPage = p1.props.openGameDetailsPage,
		openMomentsDeepLink = p1.props.openMomentsDeepLink,
		openViewProfile = p1.props.openViewProfile,
		viewProfileOnAvatarPressed = p1.props.viewProfileOnAvatarPressed,
		wideMode = p1.props.wideMode,
		isDebugEnabled = p1.props.isDebugEnabled,
		readingMessagesIsEnabled = p1.props.readingMessagesIsEnabled,
		isInitialMessageLoading = p1.props.isInitialMessageLoading,
		openAtStart = p1.props.openMessageListAtStart,
		invalidMessageTypeText = p1.props.invalidMessageTypeText,
		messageDefaultNoticeText = p1.props.messageDefaultNoticeText,
		messageModeratedNoticeText = p1.props.messageModeratedNoticeText,
		messageHiddenNoticeText = p1.props.messageHiddenNoticeText,
		unknownUserText = p1.props.unknownUserText
	}) else nil
	
	return WithRoactChatAnalyticsModule(function(p2)
		-- upvalues: WithStyleFunction (upval), WithChatPagePaddingModule (upval), p1 (copy), RoactModule (upval), KeyboardOffsetEventHandlerModule (upval), ConversationTopModalContainerModule (upval), FFlagAppChatEnableDoubleOptIn (upval), Element (copy), Text (copy), MessageListModule (upval), IsFriends (copy), DisplayNamesAvailable (copy), UserTypingIndicatorModule (upval), ReactModule (upval), FoundationModule (upval), FFlagAppChatSignalsReplyStoreModule (upval), FFlagAppChatSmartSuggestionsModule (upval), SmartSuggestionsChipRowContainerModule (upval), ReplyComposeBarContainerModule (upval), ChatConversationMoreMenuModule (upval), ChatInputBarModule (upval), ConversationBottomModalContainerModule (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: WithChatPagePaddingModule (upval), p1 (upval), RoactModule (upval), KeyboardOffsetEventHandlerModule (upval), ConversationTopModalContainerModule (upval), FFlagAppChatEnableDoubleOptIn (upval), Element (upval), Text (upval), MessageListModule (upval), IsFriends (upval), DisplayNamesAvailable (upval), UserTypingIndicatorModule (upval), ReactModule (upval), FoundationModule (upval), FFlagAppChatSignalsReplyStoreModule (upval), FFlagAppChatSmartSuggestionsModule (upval), SmartSuggestionsChipRowContainerModule (upval), ReplyComposeBarContainerModule (upval), ChatConversationMoreMenuModule (upval), ChatInputBarModule (upval), p2 (copy), ConversationBottomModalContainerModule (upval)
			return WithChatPagePaddingModule(function(p4)
				-- upvalues: p1 (upval), RoactModule (upval), p3 (copy), KeyboardOffsetEventHandlerModule (upval), ConversationTopModalContainerModule (upval), FFlagAppChatEnableDoubleOptIn (upval), Element (upval), Text (upval), MessageListModule (upval), IsFriends (upval), DisplayNamesAvailable (upval), UserTypingIndicatorModule (upval), ReactModule (upval), FoundationModule (upval), FFlagAppChatSignalsReplyStoreModule (upval), FFlagAppChatSmartSuggestionsModule (upval), SmartSuggestionsChipRowContainerModule (upval), ReplyComposeBarContainerModule (upval), ChatConversationMoreMenuModule (upval), ChatInputBarModule (upval), p2 (upval), ConversationBottomModalContainerModule (upval)
				return RoactModule.createElement("TextButton", {
					AutoButtonColor = false,
					BackgroundColor3 = p3.Theme.BackgroundDefault.Color,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					Text = "",
					Transparency = p3.Tokens.Color.None.Transparency,
					[RoactModule.Event.TouchTap] = p1.onPointerInput,
					[RoactModule.Event.MouseButton1Down] = p1.onPointerInput,
					[RoactModule.Ref] = p1.conversationViewRef,
					Selectable = false
				}, {
					KeyboardOffsetEventHandler = RoactModule.createElement(KeyboardOffsetEventHandlerModule, {
						onKeyboardOffsetChanged = p1.onKeyboardOffsetChanged,
						parentViewRef = p1.conversationViewRef
					}),
					Layout = RoactModule.createElement("UIListLayout", {
						HorizontalAlignment = if p1.isMoreMenuEnabled() then nil else Enum.HorizontalAlignment.Right,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					ConversationTopModal = RoactModule.createElement(ConversationTopModalContainerModule, {
						layoutOrder = 1,
						conversationId = if FFlagAppChatEnableDoubleOptIn then p1.props.conversationId else nil,
						conversation = if FFlagAppChatEnableDoubleOptIn then nil else p1.props.conversation,
						navigateToScreen = if FFlagAppChatEnableDoubleOptIn then nil else p1.props.navigateToScreen,
						setModalHeight = p1.setBannerHeight
					}),
					MessageListFrame = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 2,
						[RoactModule.Change.AbsoluteSize] = p1.onMessageListSizeChange,
						Size = UDim2.new(1, 0, 1, -p1.state.inputBarHeight - p1.state.keyboardOffset - p1.state.conversationBannerHeight - p1.state.bottomModalHeight)
					}, {
						MessageListV2 = Element,
						[Text] = Element == nil and RoactModule.createElement(MessageListModule, {
							bottomMargin = 28,
							Size = UDim2.new(1, 0, 1, 0),
							conversationId = p1.props.conversationId,
							isDebugEnabled = p1.props.isDebugEnabled,
							itemList = p1.props.itemList,
							loadNext = if IsFriends then nil else p1.loadNext(p1.props.getOlderMessages, p1.props.conversationId),
							localUserId = p1.props.localUserId,
							markAsRead = p1.markAsRead(p1.props.markConversationAsRead, p1.props.conversationId),
							messageListRef = p1.messageListRef,
							openViewProfile = p1.props.openViewProfile,
							onDetailsOpened = p1.closeKeyboard,
							closeKeyboard = p1.closeKeyboard,
							inputBoxRef = p1.inputBoxRef,
							wideMode = p1.props.wideMode,
							viewProfileOnAvatarPressed = p1.props.viewProfileOnAvatarPressed,
							readingMessagesIsEnabled = p1.props.readingMessagesIsEnabled,
							invalidMessageTypeText = p1.props.invalidMessageTypeText,
							messageDefaultNoticeText = p1.props.messageDefaultNoticeText,
							messageModeratedNoticeText = p1.props.messageModeratedNoticeText,
							messageHiddenNoticeText = p1.props.messageHiddenNoticeText,
							unknownUserText = p1.props.unknownUserText,
							openGameDetailsPage = p1.props.openGameDetailsPage,
							openMomentsDeepLink = p1.props.openMomentsDeepLink,
							scrollToTopOnInitialOsaLoad = p1.props.scrollToTopOnInitialOsaLoad,
							isInitialMessageLoading = p1.props.isInitialMessageLoading
						}),
						UserTypingIndicator = DisplayNamesAvailable and RoactModule.createElement(UserTypingIndicatorModule, {
							ZIndex = 2,
							height = 28,
							AnchorPoint = Vector2.new(0, 1),
							Position = UDim2.new(0, 0, 1, 0),
							usersTyping = p1.props.usersTyping,
							oneUserTyping = p1.props.oneUserTyping,
							twoUsersTyping = p1.props.twoUsersTyping,
							severalUsersTyping = p1.props.severalUsersTyping
						})
					}),
					ReplyAndInputContainer = ReactModule.createElement(FoundationModule.View, {
						LayoutOrder = 3,
						tag = {
							["col size-full-0 auto-y gap-medium padding-y-medium"] = true,
							["bg-surface-100"] = if FFlagAppChatSignalsReplyStoreModule then p1.props.replyingToMessageId ~= nil else p1.props.replyingToMessage
						},
						onAbsoluteSizeChanged = p1.onHeightChanged,
						padding = {
							left = UDim.new(0, p4.left),
							right = if p1.isMoreMenuEnabled() then if p1.props.shouldDisableChatInputBar then UDim.new(0, p4.right) else UDim.new(0, (math.max(p4.right - 6, 0))) else nil
						}
					}, {
						SmartSuggestionsChipRow = if FFlagAppChatSmartSuggestionsModule then ReactModule.createElement(SmartSuggestionsChipRowContainerModule, {
							LayoutOrder = 0,
							conversationId = p1.props.conversationId,
							sendMessage = p1.props.sendMessage,
							sendGameLinkChatMessage = p1.props.sendGameLinkChatMessage
						}) else nil,
						ReplyComposeBar = if if FFlagAppChatSignalsReplyStoreModule then p1.props.replyingToMessageId else p1.props.replyingToMessage then RoactModule.createElement(ReplyComposeBarContainerModule, {
							LayoutOrder = 1,
							message = if FFlagAppChatSignalsReplyStoreModule then nil else p1.props.replyingToMessage,
							close = p1.closeReplying,
							inputBoxRef = p1.inputBoxRef
						}) else nil,
						Divider = if p1.isMoreMenuEnabled() and not p1.props.shouldShowChatInputBar and not p1.props.shouldHideMoreMenuButton then ReactModule.createElement(FoundationModule.View, {
							LayoutOrder = 4,
							tag = "size-full-0 auto-y stroke-standard stroke-default"
						}) else nil,
						ActionInputContainer = if p1.isMoreMenuEnabled() then ReactModule.createElement(FoundationModule.View, {
							LayoutOrder = 2,
							tag = "size-full-0 row gap-small auto-y align-y-center"
						}, {
							MoreMenu = if p1.props.shouldHideMoreMenuButton then nil else RoactModule.createElement(ChatConversationMoreMenuModule, {
								layoutOrder = 1,
								conversation = p1.props.conversation,
								conversationId = p1.props.conversationId,
								navigateToSquadLobby = p1.props.navigateToSquadLobby,
								showButtonText = not p1.props.shouldShowChatInputBar,
								tooltipText = p1.state.tooltipText
							}),
							ChatInputBar = if p1.props.shouldShowChatInputBar then RoactModule.createElement(ChatInputBarModule, {
								LayoutOrder = 2,
								onFocusLost = p1.clearKeyboardOffset,
								conversationId = p1.props.conversationId,
								inputBoxRef = p1.inputBoxRef,
								inputBarRef = p1.inputBarRef,
								localUserId = p1.props.localUserId,
								messageListRef = p1.messageListRef,
								onSendChat = p1.onSendChat(p1.props.sendMessage, p1.props.conversationId, p1.props.markConversationAsRead, p2, p1.props.conversation, p1.props.createFriendConversation, p1.props.navigateToChatConversation, p1.props.telemetry),
								onSendBtnClicked = p1.onSendBtnClicked(p1.props.telemetry),
								onTextChanged = p1.chatInputTextChanged,
								placeholderText = p1.props.chatInputPlaceholder,
								isDisabled = p1.props.shouldDisableChatInputBar,
								inputBarDisabledText = p1.props.inputBarDisabledText,
								disabledEndTimestampDisplay = p1.props.inputBarDisabledEndTimestampDisplay,
								onDisabledInputBarActivated = p1.props.onDisabledInputBarActivated,
								moreMenuEnabled = p1.isMoreMenuEnabled()
							}) else nil
						}) else nil,
						ChatInputBar = if p1.isMoreMenuEnabled() or not p1.props.shouldShowChatInputBar then nil else RoactModule.createElement(ChatInputBarModule, {
							LayoutOrder = 4,
							onFocusLost = p1.clearKeyboardOffset,
							conversationId = p1.props.conversationId,
							inputBoxRef = p1.inputBoxRef,
							inputBarRef = p1.inputBarRef,
							localUserId = p1.props.localUserId,
							messageListRef = p1.messageListRef,
							onSendChat = p1.onSendChat(p1.props.sendMessage, p1.props.conversationId, p1.props.markConversationAsRead, p2, p1.props.conversation, p1.props.createFriendConversation, p1.props.navigateToChatConversation, p1.props.telemetry),
							onSendBtnClicked = p1.onSendBtnClicked(p1.props.telemetry),
							onTextChanged = p1.chatInputTextChanged,
							placeholderText = p1.props.chatInputPlaceholder,
							isDisabled = p1.props.shouldDisableChatInputBar,
							inputBarDisabledText = p1.props.inputBarDisabledText,
							disabledEndTimestampDisplay = p1.props.inputBarDisabledEndTimestampDisplay,
							onDisabledInputBarActivated = p1.props.onDisabledInputBarActivated,
							moreMenuEnabled = p1.isMoreMenuEnabled()
						})
					}),
					BottomModal = ReactModule.createElement(ConversationBottomModalContainerModule, {
						layoutOrder = 5,
						conversationId = p1.props.conversationId,
						onHeightChanged = p1.setBottomModalHeight,
						legacyBottomModalText = p1.props.bottomModalText,
						shouldShowLegacyBottomModal = p1.props.shouldShowLegacyBottomModal,
						shouldShowChatInputBar = p1.props.shouldShowChatInputBar
					})
				})
			end)
		end)
	end)
end

return ConnectTelemetryModule(ChatConversationTelemetryLayerModule.Context)(RoactNavigationModule.withNavigation(ChatConversation))