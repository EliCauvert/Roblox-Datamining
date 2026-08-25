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
local var11 = if require(appChat.Flags.FFlagAppChatNewChatInputBar) then require(script.Parent.ChatInputBar) else require(script.Parent.ChatInputBarDeprecated)
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
local var35 = if fFlagAppChatEnableDoubleOptIn then require(script.Parent.ConversationTopModalContainer) else require(script.Parent.ConversationTopModalContainerDeprecated)
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

function chatConversation.init(p0)
	-- upvalues: roactModule (ref), userInputService (ref), memoize (ref), name (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), statusCodes (ref), sendMessageErrorModule (ref), chatConversationTelemetryEventsModule (ref), dateTime (ref), fFlagAppChatReplyComposeBarContainerModule (ref), conversationExitTypeModule (ref), fFlagAppChatUseSwipeForRepliesModule (ref), getReplyingToStoreModule (ref), globalLongPressSignalModule (ref), focusNavigationService (ref), coreGui (ref)
	p0.state = {
		inputBarHeight = 0,
		keyboardOffset = 0,
		replyComposeBarHeight = 0,
		conversationBannerHeight = 0,
		messageListHeight = 0,
		bottomModalHeight = 0,
		tooltipText = ""
	}
	p0.inputBoxRef = p0.props.inputBoxRef or roactModule.createRef()
	p0.inputBarRef = roactModule.createRef()
	p0.conversationViewRef = roactModule.createRef()
	p0.messageListRef = roactModule.createRef()
	
	function p0.getKeyboardOffset()
		-- upvalues: userInputService (copy), p0 (ref)
		if userInputService.OnScreenKeyboardVisible and p0.inputBoxRef:getValue() and p0.inputBoxRef:getValue():IsFocused() then
			if p0.props.keyboardOffset ~= nil then
				return p0.props.keyboardOffset
			end
			local value = p0.conversationViewRef:getValue()
			
			return if value then value.AbsolutePosition.Y + value.AbsoluteSize.Y - userInputService.OnScreenKeyboardPosition.Y else 0
		end
	end
	
	function p0.updateKeyboardOffset()
		-- upvalues: p0 (ref)
		if not p0.isMounted then return end
		local keyboardOffset = p0.getKeyboardOffset()
		
		if p0.state.keyboardOffset ~= keyboardOffset then
			p0:setState({ keyboardOffset = keyboardOffset })
		end
	end
	
	function p0.onKeyboardOffsetChanged(p1)
		-- upvalues: p0 (ref)
		if not p0.isMounted then return end
		if not p0.inputBoxRef:getValue() or not p0.inputBoxRef:getValue():IsFocused() then
			p1 = 0
		end
		if p0.state.keyboardOffset ~= p1 then
			p0:setState({ keyboardOffset = p1 })
		end
	end
	
	function p0.clearKeyboardOffset()
		-- upvalues: p0 (ref)
		p0:setState({ keyboardOffset = 0 })
	end
	
	p0.loadNext = memoize(function(p2, p3)
		-- upvalues: p0 (ref)
		return function()
			-- upvalues: p2 (ref), p3 (ref), p0 (copy)
			local var40 = p2(p3)
			
			if var40 then
				var40:catch(function()
					-- upvalues: p0 (copy)
					p0.showNetworkErrorToast()
				end)
			end
		end
	end)
	p0.markAsRead = memoize(function(p4, p5)
		-- upvalues: p0 (ref)
		return function()
			-- upvalues: p0 (copy), p4 (ref), p5 (ref)
			if p0.props.readingMessagesIsEnabled then
				p4(p5)
			end
		end
	end)
	
	function p0.showNetworkErrorToast()
		-- upvalues: p0 (ref)
		p0.props.navigateToToast({
			toastProps = {
				toastContent = { toastTitle = p0.props.networkErrorText }
			}
		})
	end
	
	p0.onSendChat = memoize(function(p6, p7, p8, p9, p10, p11, p12, p13)
		-- upvalues: name (copy), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), fFlagAppChatSignalsReplyStoreModule (copy), p0 (ref), statusCodes (copy), sendMessageErrorModule (copy), chatConversationTelemetryEventsModule (copy), dateTime (copy)
		return function(p14)
			-- upvalues: p10 (ref), name (copy), p7 (write), p11 (ref), p9 (ref), p12 (ref), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), fFlagAppChatSignalsReplyStoreModule (copy), p0 (copy), p6 (ref), statusCodes (copy), p8 (ref), sendMessageErrorModule (copy), p13 (ref), chatConversationTelemetryEventsModule (copy), dateTime (copy)
			local var41
			if p10 and p10.source == "friends" then
				name:info("Creating a conversation for friend conversation {} via onSendChat", p7)
				var41, var42 = p11(p7, p9):await()
				
				if var41 and var42 then
					name:debug("Created conversation {} for friend conversation {} via onSendChat", var42.id, p7)
					p7 = var42.id
					p12(var42.id)
				else
					name:error("Could not create conversation. Error: {}", tostring(var42))
					
					return
				end
			end
			name:info("Sending message '{}' to conversationId {} via onSendChat", p14, p7)
			
			if fFlagAppChatPerfTrackingModule then
				if fFlagAppChatMessageTTIMilestonesModule then
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.MessageSendTTI, { conversationId = tostring(p7) })
				else
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.MessageSendToPendingRender, { conversationId = tostring(p7) })
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.MessageSendToFinalRender, { conversationId = tostring(p7) })
				end
			end
			var41 = nil
			
			if fFlagAppChatSignalsReplyStoreModule and p0.props.replyingToMessageId then
				var41 = { id = p0.props.replyingToMessageId }
			elseif not fFlagAppChatSignalsReplyStoreModule then
				var41 = p0.props.replyingToMessage
			end
			local var43 = p6(p7, p14, var41)
			
			if var43 then
				var43:andThen(function(p15)
					-- upvalues: statusCodes (copy), p0 (copy), p8 (copy), p7 (copy)
					if p15 and p15.StatusCode == statusCodes.CONFLICT then
						p0.showNetworkErrorToast()
						
						return
					elseif p8 then
						p8(p7)
					end
				end)
			elseif p8 then
				p8(p7)
			end
			p0.closeReplying()
			local t = {
				messageSentResult = sendMessageErrorModule.OtherFailure,
				recipientIds = p0.props.recipientIdsSerialized
			}
			
			if var43 then
				var43:andThen(function(p16)
					-- upvalues: sendMessageErrorModule (copy), statusCodes (copy), dateTime (copy), p13 (copy), chatConversationTelemetryEventsModule (copy), p0 (copy)
					local noResponse
					local _ = nil
					local id = nil
					local id_1 = nil
					local senderUserId = nil
					local var45 = nil
					local var46 = nil
					local statusCode = p16 and p16.StatusCode
					
					if not p16 then
						noResponse = sendMessageErrorModule.NoResponse
					elseif statusCode == statusCodes.CONFLICT then
						noResponse = sendMessageErrorModule.Conflict
					elseif not p16.responseBody then
						noResponse = sendMessageErrorModule.NoResponseBody
					elseif not p16.responseBody.messages or #p16.responseBody.messages == 0 then
						noResponse = sendMessageErrorModule.NoMessages
					elseif p16.responseBody.messages[1].status then
						noResponse = p16.responseBody.messages[1].status
						id = p16.responseBody.messages[1].id
						
						if p16.responseBody.messages[1].replies_to then
							local repliesTo = p16.responseBody.messages[1].replies_to
							id_1 = repliesTo.id
							senderUserId = repliesTo.sender_user_id
							var45 = tostring(dateTime.fromIsoDate(repliesTo.created_at).dateTime)
							var46 = if repliesTo.content then #repliesTo.content else nil
						end
					else
						noResponse = sendMessageErrorModule.NoMessageStatus
					end
					p13.emit(chatConversationTelemetryEventsModule.ConversationMessageSent, {
						messageSentResult = noResponse,
						messageId = id,
						recipientIds = p0.props.recipientIdsSerialized,
						targetMessageId = id_1,
						targetMessageSenderId = senderUserId,
						targetMessageSentAt = var45,
						targetMessageLength = var46
					})
				end):catch(function()
					-- upvalues: p13 (copy), chatConversationTelemetryEventsModule (copy), t (ref)
					p13.emit(chatConversationTelemetryEventsModule.ConversationMessageSent, t)
				end)
				
				return
			end
			p13.emit(chatConversationTelemetryEventsModule.ConversationMessageSent, t)
		end
	end)
	p0.onSendBtnClicked = memoize(function(p17)
		-- upvalues: chatConversationTelemetryEventsModule (copy)
		return function(p18)
			-- upvalues: p17 (ref), chatConversationTelemetryEventsModule (copy)
			p17.emit(chatConversationTelemetryEventsModule.ConversationSendBtnClicked, { sendBtnClickResult = p18 })
		end
	end)
	
	function p0.isMoreMenuEnabled()
		-- upvalues: p0 (ref)
		return p0.props.moreMenuEnabled
	end
	
	p0.reportInputBarReady = if fFlagAppChatPerfTrackingModule then function(p19)
		-- upvalues: p0 (ref)
		if p0.props.onChatInputBarReady and p0.props.shouldShowChatInputBar and p19 > 0 then
			p0.props.onChatInputBarReady()
		end
	end else nil
	
	if p0.isMoreMenuEnabled() or fFlagAppChatReplyComposeBarContainerModule then
		function p0.onHeightChanged(p20)
			-- upvalues: fFlagAppChatPerfTrackingModule (copy), p0 (ref)
			if fFlagAppChatPerfTrackingModule then
				p0.reportInputBarReady(p20.AbsoluteSize.Y)
			end
			p0:setState(function(p21, _)
				-- upvalues: p20 (ref)
				return if p20.AbsoluteSize.Y == p21.inputBarHeight then {} else { inputBarHeight = p20.AbsoluteSize.Y }
			end)
		end
	else
		function p0.onHeightChanged(p22)
			-- upvalues: fFlagAppChatPerfTrackingModule (copy), p0 (ref)
			if fFlagAppChatPerfTrackingModule then
				p0.reportInputBarReady(p22)
			end
			p0:setState(function(p23, _)
				-- upvalues: p22 (ref)
				return if p22 == p23.inputBarHeight then {} else { inputBarHeight = p22 }
			end)
		end
	end
	p0.lastTypingRequest = 0
	
	function p0.chatInputTextChanged()
		-- upvalues: p0 (ref)
		if p0.props.conversation and p0.props.conversation.source == "friends" then return end
		local currentTime = tick()
		
		if currentTime - p0.lastTypingRequest >= 3 then
			p0.lastTypingRequest = currentTime
			p0.props.postTypingStatus(p0.props.conversationId, true)
		end
	end
	
	p0.exitTypeForAnalytics = conversationExitTypeModule.Default
	
	if not fFlagAppChatUseSwipeForRepliesModule then
		function p0.onTouchSwipe(_, p24, p25)
			-- upvalues: p0 (ref), conversationExitTypeModule (copy)
			if not p0.props.wideMode and p24 == Enum.SwipeDirection.Right and p25 == 1 then
				p0.exitTypeForAnalytics = conversationExitTypeModule.SwipedRight
				p0.props.navigateBack()
			end
		end
	end
	function p0.fireAnalyticsEventOnUnmount()
		-- upvalues: p0 (ref), conversationExitTypeModule (copy)
		p0.props.onConversationUnmount(p0.exitTypeForAnalytics)
		p0.exitTypeForAnalytics = conversationExitTypeModule.Default
	end
	
	function p0.closeKeyboard()
		-- upvalues: p0 (ref)
		if p0.inputBoxRef:getValue() then
			p0.inputBoxRef:getValue():ReleaseFocus()
		end
	end
	
	function p0.closeReplying()
		-- upvalues: fFlagAppChatSignalsReplyStoreModule (copy), getReplyingToStoreModule (copy), p0 (ref)
		if fFlagAppChatSignalsReplyStoreModule then
			getReplyingToStoreModule(false).clear()
			
			return
		end
		p0.props.replyingToMessageDispatch(nil)
	end
	
	function p0.onPointerInput()
		-- upvalues: globalLongPressSignalModule (copy), p0 (ref)
		globalLongPressSignalModule.dismiss()
		p0.closeKeyboard()
	end
	
	function p0.onSizeChange()
		-- upvalues: p0 (ref)
		p0.updateKeyboardOffset()
	end
	
	function p0.calculateScrollOffset(p26)
		return p26.AbsoluteCanvasSize.Y - p26.CanvasPosition.Y - p26.AbsoluteWindowSize.Y
	end
	
	function p0.setBannerHeight(p27)
		-- upvalues: p0 (ref)
		p0:setState({ conversationBannerHeight = p27 })
	end
	
	function p0.setBottomModalHeight(p28)
		-- upvalues: p0 (ref)
		p0:setState({ bottomModalHeight = p28 })
	end
	
	if not fFlagAppChatReplyComposeBarContainerModule then
		function p0.setReplyComposeBarHeight(p29)
			-- upvalues: p0 (ref)
			p0:setState({ replyComposeBarHeight = p29 })
		end
	end
	function p0.onMessageListSizeChange(p30)
		-- upvalues: p0 (ref)
		p0:setState({ messageListHeight = p30.AbsoluteSize.Y })
	end
	
	p0.focusNavigationService = focusNavigationService.new(coreGui)
end

function chatConversation.didMount(p31)
	-- upvalues: focusBehaviorsModule (ref), appChatNewChatInputBarIxpEnabled (ref), IXPService (ref), appChatNewChatInputBarIxpLayer (ref)
	p31.isMounted = true
	p31.markAsRead(p31.props.markConversationAsRead, p31.props.conversationId)()
	local value = p31.inputBarRef:getValue()
	p31.focusNavigationService:registerFocusBehavior(p31.conversationViewRef:getValue(), focusBehaviorsModule.mostRecentOrDefault(value))
	
	if not p31.props.wideMode and p31.focusNavigationService.focusedGuiObject:getValue() ~= nil then
		p31.focusNavigationService:focusGuiObject(value)
	end
	if appChatNewChatInputBarIxpEnabled and p31.props.shouldShowChatInputBar then
		IXPService:LogFlagLinkedUserLayerExposure(appChatNewChatInputBarIxpLayer)
	end
end

function chatConversation.willUpdate(p32, p33, _)
	if p33.chatIsVisible ~= p32.props.chatIsVisible and not p33.chatIsVisible then
		p32.closeKeyboard()
	end
end

function chatConversation.didUpdate(p34, p35, p36)
	-- upvalues: fFlagAppChatPerfTrackingModule (ref)
	if p34.props.wideMode and p34.props.navigation.getParam("navigatedWithFocus") then
		local value = p34.inputBarRef:getValue()
		p34.props.navigation.setParams({ navigatedWithFocus = false })
		p34.focusNavigationService:focusGuiObject(value)
	end
	if p35.conversationId ~= p34.props.conversationId then
		if fFlagAppChatPerfTrackingModule then
			p34.reportInputBarReady(p34.state.inputBarHeight)
		end
		if p34.inputBoxRef:getValue() then
			p34.inputBoxRef:getValue().Text = ""
			p34.inputBoxRef:getValue():ReleaseFocus()
		end
		p34.closeReplying()
		p34.markAsRead(p34.props.markConversationAsRead, p34.props.conversationId, false)()
	end
	if fFlagAppChatPerfTrackingModule and p35.shouldShowChatInputBar ~= p34.props.shouldShowChatInputBar then
		p34.reportInputBarReady(p34.state.inputBarHeight)
	end
	local listRef = p34.messageListRef and (p34.messageListRef.current and p34.messageListRef.current._listRef)
	local var52 = listRef and (listRef._scrollRef and listRef._scrollRef.getNativeScrollRef())
	local var53 = p34.state.messageListHeight - p36.messageListHeight
	
	if listRef and var52 and (p36.messageListHeight ~= 0 and var53 ~= 0) then
		local var54 = p34.calculateScrollOffset(var52._nativeRef.current)
		
		if var54 <= 0 then return end
		listRef:scrollToOffset({ offset = var54 + var53 })
	end
end

function chatConversation.willUnmount(p37)
	p37.fireAnalyticsEventOnUnmount()
	p37.closeReplying()
	p37.keyboardConnections = {}
	p37.isMounted = false
	p37.focusNavigationService:teardown()
end

function chatConversation.render(p38)
	-- upvalues: withRoactChatAnalyticsModule (ref), withStyle (ref), withChatPagePaddingModule (ref), roactModule (ref), fFlagAppChatUseSwipeForRepliesModule (ref), keyboardOffsetEventHandlerModule (ref), var35 (ref), fFlagAppChatEnableDoubleOptIn (ref), fFlagAppChatReplyComposeBarContainerModule (ref), messageListModule (ref), userTypingIndicatorModule (ref), reactModule (ref), foundationModule (ref), fFlagAppChatSignalsReplyStoreModule (ref), fFlagAppChatSmartSuggestionsModule (ref), smartSuggestionsChipRowContainerModule (ref), replyComposeBarContainerModule (ref), chatConversationMoreMenuModule (ref), var11 (ref), conversationBottomModalContainerModule (ref)
	local isFriends
	local var55 = #p38.props.usersTyping > 0 and p38.props.displayNamesAvailable
	
	if p38.props.conversation then
		isFriends = p38.props.conversation.source == "friends"
		isFriends = nil
	else
		isFriends = false
	end
	local text = "MessageList" .. tostring(p38.props.conversationId)
	
	return withRoactChatAnalyticsModule(function(p39)
		-- upvalues: withStyle (copy), withChatPagePaddingModule (copy), p38 (ref), roactModule (copy), fFlagAppChatUseSwipeForRepliesModule (copy), keyboardOffsetEventHandlerModule (copy), var35 (copy), fFlagAppChatEnableDoubleOptIn (copy), fFlagAppChatReplyComposeBarContainerModule (copy), text (ref), messageListModule (copy), isFriends (ref), var55 (ref), userTypingIndicatorModule (copy), reactModule (copy), foundationModule (copy), fFlagAppChatSignalsReplyStoreModule (copy), fFlagAppChatSmartSuggestionsModule (copy), smartSuggestionsChipRowContainerModule (copy), replyComposeBarContainerModule (copy), chatConversationMoreMenuModule (copy), var11 (copy), conversationBottomModalContainerModule (copy)
		return withStyle(function(p40)
			-- upvalues: withChatPagePaddingModule (copy), p38 (copy), roactModule (copy), fFlagAppChatUseSwipeForRepliesModule (copy), keyboardOffsetEventHandlerModule (copy), var35 (copy), fFlagAppChatEnableDoubleOptIn (copy), fFlagAppChatReplyComposeBarContainerModule (copy), text (copy), messageListModule (copy), isFriends (copy), var55 (copy), userTypingIndicatorModule (copy), reactModule (copy), foundationModule (copy), fFlagAppChatSignalsReplyStoreModule (copy), fFlagAppChatSmartSuggestionsModule (copy), smartSuggestionsChipRowContainerModule (copy), replyComposeBarContainerModule (copy), chatConversationMoreMenuModule (copy), var11 (copy), p39 (ref), conversationBottomModalContainerModule (copy)
			return withChatPagePaddingModule(function(p41)
				-- upvalues: p38 (copy), roactModule (copy), p40 (ref), fFlagAppChatUseSwipeForRepliesModule (copy), keyboardOffsetEventHandlerModule (copy), var35 (copy), fFlagAppChatEnableDoubleOptIn (copy), fFlagAppChatReplyComposeBarContainerModule (copy), text (copy), messageListModule (copy), isFriends (copy), var55 (copy), userTypingIndicatorModule (copy), reactModule (copy), foundationModule (copy), fFlagAppChatSignalsReplyStoreModule (copy), fFlagAppChatSmartSuggestionsModule (copy), smartSuggestionsChipRowContainerModule (copy), replyComposeBarContainerModule (copy), chatConversationMoreMenuModule (copy), var11 (copy), p39 (copy), conversationBottomModalContainerModule (copy)
				local var62
				local var58 = if p38.isMoreMenuEnabled() then if p38.props.shouldDisableChatInputBar then UDim.new(0, p41.right) else UDim.new(0, math.max(p41.right - 6, 0)) else nil
				local createElement = roactModule.createElement
				local var59 = "TextButton"
				local t = {
					AutoButtonColor = false,
					BackgroundColor3 = p40.Theme.BackgroundDefault.Color,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					Text = "",
					Transparency = p40.Tokens.Color.None.Transparency,
					[roactModule.Event.TouchSwipe] = if not fFlagAppChatUseSwipeForRepliesModule then p38.onTouchSwipe else nil,
					[roactModule.Event.TouchTap] = p38.onPointerInput,
					[roactModule.Event.MouseButton1Down] = p38.onPointerInput,
					[roactModule.Ref] = p38.conversationViewRef,
					Selectable = false
				}
				local t_1 = {
					KeyboardOffsetEventHandler = roactModule.createElement(keyboardOffsetEventHandlerModule, {
						onKeyboardOffsetChanged = p38.onKeyboardOffsetChanged,
						parentViewRef = p38.conversationViewRef
					}),
					Layout = roactModule.createElement("UIListLayout", {
						HorizontalAlignment = if p38.isMoreMenuEnabled() then nil else Enum.HorizontalAlignment.Right,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					ConversationTopModal = roactModule.createElement(var35, {
						layoutOrder = 1,
						conversationId = if fFlagAppChatEnableDoubleOptIn then p38.props.conversationId else nil,
						conversation = if fFlagAppChatEnableDoubleOptIn then nil else p38.props.conversation,
						navigateToScreen = if fFlagAppChatEnableDoubleOptIn then nil else p38.props.navigateToScreen,
						setModalHeight = p38.setBannerHeight
					}),
					MessageListFrame = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						LayoutOrder = 2,
						[roactModule.Change.AbsoluteSize] = p38.onMessageListSizeChange,
						Size = UDim2.new(1, 0, 1, (-p38.state.inputBarHeight) - p38.state.keyboardOffset - (if not fFlagAppChatReplyComposeBarContainerModule then p38.state.replyComposeBarHeight else 0) - p38.state.conversationBannerHeight - p38.state.bottomModalHeight)
					}, {
						[text] = roactModule.createElement(messageListModule, {
							bottomMargin = 28,
							Size = UDim2.new(1, 0, 1, 0),
							conversationId = p38.props.conversationId,
							isDebugEnabled = p38.props.isDebugEnabled,
							itemList = p38.props.itemList,
							loadNext = if isFriends then nil else p38.loadNext(p38.props.getOlderMessages, p38.props.conversationId),
							localUserId = p38.props.localUserId,
							markAsRead = p38.markAsRead(p38.props.markConversationAsRead, p38.props.conversationId),
							messageListRef = p38.messageListRef,
							openViewProfile = p38.props.openViewProfile,
							onDetailsOpened = p38.closeKeyboard,
							closeKeyboard = p38.closeKeyboard,
							inputBoxRef = p38.inputBoxRef,
							wideMode = p38.props.wideMode,
							viewProfileOnAvatarPressed = p38.props.viewProfileOnAvatarPressed,
							readingMessagesIsEnabled = p38.props.readingMessagesIsEnabled,
							invalidMessageTypeText = p38.props.invalidMessageTypeText,
							messageDefaultNoticeText = p38.props.messageDefaultNoticeText,
							messageModeratedNoticeText = p38.props.messageModeratedNoticeText,
							messageHiddenNoticeText = p38.props.messageHiddenNoticeText,
							unknownUserText = p38.props.unknownUserText,
							openGameDetailsPage = p38.props.openGameDetailsPage,
							openMomentsDeepLink = p38.props.openMomentsDeepLink,
							scrollToTopOnInitialOsaLoad = p38.props.scrollToTopOnInitialOsaLoad,
							isInitialMessageLoading = p38.props.isInitialMessageLoading
						}),
						UserTypingIndicator = var55 and roactModule.createElement(userTypingIndicatorModule, {
							ZIndex = 2,
							height = 28,
							AnchorPoint = Vector2.new(0, 1),
							Position = UDim2.new(0, 0, 1, 0),
							usersTyping = p38.props.usersTyping,
							oneUserTyping = p38.props.oneUserTyping,
							twoUsersTyping = p38.props.twoUsersTyping,
							severalUsersTyping = p38.props.severalUsersTyping
						})
					})
				}
				
				if fFlagAppChatReplyComposeBarContainerModule then
					local var65
					var62 = reactModule.createElement
					local view = foundationModule.View
					local t_2 = { LayoutOrder = 3 }
					local t_3 = {
						["col size-full-0 auto-y gap-medium padding-y-medium"] = true
					}
					
					if fFlagAppChatSignalsReplyStoreModule then
						var65 = p38.props.replyingToMessageId ~= nil
						var65 = nil
					else
						var65 = p38.props.replyingToMessage
					end
					t_3["bg-surface-100"] = var65
					t_2.tag = t_3
					t_2.onAbsoluteSizeChanged = p38.onHeightChanged
					t_2.padding = { left = UDim.new(0, p41.left), right = var58 }
					var62 = var62(view, t_2, {
						SmartSuggestionsChipRow = if fFlagAppChatSmartSuggestionsModule then reactModule.createElement(smartSuggestionsChipRowContainerModule, {
							LayoutOrder = 0,
							conversationId = p38.props.conversationId,
							sendMessage = p38.props.sendMessage,
							sendGameLinkChatMessage = p38.props.sendGameLinkChatMessage
						}) else nil,
						ReplyComposeBar = if if fFlagAppChatSignalsReplyStoreModule then p38.props.replyingToMessageId else p38.props.replyingToMessage then roactModule.createElement(replyComposeBarContainerModule, {
							LayoutOrder = 1,
							message = if not fFlagAppChatSignalsReplyStoreModule then p38.props.replyingToMessage else nil,
							close = p38.closeReplying,
							inputBoxRef = p38.inputBoxRef
						}) else nil,
						Divider = if p38.isMoreMenuEnabled() and not p38.props.shouldShowChatInputBar and not p38.props.shouldHideMoreMenuButton then reactModule.createElement(foundationModule.View, {
							LayoutOrder = 4,
							tag = "size-full-0 auto-y stroke-standard stroke-default"
						}) else nil,
						ActionInputContainer = if p38.isMoreMenuEnabled() then reactModule.createElement(foundationModule.View, {
							LayoutOrder = 2,
							tag = "size-full-0 row gap-small auto-y align-y-center"
						}, {
							MoreMenu = if not p38.props.shouldHideMoreMenuButton then roactModule.createElement(chatConversationMoreMenuModule, {
								layoutOrder = 1,
								conversation = p38.props.conversation,
								conversationId = p38.props.conversationId,
								navigateToSquadLobby = p38.props.navigateToSquadLobby,
								showButtonText = not p38.props.shouldShowChatInputBar,
								tooltipText = p38.state.tooltipText
							}) else nil,
							ChatInputBar = if p38.props.shouldShowChatInputBar then roactModule.createElement(var11, {
								LayoutOrder = 2,
								onFocusLost = p38.clearKeyboardOffset,
								conversationId = p38.props.conversationId,
								inputBoxRef = p38.inputBoxRef,
								inputBarRef = p38.inputBarRef,
								localUserId = p38.props.localUserId,
								messageListRef = p38.messageListRef,
								onSendChat = p38.onSendChat(p38.props.sendMessage, p38.props.conversationId, p38.props.markConversationAsRead, p39, p38.props.conversation, p38.props.createFriendConversation, p38.props.navigateToChatConversation, p38.props.telemetry),
								onSendBtnClicked = p38.onSendBtnClicked(p38.props.telemetry),
								onTextChanged = p38.chatInputTextChanged,
								placeholderText = p38.props.chatInputPlaceholder,
								isDisabled = p38.props.shouldDisableChatInputBar,
								inputBarDisabledText = p38.props.inputBarDisabledText,
								disabledEndTimestampDisplay = p38.props.inputBarDisabledEndTimestampDisplay,
								onDisabledInputBarActivated = p38.props.onDisabledInputBarActivated,
								moreMenuEnabled = p38.isMoreMenuEnabled()
							}) else nil
						}) else nil,
						ChatInputBar = if p38.isMoreMenuEnabled() or not p38.props.shouldShowChatInputBar then nil else roactModule.createElement(var11, {
							LayoutOrder = 4,
							onFocusLost = p38.clearKeyboardOffset,
							conversationId = p38.props.conversationId,
							inputBoxRef = p38.inputBoxRef,
							inputBarRef = p38.inputBarRef,
							localUserId = p38.props.localUserId,
							messageListRef = p38.messageListRef,
							onSendChat = p38.onSendChat(p38.props.sendMessage, p38.props.conversationId, p38.props.markConversationAsRead, p39, p38.props.conversation, p38.props.createFriendConversation, p38.props.navigateToChatConversation, p38.props.telemetry),
							onSendBtnClicked = p38.onSendBtnClicked(p38.props.telemetry),
							onTextChanged = p38.chatInputTextChanged,
							placeholderText = p38.props.chatInputPlaceholder,
							isDisabled = p38.props.shouldDisableChatInputBar,
							inputBarDisabledText = p38.props.inputBarDisabledText,
							disabledEndTimestampDisplay = p38.props.inputBarDisabledEndTimestampDisplay,
							onDisabledInputBarActivated = p38.props.onDisabledInputBarActivated,
							moreMenuEnabled = p38.isMoreMenuEnabled()
						})
					})
				else
					var62 = nil
				end
				t_1.ReplyAndInputContainer = var62
				t_1.ReplyComposeBar = if fFlagAppChatReplyComposeBarContainerModule or not (if fFlagAppChatSignalsReplyStoreModule then p38.props.replyingToMessageId else p38.props.replyingToMessage) then nil else roactModule.createElement(replyComposeBarContainerModule, {
					LayoutOrder = 3,
					message = if not fFlagAppChatSignalsReplyStoreModule then p38.props.replyingToMessage else nil,
					close = p38.closeReplying,
					setReplyComposeBarHeight = p38.setReplyComposeBarHeight,
					inputBoxRef = p38.inputBoxRef
				})
				t_1.Divider = if fFlagAppChatReplyComposeBarContainerModule or not p38.isMoreMenuEnabled() or (p38.props.shouldShowChatInputBar or p38.props.shouldHideMoreMenuButton) then nil else reactModule.createElement(foundationModule.View, {
					LayoutOrder = 4,
					tag = "size-full-0 auto-y stroke-standard stroke-default"
				})
				t_1.ActionInputContainer = if fFlagAppChatReplyComposeBarContainerModule or not p38.isMoreMenuEnabled() then nil else reactModule.createElement(foundationModule.View, {
					tag = "size-full-0 row gap-small auto-y align-y-center padding-y-small",
					LayoutOrder = if not p38.props.shouldShowChatInputBar then 4 else 5,
					padding = { left = UDim.new(0, p41.left), right = var58 },
					onAbsoluteSizeChanged = p38.onHeightChanged
				}, {
					MoreMenu = if not p38.props.shouldHideMoreMenuButton then roactModule.createElement(chatConversationMoreMenuModule, {
						layoutOrder = 1,
						conversation = p38.props.conversation,
						conversationId = p38.props.conversationId,
						navigateToSquadLobby = p38.props.navigateToSquadLobby,
						showButtonText = not p38.props.shouldShowChatInputBar,
						tooltipText = p38.state.tooltipText
					}) else nil,
					ChatInputBar = if p38.props.shouldShowChatInputBar then roactModule.createElement(var11, {
						LayoutOrder = 2,
						onFocusLost = p38.clearKeyboardOffset,
						conversationId = p38.props.conversationId,
						inputBoxRef = p38.inputBoxRef,
						inputBarRef = p38.inputBarRef,
						localUserId = p38.props.localUserId,
						messageListRef = p38.messageListRef,
						onSendChat = p38.onSendChat(p38.props.sendMessage, p38.props.conversationId, p38.props.markConversationAsRead, p39, p38.props.conversation, p38.props.createFriendConversation, p38.props.navigateToChatConversation, p38.props.telemetry),
						onSendBtnClicked = p38.onSendBtnClicked(p38.props.telemetry),
						onTextChanged = p38.chatInputTextChanged,
						placeholderText = p38.props.chatInputPlaceholder,
						isDisabled = p38.props.shouldDisableChatInputBar,
						inputBarDisabledText = p38.props.inputBarDisabledText,
						disabledEndTimestampDisplay = p38.props.inputBarDisabledEndTimestampDisplay,
						onDisabledInputBarActivated = p38.props.onDisabledInputBarActivated,
						moreMenuEnabled = p38.props.moreMenuEnabled
					}) else nil
				})
				t_1.ChatInputBar = if fFlagAppChatReplyComposeBarContainerModule or p38.isMoreMenuEnabled() or not p38.props.shouldShowChatInputBar then nil else roactModule.createElement(var11, {
					LayoutOrder = 4,
					onFocusLost = p38.clearKeyboardOffset,
					conversationId = p38.props.conversationId,
					inputBoxRef = p38.inputBoxRef,
					inputBarRef = p38.inputBarRef,
					localUserId = p38.props.localUserId,
					messageListRef = p38.messageListRef,
					onHeightChanged = if p38.isMoreMenuEnabled() then nil else p38.onHeightChanged,
					onSendChat = p38.onSendChat(p38.props.sendMessage, p38.props.conversationId, p38.props.markConversationAsRead, p39, p38.props.conversation, p38.props.createFriendConversation, p38.props.navigateToChatConversation, p38.props.telemetry),
					onSendBtnClicked = p38.onSendBtnClicked(p38.props.telemetry),
					onTextChanged = p38.chatInputTextChanged,
					placeholderText = p38.props.chatInputPlaceholder,
					isDisabled = p38.props.shouldDisableChatInputBar,
					inputBarDisabledText = p38.props.inputBarDisabledText,
					disabledEndTimestampDisplay = p38.props.inputBarDisabledEndTimestampDisplay,
					onDisabledInputBarActivated = p38.props.onDisabledInputBarActivated,
					moreMenuEnabled = p38.props.moreMenuEnabled
				})
				t_1.BottomModal = reactModule.createElement(conversationBottomModalContainerModule, {
					layoutOrder = 5,
					conversationId = p38.props.conversationId,
					onHeightChanged = p38.setBottomModalHeight,
					legacyBottomModalText = p38.props.bottomModalText,
					shouldShowLegacyBottomModal = p38.props.shouldShowLegacyBottomModal,
					shouldShowChatInputBar = p38.props.shouldShowChatInputBar
				})
				
				return createElement(var59, t, t_1)
			end)
		end)
	end)
end

return connectTelemetryModule(chatConversationTelemetryLayerModule.Context)(roactNavigationModule.withNavigation(chatConversation))