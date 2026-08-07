local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local roactModule = require(parent.Roact)
local bidirectionalFlatList = require(parent.VirtualizedList).BidirectionalFlatList
local promiseModule = require(parent.Promise)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationService = reactFocusNavigationModule.FocusNavigationService
local coreGui = reactFocusNavigationModule.EngineInterface.CoreGui
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local createScrollIntervalTrackerModule = require(appChat.Telemetry.createScrollIntervalTracker)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local messageModelModule = require(appChat.Models.MessageModel)
local enumMessageTypesModule = require(appChat.Components.ChatConversation.EnumMessageTypes)
local messageModelModule_1 = require(appChat.Models.MessageModel)
local getLastMessageWithFilterModule = require(script.Parent.Utils.getLastMessageWithFilter)
local chatMessageModule = require(script.Parent.ChatMessage)
local systemMessageModule = require(script.Parent.SystemMessage)
local systemMessageContainerModule = require(script.Parent.SystemMessageContainer)
local customMessageEntryContainerModule = require(script.Parent.CustomMessageEntryContainer)
local getFFlagEnableSocialCards = require(parent.SharedFlags).GetFFlagEnableSocialCards
local appChatMessageInitialFetchMinMessages = game:DefineFastInt("AppChatMessageInitialFetchMinMessages", 20)
local appChatInitialMessageFetchLimit = game:DefineFastInt("AppChatInitialMessageFetchLimit", 10)
local appChatOsaAutoScrollDelayMs = game:DefineFastInt("AppChatOsaAutoScrollDelayMs", 100)
local fFlagAppChatConversationLoadingSkeletonModule = require(appChat.Flags.FFlagAppChatConversationLoadingSkeleton)
local var19 = if fFlagAppChatConversationLoadingSkeletonModule then require(script.Parent.ConversationMessageSkeletonList) else nil
local fFlagAppChatEnableAutotranslationModule = require(appChat.Flags.FFlagAppChatEnableAutotranslation)
local fFlagAppChatAutotranslationRespectsExperienceChatSettingModule = require(appChat.Flags.FFlagAppChatAutotranslationRespectsExperienceChatSetting)
local appChatPerfChatConversationPaginationWindowSize = game:DefineFastInt("AppChatPerfChatConversationPaginationWindowSize", 2)
local appChatPerfChatConversationPaginationInitialRender = game:DefineFastInt("AppChatPerfChatConversationPaginationInitialRender", 10)
local appChatPerfChatConversationPaginationOnStartReached = game:DefineFastInt("AppChatPerfChatConversationPaginationOnStartReached", 64)
local appChatPerfChatConversationPaginationOnEndReached = game:DefineFastInt("AppChatPerfChatConversationPaginationOnEndReached", 100)

local function isIncomingChatMessage(a) --[[ line: 50 ]]
	-- upvalues: enumMessageTypesModule (ref)
	return a.isIncoming and (if a.messageType ~= enumMessageTypesModule.PlainText then a.messageType == enumMessageTypesModule.Link else true)
end

local messageList = roactModule.PureComponent:extend("MessageList")
messageList.defaultProps = {
	autoScrollMaxIndex = 3,
	bottomMargin = 10,
	conversationId = nil,
	initialFocusIndex = 1,
	isDebugEnabled = false,
	messageListRef = nil,
	openViewProfile = nil,
	wideMode = false,
	viewProfileOnAvatarPressed = true,
	inputBoxRef = nil,
	invalidMessageTypeText = "PLACEHOLDER This message could not be displayed",
	messageDefaultNoticeText = "PLACEHOLDER Not everyone in this chat can see your message.",
	messageModeratedNoticeText = "PLACEHOLDER Your message was moderated and not sent.",
	unknownUserText = "PLACEHOLDER unknown user",
	scrollToTopOnInitialOsaLoad = false,
	Size = UDim2.new(1, 0, 1, 0),
	itemList = {},
	loadNext = function() --[[ line: 65 ]] end,
	markAsRead = function() --[[ line: 66 ]] end,
	onDetailsOpened = function() --[[ line: 68 ]] end,
	openGameDetailsPage = function(_, _) --[[ line: 69 ]] end,
	closeKeyboard = function() --[[ line: 73 ]] end
}

local function compareItemData(p0, p1) --[[ line: 83 ]]
	local var29
	if p0 == nil or p1 == nil then
		return false
	elseif p0.stable_key ~= nil then
		var29 = true
		
		if p0.stable_key ~= p1.stable_key then
			var29 = p0.messageId ~= nil and p0.messageId == p1.messageId
		end
		return var29
	end
end

function messageList.init(p2) --[[ line: 92 ]]
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), messageModelModule (ref), enumMessageTypesModule (ref), roactModule (ref), fFlagAppChatAutotranslationRespectsExperienceChatSettingModule (ref), getLastMessageWithFilterModule (ref), isIncomingChatMessage (ref), customMessageEntryContainerModule (ref), systemMessageContainerModule (ref), getFFlagEnableSocialCards (ref), fFlagAppChatEnableAutotranslationModule (ref), chatMessageModule (ref), messageModelModule_1 (ref), systemMessageModule (ref), createScrollIntervalTrackerModule (ref), appChatPerfTrackerModule (ref), focusNavigationService (ref), coreGui (ref)
	p2.state = {
		width = 0,
		startIndex = 1,
		firstItem = p2.props.itemList[1]
	}
	p2.focusIndex = p2.props.initialFocusIndex
	
	if fFlagAppChatPerfTrackingModule then
		p2._scrollIntervalTracker = nil
	end
	function p2.isValidMessageAndSenderType(p3, p4) --[[ line: 105 ]]
		-- upvalues: messageModelModule (copy), enumMessageTypesModule (copy)
		return if p4 == messageModelModule.SenderTypes.System then p3 == enumMessageTypesModule.System elseif p4 == messageModelModule.SenderTypes.User then if p3 ~= enumMessageTypesModule.PlainText then p3 == enumMessageTypesModule.Link else true else p3 == enumMessageTypesModule.Custom
	end
	
	p2.ref = p2.props.messageListRef or roactModule.createRef()
	local var30 = if fFlagAppChatAutotranslationRespectsExperienceChatSettingModule then game:GetService("TextChatService").ChatTranslationEnabled else false
	p2.lastIncomingChatMessageId = nil
	
	if p2.props.itemList then
		p2.lastIncomingChatMessageId = getLastMessageWithFilterModule(p2.props.itemList, isIncomingChatMessage)
	end
	function p2.renderItem(p5) --[[ line: 130 ]]
		-- upvalues: p2 (ref), roactModule (copy), enumMessageTypesModule (copy), customMessageEntryContainerModule (copy), systemMessageContainerModule (copy), getFFlagEnableSocialCards (copy), fFlagAppChatEnableAutotranslationModule (copy), fFlagAppChatAutotranslationRespectsExperienceChatSettingModule (copy), var30 (ref), chatMessageModule (copy), messageModelModule_1 (copy), systemMessageModule (copy)
		if not p2.isValidMessageAndSenderType(p5.messageType, p5.senderType) then
			return roactModule.createElement(systemMessageModule, { Text = p2.props.invalidMessageTypeText })
		end
		local stringValue = p2.props.isDebugEnabled and roactModule.createElement("StringValue", { Value = tostring(p5.messageId) })
		
		if p5.messageType == enumMessageTypesModule.Custom then
			return roactModule.createElement(customMessageEntryContainerModule, {
				openViewProfile = p2.props.openViewProfile,
				customEntryType = p5.customEntryType,
				conversationId = p2.props.conversationId
			})
		elseif p5.messageType == enumMessageTypesModule.System then
			return roactModule.createElement(systemMessageContainerModule, {
				cards = if getFFlagEnableSocialCards() then p5.cards else nil,
				text = p5.content,
				parentWidth = p2.state.width,
				sent = p5.sent,
				showDateTime = p5.showDateTime,
				messageId = p5.messageId,
				senderTargetId = if getFFlagEnableSocialCards() then p5.senderTargetId else nil,
				debugElement = stringValue
			})
		end
		local additionalProps = p5.additionalProps
		
		if additionalProps then
			additionalProps.onDetailsOpened = p2.props.onDetailsOpened
		end
		additionalProps = additionalProps or {}
		additionalProps.openGameDetailsPage = p2.props.openGameDetailsPage
		additionalProps.shareLink = p5.shareLink
		
		return roactModule.createElement(chatMessageModule, {
			additionalProps = additionalProps,
			content = p5.content,
			debugElement = stringValue,
			failed = p5.failed,
			filteredForReceivers = p5.filteredForReceivers,
			isIncoming = p5.isIncoming,
			isNewSender = p5.isNewSender,
			isSending = p5.isSending,
			isUnfiltered = p5.moderationType == messageModelModule_1.ModerationTypes.TrustedComms,
			isLastMessageInMessageGroup = p5.isLastMessageInMessageGroup,
			isLastIncomingChatMessage = p5.messageId == p2.lastIncomingChatMessageId,
			messageDefaultNoticeText = p2.props.messageDefaultNoticeText,
			conversationId = p2.props.conversationId,
			messageId = p5.messageId,
			messageModeratedNoticeText = p2.props.messageModeratedNoticeText,
			messageHiddenNoticeText = p2.props.messageHiddenNoticeText,
			messageType = p5.messageType,
			moderated = p5.moderated,
			openViewProfile = p2.props.openViewProfile,
			parentWidth = p2.state.width,
			readingMessagesIsEnabled = true,
			senderUserId = p5.senderTargetId,
			sent = p5.sent,
			showDateTime = p5.showDateTime,
			showDisplayName = p5.showDisplayName,
			shouldShowName = p5.sender.shouldShowName,
			thumbnail = p5.sender.thumbnail,
			wideMode = p2.props.wideMode,
			unknownUserText = p2.props.unknownUserText,
			viewProfileOnAvatarPressed = p2.props.viewProfileOnAvatarPressed,
			closeKeyboard = p2.props.closeKeyboard,
			inputBoxRef = p2.props.inputBoxRef,
			repliesTo = p5.repliesTo,
			visibility = p5.visibility,
			translatedText = if fFlagAppChatEnableAutotranslationModule then if fFlagAppChatAutotranslationRespectsExperienceChatSettingModule then if var30 then p5.contentToDisplay else nil else p5.contentToDisplay else nil
		})
	end
	
	function p2.updateWidth(p6) --[[ line: 225 ]]
		-- upvalues: p2 (ref)
		if p6.AbsoluteSize.X ~= p2.state.width then
			p2:setState({ width = p6.AbsoluteSize.X })
		end
	end
	
	function p2.changeFocus(p7) --[[ line: 232 ]]
		-- upvalues: p2 (ref)
		p2.isNearBottom = p7.anchorIndex <= p2.props.autoScrollMaxIndex + 1
		p2.focusIndex = if p2.isNearBottom then 1 else p7.anchorIndex + 1
		
		if p7.anchorIndex == 1 and not p2.props.itemList[1].read then
			p2.props.markAsRead()
		end
	end
	
	function p2.identifier(p8) --[[ line: 244 ]]
		return p8.messageId .. "|" .. (p8.position or "")
	end
	
	function p2.getScrollRef() --[[ line: 248 ]]
		-- upvalues: p2 (ref)
		if p2.ref.current == nil then
			return nil
		end
		local nativeScrollRef = p2.ref.current._listRef._scrollRef.getNativeScrollRef()
		
		return if nativeScrollRef == nil then nil else nativeScrollRef._nativeRef.current
	end
	
	function p2.calculateScrollOffset(p9) --[[ line: 261 ]]
		return p9.AbsoluteCanvasSize.Y - p9.CanvasPosition.Y - p9.AbsoluteWindowSize.Y
	end
	
	function p2.onScroll(p10) --[[ line: 269 ]]
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), p2 (ref), createScrollIntervalTrackerModule (copy), appChatPerfTrackerModule (copy)
		if fFlagAppChatPerfTrackingModule then
			if p2._scrollIntervalTracker == nil then
				local scrollRef = p2.getScrollRef()
				
				if scrollRef ~= nil then
					p2._scrollIntervalTracker = createScrollIntervalTrackerModule(appChatPerfTrackerModule.Events.ScrollMessageList, scrollRef, { conversationId = p2.props.conversationId })
				end
			end
			if p2._scrollIntervalTracker then
				p2._scrollIntervalTracker.onScrollTick()
			end
		end
		local var34 = p2.calculateScrollOffset(p10)
		
		if var34 < 512 then
			p2:setState(function(_, p11) --[[ line: 288 ]]
				return { firstItem = p11.itemList[1] }
			end)
		end
		if var34 < 64 then
			p2.props.markAsRead()
		end
		p2.isNearBottom = var34 < 64
	end
	
	p2.initialFetchesAttempted = 0
	p2.focusNavigationService = focusNavigationService.new(coreGui)
end

function messageList.getDerivedStateFromProps(p12, p13) --[[ line: 305 ]]
	if p13.firstItem == nil then
		return { startIndex = 1 }
	end
	local var35 = 1
	while var35 <= #p12.itemList do
		local var37
		local var36 = p12.itemList[var35]
		local firstItem = p13.firstItem
		
		if var36 == nil or firstItem == nil then
			var37 = false
		elseif var36.stable_key ~= nil then
			var37 = true
			
			if var36.stable_key ~= firstItem.stable_key then
				var37 = var36.messageId ~= nil and var36.messageId == firstItem.messageId
			end
		end
		if var37 then break end
		var35 += 1
	end
	return if #p12.itemList < var35 then { startIndex = 1 } else { startIndex = var35 }
end

function messageList.didUpdate(p14, p15, _) --[[ line: 330 ]]
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), appChatInitialMessageFetchLimit (ref), appChatMessageInitialFetchMinMessages (ref), appChatOsaAutoScrollDelayMs (ref), getLastMessageWithFilterModule (ref), isIncomingChatMessage (ref)
	if fFlagAppChatPerfTrackingModule and #p15.itemList < #p14.props.itemList then
		appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.PaginationMessageList, { conversationId = p14.props.conversationId })
	end
	if p14.props.itemList and #p14.props.itemList == 0 and (p15.itemList and #p15.itemList > 0) then
		p14.initialFetchesAttempted = 0
	end
	if p14.props.itemList and p14.props.itemList ~= p15.itemList and (p14.initialFetchesAttempted < appChatInitialMessageFetchLimit and #p14.props.itemList < appChatMessageInitialFetchMinMessages) and p14.props.loadNext then
		p14.initialFetchesAttempted += 1
		p14.props.loadNext()
	end
	if p15.conversationId ~= p14.props.conversationId then
		p14.isNearBottom = true
	end
	local scrollRef = p14.getScrollRef()
	
	if (if scrollRef ~= nil then 0 else p14.calculateScrollOffset(scrollRef)) < 64 then
		p14.isNearBottom = true
		
		if #p14.props.itemList > 0 then
			p14.props.markAsRead()
		end
	end
	if p15.readingMessagesIsEnabled ~= p14.props.readingMessagesIsEnabled and p14.props.readingMessagesIsEnabled and p14.isNearBottom then
		p14.props.markAsRead()
	end
	if p14.props.scrollToTopOnInitialOsaLoad and not p15.scrollToTopOnInitialOsaLoad and #p14.props.itemList > 0 then
		local current = p14.ref and p14.ref.current
		
		if current and current.scrollToEnd then
			task.delay(appChatOsaAutoScrollDelayMs / 1000, function() --[[ line: 385 ]]
				-- upvalues: current (ref), p14 (ref)
				current:scrollToIndex({ animated = false, index = #p14.props.itemList })
			end)
		end
	end
	if p14.props.itemList and not p14.lastIncomingChatMessageId then
		p14.lastIncomingChatMessageId = getLastMessageWithFilterModule(p14.props.itemList, isIncomingChatMessage)
	end
end

function messageList.didMount(p16) --[[ line: 396 ]]
	-- upvalues: appChatMessageInitialFetchMinMessages (ref)
	if #p16.props.itemList < appChatMessageInitialFetchMinMessages and p16.props.loadNext then
		p16.props.loadNext()
	end
	p16.isNearBottom = true
	local scrollRef = p16.getScrollRef()
	
	if scrollRef ~= nil then
		scrollRef.Selectable = false
	end
end

function messageList.willUnmount(p17) --[[ line: 407 ]]
	-- upvalues: fFlagAppChatPerfTrackingModule (ref)
	if fFlagAppChatPerfTrackingModule and p17._scrollIntervalTracker then
		p17._scrollIntervalTracker.cleanup()
	end
	p17.focusNavigationService:teardown()
end

function messageList.renderScrollingFrame(p18) --[[ line: 414 ]]
	-- upvalues: roactModule (ref), bidirectionalFlatList (ref), appChatPerfChatConversationPaginationWindowSize (ref), appChatPerfChatConversationPaginationInitialRender (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), promiseModule (ref), appChatPerfChatConversationPaginationOnEndReached (ref), appChatPerfChatConversationPaginationOnStartReached (ref), compareItemData (ref)
	local t = {}
	local startIndex = p18.state.startIndex
	
	if startIndex ~= 1 then
		local scrollRef = p18.getScrollRef()
		
		if (if scrollRef ~= nil then 0 else p18.calculateScrollOffset(scrollRef)) < 128 then
			startIndex = 1
		end
	end
	if startIndex ~= 1 then
		local var44
		local var43 = p18.props.itemList[1]
		local firstItem = p18.state.firstItem
		
		if var43 == nil or firstItem == nil then
			var44 = false
		elseif var43.stable_key ~= nil then
			var44 = true
			
			if var43.stable_key ~= firstItem.stable_key then
				var44 = var43.messageId ~= nil and var43.messageId == firstItem.messageId
			end
		end
		if var44 then
			t = p18.props.itemList
		else
			table.move(p18.props.itemList, startIndex, #p18.props.itemList, 1, t)
		end
		return roactModule.createElement(bidirectionalFlatList, {
			data = t,
			renderItem = function(p19) --[[ line: 434 ]]
				-- upvalues: p18 (ref)
				return p18.renderItem(p19.item)
			end,
			inverted = true,
			Size = p18.props.Size,
			style = {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				Name = "MessageList"
			},
			contentContainerStyle = { BackgroundTransparency = 1 },
			keyExtractor = function(p20, p21) --[[ line: 448 ]]
				return p20.stable_key or (p20.messageId or p21)
			end,
			windowSize = appChatPerfChatConversationPaginationWindowSize,
			initialNumToRender = if p18.props.scrollToTopOnInitialOsaLoad then #t else appChatPerfChatConversationPaginationInitialRender,
			onScroll = p18.onScroll,
			onEndReached = function() --[[ line: 457 ]]
				-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), p18 (ref), promiseModule (copy)
				if fFlagAppChatPerfTrackingModule then
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.PaginationMessageList, { conversationId = p18.props.conversationId })
				end
				p18.props.loadNext()
				
				return promiseModule.resolve()
			end,
			onEndReachedThreshold = appChatPerfChatConversationPaginationOnEndReached,
			onStartReachedThreshold = appChatPerfChatConversationPaginationOnStartReached,
			compareItemData = compareItemData,
			scrollEventThrottle = p18.props.scrollEventThrottle or 75,
			[roactModule.Ref] = p18.ref,
			autoscrollToTopThreshold = 33,
			enableAutoscrollToTop = true,
			ListHeaderComponent = function() --[[ line: 475 ]]
				-- upvalues: roactModule (copy)
				return roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 10)
				})
			end,
			showDefaultLoadingIndicators = false,
			onContentSizeChange = function(p22, _) --[[ line: 482 ]]
				-- upvalues: p18 (ref)
				p18:setState({ width = p22 })
			end,
			optimizeInvertedCanvasResize = true,
			UNSTABLE_forceSiblingLayoutUpdate = true
		})
	end
end

function messageList.renderEmptyMessageList(p23) --[[ line: 492 ]]
	-- upvalues: roactModule (ref)
	return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = p23.props.Size })
end

function messageList.render(p24) --[[ line: 499 ]]
	-- upvalues: fFlagAppChatConversationLoadingSkeletonModule (ref), roactModule (ref), var19 (ref)
	return if fFlagAppChatConversationLoadingSkeletonModule and p24.props.isInitialMessageLoading then roactModule.createElement(var19, { size = p24.props.Size }) elseif #p24.props.itemList == 0 then p24:renderEmptyMessageList() else p24:renderScrollingFrame()
end

return messageList