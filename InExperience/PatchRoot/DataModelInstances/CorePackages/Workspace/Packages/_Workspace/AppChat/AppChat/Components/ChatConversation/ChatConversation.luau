local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactModule = require(parent.Roact)
local withStyle = require(parent.UIBlox).Style.withStyle
local memoize = require(parent.AppCommonLib).memoize
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local coreGui = reactFocusNavigationModule.EngineInterface.CoreGui
local focusNavigationService = reactFocusNavigationModule.FocusNavigationService
local focusBehaviorsModule = require(parent.FocusBehaviors)
local userInputService = game:GetService("UserInputService")
local IXPService = game:GetService("IXPService")
local roactNavigationModule = require(parent.RoactNavigation)
local messageListModule = require(script.Parent.MessageList)
local replyComposeBarContainerModule = require(script.Parent.ReplyComposeBarContainer)
local var1 = if require(appChat.Flags.FFlagAppChatNewChatInputBar) then require(script.Parent.ChatInputBar) else require(script.Parent.ChatInputBarDeprecated)
local userTypingIndicatorModule = require(script.Parent.UserTypingIndicator)
local name = require(appChat.Logger):new(script.Name)
local withChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.withChatPagePadding)
local _ = require(appChat.Models.ConversationChannels)
local statusCodes = require(parent.Http).StatusCodes
local dateTime = require(parent.Time).DateTime
local chatConversationMoreMenuModule = require(script.Parent.ChatConversationMoreMenu)
local keyboardOffsetEventHandlerModule = require(script.Parent.KeyboardOffsetEventHandler)
local globalLongPressSignalModule = require(script.Parent.Utils.GlobalLongPressSignal)
local getReplyingToStoreModule = require(appChat.Stores.GetReplyingToStore)
local fFlagAppChatSignalsReplyStoreModule = require(appChat.Flags.FFlagAppChatSignalsReplyStore)
local fFlagAppChatReplyComposeBarContainerModule = require(appChat.Flags.FFlagAppChatReplyComposeBarContainer)
local smartSuggestionsChipRowContainerModule = require(script.Parent.SmartSuggestions.SmartSuggestionsChipRowContainer)
local fFlagAppChatSmartSuggestionsModule = require(appChat.Flags.FFlagAppChatSmartSuggestions)
local conversationExitTypeModule = require(appChat.Analytics.Enums.ConversationExitType)
local sendMessageErrorModule = require(appChat.Analytics.Enums.SendMessageError)
local withRoactChatAnalyticsModule = require(appChat.LegacyAnalytics.withRoactChatAnalytics)
local connectTelemetryModule = require(appChat.Telemetry.connectTelemetry)
local chatConversationTelemetryEventsModule = require(script.Parent.ChatConversationTelemetryEvents)
local chatConversationTelemetryLayerModule = require(appChat.Telemetry.Layers.ChatConversationTelemetryLayer)
local appChatNewChatInputBarIxpEnabled = game:DefineFastFlag("AppChatNewChatInputBarIxpEnabled", false)
local appChatNewChatInputBarIxpLayer = game:DefineFastString("AppChatNewChatInputBarIxpLayer", "")
local fFlagAppChatEnableDoubleOptIn = require(parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local fFlagAppChatUseSwipeForRepliesModule = require(appChat.Flags.FFlagAppChatUseSwipeForReplies)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fFlagAppChatMessageTTIMilestonesModule = require(appChat.Flags.FFlagAppChatMessageTTIMilestones)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local var2 = if fFlagAppChatEnableDoubleOptIn then require(script.Parent.ConversationTopModalContainer) else require(script.Parent.ConversationTopModalContainerDeprecated)
local conversationBottomModalContainerModule = require(script.Parent.ConversationModal.ConversationBottomModalContainer)
local chatConversation = roactModule.PureComponent:extend("ChatConversation")
chatConversation.defaultProps = {
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

function chatConversation.init(p1)
	-- upvalues: roactModule (ref), userInputService (ref), memoize (ref), name (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), statusCodes (ref), sendMessageErrorModule (ref), chatConversationTelemetryEventsModule (ref), dateTime (ref), fFlagAppChatReplyComposeBarContainerModule (ref), conversationExitTypeModule (ref), fFlagAppChatUseSwipeForRepliesModule (ref), getReplyingToStoreModule (ref), globalLongPressSignalModule (ref), focusNavigationService (ref), coreGui (ref)
	p1.state = {
		inputBarHeight = 0,
		keyboardOffset = 0,
		replyComposeBarHeight = 0,
		conversationBannerHeight = 0,
		messageListHeight = 0,
		bottomModalHeight = 0,
		tooltipText = ""
	}
	p1.inputBoxRef = p1.props.inputBoxRef or roactModule.createRef()
	p1.inputBarRef = roactModule.createRef()
	p1.conversationViewRef = roactModule.createRef()
	p1.messageListRef = roactModule.createRef()
	
	function p0.getKeyboardOffset()
		-- upvalues: userInputService (copy), p1 (ref)
		if userInputService.OnScreenKeyboardVisible and p1.inputBoxRef:getValue() and p1.inputBoxRef:getValue():IsFocused() then
			if p1.props.keyboardOffset ~= nil then
				return p1.props.keyboardOffset
			end
			local value = p1.conversationViewRef:getValue()
			
			return if value then value.AbsolutePosition.Y + value.AbsoluteSize.Y - userInputService.OnScreenKeyboardPosition.Y else 0
		end
	end
	
	function p0.updateKeyboardOffset()
		-- upvalues: p1 (ref)
		if not p1.isMounted then return end
		local keyboardOffset = p1.getKeyboardOffset()
		
		if p1.state.keyboardOffset ~= keyboardOffset then
			p1:setState({ keyboardOffset = keyboardOffset })
		end
	end
	
	function p0.onKeyboardOffsetChanged(p2)
		-- upvalues: p1 (ref)
		if not p1.isMounted then return end
		if not p1.inputBoxRef:getValue() or not p1.inputBoxRef:getValue():IsFocused() then
			p2 = 0
		end
		if p1.state.keyboardOffset ~= p2 then
			p1:setState({ keyboardOffset = p2 })
		end
	end
	
	function p0.clearKeyboardOffset()
		-- upvalues: p1 (ref)
		p1:setState({ keyboardOffset = 0 })
	end
	
	p1.loadNext = memoize(function(p2, p3)
		-- upvalues: p1 (ref)
		return function()
			-- upvalues: p2 (ref), p3 (ref), p1 (copy)
			local var3 = p2(p3)
			
			if var3 then
				var3:catch(function()
					-- upvalues: p1 (copy)
					p1.showNetworkErrorToast()
				end)
			end
		end
	end)
	p1.markAsRead = memoize(function(p2, p3)
		-- upvalues: p1 (ref)
		return function()
			-- upvalues: p1 (copy), p2 (ref), p3 (ref)
			if p1.props.readingMessagesIsEnabled then
				p2(p3)
			end
		end
	end)
	
	function p0.showNetworkErrorToast()
		-- upvalues: p1 (ref)
		p1.props.navigateToToast({
			toastProps = {
				toastContent = { toastTitle = p1.props.networkErrorText }
			}
		})
	end
	
	p1.onSendChat = memoize(function(p2, p3, p4, p5, p6, p7, p8, p9)
		-- upvalues: name (copy), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), fFlagAppChatSignalsReplyStoreModule (copy), p1 (ref), statusCodes (copy), sendMessageErrorModule (copy), chatConversationTelemetryEventsModule (copy), dateTime (copy)
		return function(p10)
			-- upvalues: p6 (ref), name (copy), p3 (write), p7 (ref), p5 (ref), p8 (ref), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), fFlagAppChatSignalsReplyStoreModule (copy), p1 (copy), p2 (ref), statusCodes (copy), p4 (ref), sendMessageErrorModule (copy), p9 (ref), chatConversationTelemetryEventsModule (copy), dateTime (copy)
			local var3
			if p6 and p6.source == "friends" then
				name:info("Creating a conversation for friend conversation {} via onSendChat", p3)
				var3, var42 = p7(p3, p5):await()
				
				if var3 and var42 then
					name:debug("Created conversation {} for friend conversation {} via onSendChat", var42.id, p3)
					p3 = var42.id
					p8(var42.id)
				else
					name:error("Could not create conversation. Error: {}", tostring(var42))
					
					return
				end
			end
			name:info("Sending message '{}' to conversationId {} via onSendChat", p10, p3)
			
			if fFlagAppChatPerfTrackingModule then
				if fFlagAppChatMessageTTIMilestonesModule then
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.MessageSendTTI, { conversationId = tostring(p3) })
				else
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.MessageSendToPendingRender, { conversationId = tostring(p3) })
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.MessageSendToFinalRender, { conversationId = tostring(p3) })
				end
			end
			var3 = nil
			
			if fFlagAppChatSignalsReplyStoreModule and p1.props.replyingToMessageId then
				var3 = { id = p1.props.replyingToMessageId }
			elseif not fFlagAppChatSignalsReplyStoreModule then
				var3 = p1.props.replyingToMessage
			end
			local var4 = p2(p3, p10, var3)
			
			if var4 then
				var4:andThen(function(p11)
					-- upvalues: statusCodes (copy), p1 (copy), p4 (copy), p3 (copy)
					if p11 and p11.StatusCode == statusCodes.CONFLICT then
						p1.showNetworkErrorToast()
						
						return
					elseif p4 then
						p4(p3)
					end
				end)
			elseif p4 then
				p4(p3)
			end
			p1.closeReplying()
			local t = {
				messageSentResult = sendMessageErrorModule.OtherFailure,
				recipientIds = p1.props.recipientIdsSerialized
			}
			
			if var4 then
				var4:andThen(function(p11)
					-- upvalues: sendMessageErrorModule (copy), statusCodes (copy), dateTime (copy), p9 (copy), chatConversationTelemetryEventsModule (copy), p1 (copy)
					local noResponse
					local _ = nil
					local id = nil
					local id_1 = nil
					local senderUserId = nil
					local var5 = nil
					local var6 = nil
					local statusCode = p11 and p11.StatusCode
					
					if not p11 then
						noResponse = sendMessageErrorModule.NoResponse
					elseif statusCode == statusCodes.CONFLICT then
						noResponse = sendMessageErrorModule.Conflict
					elseif not p11.responseBody then
						noResponse = sendMessageErrorModule.NoResponseBody
					elseif not p11.responseBody.messages or #p11.responseBody.messages == 0 then
						noResponse = sendMessageErrorModule.NoMessages
					elseif p11.responseBody.messages[1].status then
						noResponse = p11.responseBody.messages[1].status
						id = p11.responseBody.messages[1].id
						
						if p11.responseBody.messages[1].replies_to then
							local repliesTo = p11.responseBody.messages[1].replies_to
							id_1 = repliesTo.id
							senderUserId = repliesTo.sender_user_id
							var5 = tostring(dateTime.fromIsoDate(repliesTo.created_at).dateTime)
							var6 = if repliesTo.content then #repliesTo.content else nil
						end
					else
						noResponse = sendMessageErrorModule.NoMessageStatus
					end
					p9.emit(chatConversationTelemetryEventsModule.ConversationMessageSent, {
						messageSentResult = noResponse,
						messageId = id,
						recipientIds = p1.props.recipientIdsSerialized,
						targetMessageId = id_1,
						targetMessageSenderId = senderUserId,
						targetMessageSentAt = var5,
						targetMessageLength = var6
					})
				end):catch(function()
					-- upvalues: p9 (copy), chatConversationTelemetryEventsModule (copy), t (ref)
					p9.emit(chatConversationTelemetryEventsModule.ConversationMessageSent, t)
				end)
				
				return
			end
			p9.emit(chatConversationTelemetryEventsModule.ConversationMessageSent, t)
		end
	end)
	p1.onSendBtnClicked = memoize(function(p2)
		-- upvalues: chatConversationTelemetryEventsModule (copy)
		return function(p3)
			-- upvalues: p2 (ref), chatConversationTelemetryEventsModule (copy)
			p2.emit(chatConversationTelemetryEventsModule.ConversationSendBtnClicked, { sendBtnClickResult = p3 })
		end
	end)
	
	function p0.isMoreMenuEnabled()
		-- upvalues: p1 (ref)
		return p1.props.moreMenuEnabled
	end
	
	p1.reportInputBarReady = if fFlagAppChatPerfTrackingModule then function(p2)
		-- upvalues: p1 (ref)
		if p1.props.onChatInputBarReady and p1.props.shouldShowChatInputBar and p2 > 0 then
			p1.props.onChatInputBarReady()
		end
	end else nil
	
	if p1.isMoreMenuEnabled() or fFlagAppChatReplyComposeBarContainerModule then
		function p0.onHeightChanged(p2)
			-- upvalues: fFlagAppChatPerfTrackingModule (copy), p1 (ref)
			if fFlagAppChatPerfTrackingModule then
				p1.reportInputBarReady(p2.AbsoluteSize.Y)
			end
			p1:setState(function(p3, _)
				-- upvalues: p2 (ref)
				return if p2.AbsoluteSize.Y == p3.inputBarHeight then {} else { inputBarHeight = p2.AbsoluteSize.Y }
			end)
		end
	else
		function p0.onHeightChanged(p2)
			-- upvalues: fFlagAppChatPerfTrackingModule (copy), p1 (ref)
			if fFlagAppChatPerfTrackingModule then
				p1.reportInputBarReady(p2)
			end
			p1:setState(function(p3, _)
				-- upvalues: p2 (ref)
				return if p2 == p3.inputBarHeight then {} else { inputBarHeight = p2 }
			end)
		end
	end
	p1.lastTypingRequest = 0
	
	function p0.chatInputTextChanged()
		-- upvalues: p1 (ref)
		if p1.props.conversation and p1.props.conversation.source == "friends" then return end
		local currentTime = tick()
		
		if currentTime - p1.lastTypingRequest >= 3 then
			p1.lastTypingRequest = currentTime
			p1.props.postTypingStatus(p1.props.conversationId, true)
		end
	end
	
	p1.exitTypeForAnalytics = conversationExitTypeModule.Default
	
	if not fFlagAppChatUseSwipeForRepliesModule then
		function p0.onTouchSwipe(_, p2, p3)
			-- upvalues: p1 (ref), conversationExitTypeModule (copy)
			if not p1.props.wideMode and p2 == Enum.SwipeDirection.Right and p3 == 1 then
				p1.exitTypeForAnalytics = conversationExitTypeModule.SwipedRight
				p1.props.navigateBack()
			end
		end
	end
	function p0.fireAnalyticsEventOnUnmount()
		-- upvalues: p1 (ref), conversationExitTypeModule (copy)
		p1.props.onConversationUnmount(p1.exitTypeForAnalytics)
		p1.exitTypeForAnalytics = conversationExitTypeModule.Default
	end
	
	function p0.closeKeyboard()
		-- upvalues: p1 (ref)
		if p1.inputBoxRef:getValue() then
			p1.inputBoxRef:getValue():ReleaseFocus()
		end
	end
	
	function p0.closeReplying()
		-- upvalues: fFlagAppChatSignalsReplyStoreModule (copy), getReplyingToStoreModule (copy), p1 (ref)
		if fFlagAppChatSignalsReplyStoreModule then
			getReplyingToStoreModule(false).clear()
			
			return
		end
		p1.props.replyingToMessageDispatch(nil)
	end
	
	function p0.onPointerInput()
		-- upvalues: globalLongPressSignalModule (copy), p1 (ref)
		globalLongPressSignalModule.dismiss()
		p1.closeKeyboard()
	end
	
	function p0.onSizeChange()
		-- upvalues: p1 (ref)
		p1.updateKeyboardOffset()
	end
	
	function p0.calculateScrollOffset(p2)
		return p2.AbsoluteCanvasSize.Y - p2.CanvasPosition.Y - p2.AbsoluteWindowSize.Y
	end
	
	function p0.setBannerHeight(p2)
		-- upvalues: p1 (ref)
		p1:setState({ conversationBannerHeight = p2 })
	end
	
	function p0.setBottomModalHeight(p2)
		-- upvalues: p1 (ref)
		p1:setState({ bottomModalHeight = p2 })
	end
	
	if not fFlagAppChatReplyComposeBarContainerModule then
		function p0.setReplyComposeBarHeight(p2)
			-- upvalues: p1 (ref)
			p1:setState({ replyComposeBarHeight = p2 })
		end
	end
	function p0.onMessageListSizeChange(p2)
		-- upvalues: p1 (ref)
		p1:setState({ messageListHeight = p2.AbsoluteSize.Y })
	end
	
	p1.focusNavigationService = focusNavigationService.new(coreGui)
end

function chatConversation.didMount(p1)
	-- upvalues: focusBehaviorsModule (ref), appChatNewChatInputBarIxpEnabled (ref), IXPService (ref), appChatNewChatInputBarIxpLayer (ref)
	p1.isMounted = true
	p1.markAsRead(p1.props.markConversationAsRead, p1.props.conversationId)()
	local value = p1.inputBarRef:getValue()
	p1.focusNavigationService:registerFocusBehavior(p1.conversationViewRef:getValue(), focusBehaviorsModule.mostRecentOrDefault(value))
	
	if not p1.props.wideMode and p1.focusNavigationService.focusedGuiObject:getValue() ~= nil then
		p1.focusNavigationService:focusGuiObject(value)
	end
	if appChatNewChatInputBarIxpEnabled and p1.props.shouldShowChatInputBar then
		IXPService:LogFlagLinkedUserLayerExposure(appChatNewChatInputBarIxpLayer)
	end
end

function chatConversation.willUpdate(p1, p2, _)
	if p2.chatIsVisible ~= p1.props.chatIsVisible and not p2.chatIsVisible then
		p1.closeKeyboard()
	end
end

function chatConversation.didUpdate(p1, p2, p3)
	-- upvalues: fFlagAppChatPerfTrackingModule (ref)
	if p1.props.wideMode and p1.props.navigation.getParam("navigatedWithFocus") then
		local value = p1.inputBarRef:getValue()
		p1.props.navigation.setParams({ navigatedWithFocus = false })
		p1.focusNavigationService:focusGuiObject(value)
	end
	if p2.conversationId ~= p1.props.conversationId then
		if fFlagAppChatPerfTrackingModule then
			p1.reportInputBarReady(p1.state.inputBarHeight)
		end
		if p1.inputBoxRef:getValue() then
			p1.inputBoxRef:getValue().Text = ""
			p1.inputBoxRef:getValue():ReleaseFocus()
		end
		p1.closeReplying()
		p1.markAsRead(p1.props.markConversationAsRead, p1.props.conversationId, false)()
	end
	if fFlagAppChatPerfTrackingModule and p2.shouldShowChatInputBar ~= p1.props.shouldShowChatInputBar then
		p1.reportInputBarReady(p1.state.inputBarHeight)
	end
	local listRef = p1.messageListRef and (p1.messageListRef.current and p1.messageListRef.current._listRef)
	local var3 = listRef and (listRef._scrollRef and listRef._scrollRef.getNativeScrollRef())
	local var4 = p1.state.messageListHeight - p3.messageListHeight
	
	if listRef and var3 and (p3.messageListHeight ~= 0 and var4 ~= 0) then
		local var5 = p1.calculateScrollOffset(var3._nativeRef.current)
		
		if var5 <= 0 then return end
		listRef:scrollToOffset({ offset = var5 + var4 })
	end
end

function chatConversation.willUnmount(p1)
	p1.fireAnalyticsEventOnUnmount()
	p1.closeReplying()
	p1.keyboardConnections = {}
	p1.isMounted = false
	p1.focusNavigationService:teardown()
end

function chatConversation.render(p1)
	-- upvalues: withRoactChatAnalyticsModule (ref), withStyle (ref), withChatPagePaddingModule (ref), roactModule (ref), fFlagAppChatUseSwipeForRepliesModule (ref), keyboardOffsetEventHandlerModule (ref), var2 (ref), fFlagAppChatEnableDoubleOptIn (ref), fFlagAppChatReplyComposeBarContainerModule (ref), messageListModule (ref), userTypingIndicatorModule (ref), reactModule (ref), foundationModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), fFlagAppChatSmartSuggestionsModule (ref), smartSuggestionsChipRowContainerModule (ref), replyComposeBarContainerModule (ref), chatConversationMoreMenuModule (ref), var1 (ref), conversationBottomModalContainerModule (ref)
	local isFriends
	local var3 = #p1.props.usersTyping > 0 and p1.props.displayNamesAvailable
	
	if p1.props.conversation then
		isFriends = p1.props.conversation.source == "friends"
		isFriends = nil
	else
		isFriends = false
	end
	local text = "MessageList" .. tostring(p1.props.conversationId)
	
	return withRoactChatAnalyticsModule(function(p2)
		-- upvalues: withStyle (copy), withChatPagePaddingModule (copy), p1 (ref), roactModule (copy), fFlagAppChatUseSwipeForRepliesModule (copy), keyboardOffsetEventHandlerModule (copy), var2 (copy), fFlagAppChatEnableDoubleOptIn (copy), fFlagAppChatReplyComposeBarContainerModule (copy), text (ref), messageListModule (copy), isFriends (ref), var3 (ref), userTypingIndicatorModule (copy), reactModule (copy), foundationModule (copy), fFlagAppChatSignalsReplyStoreModule (copy), fFlagAppChatSmartSuggestionsModule (copy), smartSuggestionsChipRowContainerModule (copy), replyComposeBarContainerModule (copy), chatConversationMoreMenuModule (copy), var1 (copy), conversationBottomModalContainerModule (copy)
		return withStyle(function(p3)
			-- upvalues: withChatPagePaddingModule (copy), p1 (copy), roactModule (copy), fFlagAppChatUseSwipeForRepliesModule (copy), keyboardOffsetEventHandlerModule (copy), var2 (copy), fFlagAppChatEnableDoubleOptIn (copy), fFlagAppChatReplyComposeBarContainerModule (copy), text (copy), messageListModule (copy), isFriends (copy), var3 (copy), userTypingIndicatorModule (copy), reactModule (copy), foundationModule (copy), fFlagAppChatSignalsReplyStoreModule (copy), fFlagAppChatSmartSuggestionsModule (copy), smartSuggestionsChipRowContainerModule (copy), replyComposeBarContainerModule (copy), chatConversationMoreMenuModule (copy), var1 (copy), p2 (ref), conversationBottomModalContainerModule (copy)
			return withChatPagePaddingModule(function(p4)
				-- upvalues: p1 (copy), roactModule (copy), p3 (ref), fFlagAppChatUseSwipeForRepliesModule (copy), keyboardOffsetEventHandlerModule (copy), var2 (copy), fFlagAppChatEnableDoubleOptIn (copy), fFlagAppChatReplyComposeBarContainerModule (copy), text (copy), messageListModule (copy), isFriends (copy), var3 (copy), userTypingIndicatorModule (copy), reactModule (copy), foundationModule (copy), fFlagAppChatSignalsReplyStoreModule (copy), fFlagAppChatSmartSuggestionsModule (copy), smartSuggestionsChipRowContainerModule (copy), replyComposeBarContainerModule (copy), chatConversationMoreMenuModule (copy), var1 (copy), p2 (copy), conversationBottomModalContainerModule (copy)
				local var4
				local var5 = if p1.isMoreMenuEnabled() then if p1.props.shouldDisableChatInputBar then UDim.new(0, p4.right) else UDim.new(0, math.max(p4.right - 6, 0)) else nil
				local createElement = roactModule.createElement
				local var6 = "TextButton"
				local t = {
					AutoButtonColor = false,
					BackgroundColor3 = p3.Theme.BackgroundDefault.Color,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					Text = "",
					Transparency = p3.Tokens.Color.None.Transparency,
					[roactModule.Event.TouchSwipe] = if not fFlagAppChatUseSwipeForRepliesModule then p1.onTouchSwipe else nil,
					[roactModule.Event.TouchTap] = p1.onPointerInput,
					[roactModule.Event.MouseButton1Down] = p1.onPointerInput,
					[roactModule.Ref] = p1.conversationViewRef,
					Selectable = false
				}
				local t_1 = {
					KeyboardOffsetEventHandler = roactModule.createElement(keyboardOffsetEventHandlerModule, {
						onKeyboardOffsetChanged = p1.onKeyboardOffsetChanged,
						parentViewRef = p1.conversationViewRef
					}),
					Layout = roactModule.createElement("UIListLayout", {
						HorizontalAlignment = if p1.isMoreMenuEnabled() then nil else Enum.HorizontalAlignment.Right,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					ConversationTopModal = roactModule.createElement(var2, {
						layoutOrder = 1,
						conversationId = if fFlagAppChatEnableDoubleOptIn then p1.props.conversationId else nil,
						conversation = if fFlagAppChatEnableDoubleOptIn then nil else p1.props.conversation,
						navigateToScreen = if fFlagAppChatEnableDoubleOptIn then nil else p1.props.navigateToScreen,
						setModalHeight = p1.setBannerHeight
					}),
					MessageListFrame = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 2,
						[roactModule.Change.AbsoluteSize] = p1.onMessageListSizeChange,
						Size = UDim2.new(1, 0, 1, (-p1.state.inputBarHeight) - p1.state.keyboardOffset - (if not fFlagAppChatReplyComposeBarContainerModule then p1.state.replyComposeBarHeight else 0) - p1.state.conversationBannerHeight - p1.state.bottomModalHeight)
					}, {
						[text] = roactModule.createElement(messageListModule, {
							bottomMargin = 28,
							Size = UDim2.new(1, 0, 1, 0),
							conversationId = p1.props.conversationId,
							isDebugEnabled = p1.props.isDebugEnabled,
							itemList = p1.props.itemList,
							loadNext = if isFriends then nil else p1.loadNext(p1.props.getOlderMessages, p1.props.conversationId),
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
						UserTypingIndicator = var3 and roactModule.createElement(userTypingIndicatorModule, {
							ZIndex = 2,
							height = 28,
							AnchorPoint = Vector2.new(0, 1),
							Position = UDim2.new(0, 0, 1, 0),
							usersTyping = p1.props.usersTyping,
							oneUserTyping = p1.props.oneUserTyping,
							twoUsersTyping = p1.props.twoUsersTyping,
							severalUsersTyping = p1.props.severalUsersTyping
						})
					})
				}
				
				if fFlagAppChatReplyComposeBarContainerModule then
					local var7
					var4 = reactModule.createElement
					local view = foundationModule.View
					local t_2 = { LayoutOrder = 3 }
					local t_3 = {
						["col size-full-0 auto-y gap-medium padding-y-medium"] = true
					}
					
					if fFlagAppChatSignalsReplyStoreModule then
						var7 = p1.props.replyingToMessageId ~= nil
						var7 = nil
					else
						var7 = p1.props.replyingToMessage
					end
					t_3["bg-surface-100"] = var7
					t_2.tag = t_3
					t_2.onAbsoluteSizeChanged = p1.onHeightChanged
					t_2.padding = { left = UDim.new(0, p4.left), right = var5 }
					var4 = var4(view, t_2, {
						SmartSuggestionsChipRow = if fFlagAppChatSmartSuggestionsModule then reactModule.createElement(smartSuggestionsChipRowContainerModule, {
							LayoutOrder = 0,
							conversationId = p1.props.conversationId,
							sendMessage = p1.props.sendMessage,
							sendGameLinkChatMessage = p1.props.sendGameLinkChatMessage
						}) else nil,
						ReplyComposeBar = if if fFlagAppChatSignalsReplyStoreModule then p1.props.replyingToMessageId else p1.props.replyingToMessage then roactModule.createElement(replyComposeBarContainerModule, {
							LayoutOrder = 1,
							message = if not fFlagAppChatSignalsReplyStoreModule then p1.props.replyingToMessage else nil,
							close = p1.closeReplying,
							inputBoxRef = p1.inputBoxRef
						}) else nil,
						Divider = if p1.isMoreMenuEnabled() and not p1.props.shouldShowChatInputBar and not p1.props.shouldHideMoreMenuButton then reactModule.createElement(foundationModule.View, {
							LayoutOrder = 4,
							tag = "size-full-0 auto-y stroke-standard stroke-default"
						}) else nil,
						ActionInputContainer = if p1.isMoreMenuEnabled() then reactModule.createElement(foundationModule.View, {
							LayoutOrder = 2,
							tag = "size-full-0 row gap-small auto-y align-y-center"
						}, {
							MoreMenu = if not p1.props.shouldHideMoreMenuButton then roactModule.createElement(chatConversationMoreMenuModule, {
								layoutOrder = 1,
								conversation = p1.props.conversation,
								conversationId = p1.props.conversationId,
								navigateToSquadLobby = p1.props.navigateToSquadLobby,
								showButtonText = not p1.props.shouldShowChatInputBar,
								tooltipText = p1.state.tooltipText
							}) else nil,
							ChatInputBar = if p1.props.shouldShowChatInputBar then roactModule.createElement(var1, {
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
						ChatInputBar = if p1.isMoreMenuEnabled() or not p1.props.shouldShowChatInputBar then nil else roactModule.createElement(var1, {
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
					})
				else
					var4 = nil
				end
				t_1.ReplyAndInputContainer = var4
				t_1.ReplyComposeBar = if fFlagAppChatReplyComposeBarContainerModule or not (if fFlagAppChatSignalsReplyStoreModule then p1.props.replyingToMessageId else p1.props.replyingToMessage) then nil else roactModule.createElement(replyComposeBarContainerModule, {
					LayoutOrder = 3,
					message = if not fFlagAppChatSignalsReplyStoreModule then p1.props.replyingToMessage else nil,
					close = p1.closeReplying,
					setReplyComposeBarHeight = p1.setReplyComposeBarHeight,
					inputBoxRef = p1.inputBoxRef
				})
				t_1.Divider = if fFlagAppChatReplyComposeBarContainerModule or not p1.isMoreMenuEnabled() or (p1.props.shouldShowChatInputBar or p1.props.shouldHideMoreMenuButton) then nil else reactModule.createElement(foundationModule.View, {
					LayoutOrder = 4,
					tag = "size-full-0 auto-y stroke-standard stroke-default"
				})
				t_1.ActionInputContainer = if fFlagAppChatReplyComposeBarContainerModule or not p1.isMoreMenuEnabled() then nil else reactModule.createElement(foundationModule.View, {
					tag = "size-full-0 row gap-small auto-y align-y-center padding-y-small",
					LayoutOrder = if not p1.props.shouldShowChatInputBar then 4 else 5,
					padding = { left = UDim.new(0, p4.left), right = var5 },
					onAbsoluteSizeChanged = p1.onHeightChanged
				}, {
					MoreMenu = if not p1.props.shouldHideMoreMenuButton then roactModule.createElement(chatConversationMoreMenuModule, {
						layoutOrder = 1,
						conversation = p1.props.conversation,
						conversationId = p1.props.conversationId,
						navigateToSquadLobby = p1.props.navigateToSquadLobby,
						showButtonText = not p1.props.shouldShowChatInputBar,
						tooltipText = p1.state.tooltipText
					}) else nil,
					ChatInputBar = if p1.props.shouldShowChatInputBar then roactModule.createElement(var1, {
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
						moreMenuEnabled = p1.props.moreMenuEnabled
					}) else nil
				})
				t_1.ChatInputBar = if fFlagAppChatReplyComposeBarContainerModule or p1.isMoreMenuEnabled() or not p1.props.shouldShowChatInputBar then nil else roactModule.createElement(var1, {
					LayoutOrder = 4,
					onFocusLost = p1.clearKeyboardOffset,
					conversationId = p1.props.conversationId,
					inputBoxRef = p1.inputBoxRef,
					inputBarRef = p1.inputBarRef,
					localUserId = p1.props.localUserId,
					messageListRef = p1.messageListRef,
					onHeightChanged = if p1.isMoreMenuEnabled() then nil else p1.onHeightChanged,
					onSendChat = p1.onSendChat(p1.props.sendMessage, p1.props.conversationId, p1.props.markConversationAsRead, p2, p1.props.conversation, p1.props.createFriendConversation, p1.props.navigateToChatConversation, p1.props.telemetry),
					onSendBtnClicked = p1.onSendBtnClicked(p1.props.telemetry),
					onTextChanged = p1.chatInputTextChanged,
					placeholderText = p1.props.chatInputPlaceholder,
					isDisabled = p1.props.shouldDisableChatInputBar,
					inputBarDisabledText = p1.props.inputBarDisabledText,
					disabledEndTimestampDisplay = p1.props.inputBarDisabledEndTimestampDisplay,
					onDisabledInputBarActivated = p1.props.onDisabledInputBarActivated,
					moreMenuEnabled = p1.props.moreMenuEnabled
				})
				t_1.BottomModal = reactModule.createElement(conversationBottomModalContainerModule, {
					layoutOrder = 5,
					conversationId = p1.props.conversationId,
					onHeightChanged = p1.setBottomModalHeight,
					legacyBottomModalText = p1.props.bottomModalText,
					shouldShowLegacyBottomModal = p1.props.shouldShowLegacyBottomModal,
					shouldShowChatInputBar = p1.props.shouldShowChatInputBar
				})
				
				return createElement(var6, t, t_1)
			end)
		end)
	end)
end

return connectTelemetryModule(chatConversationTelemetryLayerModule.Context)(roactNavigationModule.withNavigation(chatConversation))