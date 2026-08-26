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
local var1 = if fFlagAppChatConversationLoadingSkeletonModule then require(script.Parent.ConversationMessageSkeletonList) else nil
local fFlagAppChatEnableAutotranslationModule = require(appChat.Flags.FFlagAppChatEnableAutotranslation)
local fFlagAppChatAutotranslationRespectsExperienceChatSettingModule = require(appChat.Flags.FFlagAppChatAutotranslationRespectsExperienceChatSetting)
local appChatPerfChatConversationPaginationWindowSize = game:DefineFastInt("AppChatPerfChatConversationPaginationWindowSize", 2)
local appChatPerfChatConversationPaginationInitialRender = game:DefineFastInt("AppChatPerfChatConversationPaginationInitialRender", 10)
local appChatPerfChatConversationPaginationOnStartReached = game:DefineFastInt("AppChatPerfChatConversationPaginationOnStartReached", 64)
local appChatPerfChatConversationPaginationOnEndReached = game:DefineFastInt("AppChatPerfChatConversationPaginationOnEndReached", 100)

local function isIncomingChatMessage(a)
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
	loadNext = function() end,
	markAsRead = function() end,
	onDetailsOpened = function() end,
	openGameDetailsPage = function(_, _) end,
	closeKeyboard = function() end
}

local function compareItemData(p1, p2)
	local var2
	if p1 == nil or p2 == nil then
		return false
	elseif p1.stable_key ~= nil then
		var2 = true
		
		if p1.stable_key ~= p2.stable_key then
			var2 = p1.messageId ~= nil and p1.messageId == p2.messageId
		end
		return var2
	end
end

function messageList.init(p1)
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), messageModelModule (ref), enumMessageTypesModule (ref), roactModule (ref), fFlagAppChatAutotranslationRespectsExperienceChatSettingModule (ref), getLastMessageWithFilterModule (ref), isIncomingChatMessage (ref), customMessageEntryContainerModule (ref), systemMessageContainerModule (ref), getFFlagEnableSocialCards (ref), fFlagAppChatEnableAutotranslationModule (ref), chatMessageModule (ref), messageModelModule_1 (ref), systemMessageModule (ref), createScrollIntervalTrackerModule (ref), appChatPerfTrackerModule (ref), focusNavigationService (ref), coreGui (ref)
	p1.state = {
		width = 0,
		startIndex = 1,
		firstItem = p1.props.itemList[1]
	}
	p1.focusIndex = p1.props.initialFocusIndex
	
	if fFlagAppChatPerfTrackingModule then
		p1._scrollIntervalTracker = nil
	end
	function p2.isValidMessageAndSenderType(p2, p3)
		-- upvalues: messageModelModule (copy), enumMessageTypesModule (copy)
		return if p3 == messageModelModule.SenderTypes.System then p2 == enumMessageTypesModule.System elseif p3 == messageModelModule.SenderTypes.User then if p2 ~= enumMessageTypesModule.PlainText then p2 == enumMessageTypesModule.Link else true else p2 == enumMessageTypesModule.Custom
	end
	
	p1.ref = p1.props.messageListRef or roactModule.createRef()
	local var2 = if fFlagAppChatAutotranslationRespectsExperienceChatSettingModule then game:GetService("TextChatService").ChatTranslationEnabled else false
	p1.lastIncomingChatMessageId = nil
	
	if p1.props.itemList then
		p1.lastIncomingChatMessageId = getLastMessageWithFilterModule(p1.props.itemList, isIncomingChatMessage)
	end
	function p2.renderItem(p2)
		-- upvalues: p1 (ref), roactModule (copy), enumMessageTypesModule (copy), customMessageEntryContainerModule (copy), systemMessageContainerModule (copy), getFFlagEnableSocialCards (copy), fFlagAppChatEnableAutotranslationModule (copy), fFlagAppChatAutotranslationRespectsExperienceChatSettingModule (copy), var2 (ref), chatMessageModule (copy), messageModelModule_1 (copy), systemMessageModule (copy)
		if not p1.isValidMessageAndSenderType(p2.messageType, p2.senderType) then
			return roactModule.createElement(systemMessageModule, { Text = p1.props.invalidMessageTypeText })
		end
		local stringValue = p1.props.isDebugEnabled and roactModule.createElement("StringValue", { Value = tostring(p2.messageId) })
		
		if p2.messageType == enumMessageTypesModule.Custom then
			return roactModule.createElement(customMessageEntryContainerModule, {
				openViewProfile = p1.props.openViewProfile,
				customEntryType = p2.customEntryType,
				conversationId = p1.props.conversationId
			})
		elseif p2.messageType == enumMessageTypesModule.System then
			return roactModule.createElement(systemMessageContainerModule, {
				cards = if getFFlagEnableSocialCards() then p2.cards else nil,
				text = p2.content,
				parentWidth = p1.state.width,
				sent = p2.sent,
				showDateTime = p2.showDateTime,
				messageId = p2.messageId,
				senderTargetId = if getFFlagEnableSocialCards() then p2.senderTargetId else nil,
				debugElement = stringValue
			})
		end
		local additionalProps = p2.additionalProps
		
		if additionalProps then
			additionalProps.onDetailsOpened = p1.props.onDetailsOpened
		end
		additionalProps = additionalProps or {}
		additionalProps.openGameDetailsPage = p1.props.openGameDetailsPage
		additionalProps.openMomentsDeepLink = p1.props.openMomentsDeepLink
		additionalProps.shareLink = p2.shareLink
		
		return roactModule.createElement(chatMessageModule, {
			additionalProps = additionalProps,
			content = p2.content,
			debugElement = stringValue,
			failed = p2.failed,
			filteredForReceivers = p2.filteredForReceivers,
			isIncoming = p2.isIncoming,
			isNewSender = p2.isNewSender,
			isSending = p2.isSending,
			isUnfiltered = p2.moderationType == messageModelModule_1.ModerationTypes.TrustedComms,
			isLastMessageInMessageGroup = p2.isLastMessageInMessageGroup,
			isLastIncomingChatMessage = p2.messageId == p1.lastIncomingChatMessageId,
			messageDefaultNoticeText = p1.props.messageDefaultNoticeText,
			conversationId = p1.props.conversationId,
			messageId = p2.messageId,
			messageModeratedNoticeText = p1.props.messageModeratedNoticeText,
			messageHiddenNoticeText = p1.props.messageHiddenNoticeText,
			messageType = p2.messageType,
			moderated = p2.moderated,
			openViewProfile = p1.props.openViewProfile,
			parentWidth = p1.state.width,
			readingMessagesIsEnabled = true,
			senderUserId = p2.senderTargetId,
			sent = p2.sent,
			showDateTime = p2.showDateTime,
			showDisplayName = p2.showDisplayName,
			shouldShowName = p2.sender.shouldShowName,
			thumbnail = p2.sender.thumbnail,
			wideMode = p1.props.wideMode,
			unknownUserText = p1.props.unknownUserText,
			viewProfileOnAvatarPressed = p1.props.viewProfileOnAvatarPressed,
			closeKeyboard = p1.props.closeKeyboard,
			inputBoxRef = p1.props.inputBoxRef,
			repliesTo = p2.repliesTo,
			visibility = p2.visibility,
			translatedText = if fFlagAppChatEnableAutotranslationModule then if fFlagAppChatAutotranslationRespectsExperienceChatSettingModule then if var2 then p2.contentToDisplay else nil else p2.contentToDisplay else nil
		})
	end
	
	function p2.updateWidth(p2)
		-- upvalues: p1 (ref)
		if p2.AbsoluteSize.X ~= p1.state.width then
			p1:setState({ width = p2.AbsoluteSize.X })
		end
	end
	
	function p2.changeFocus(p2)
		-- upvalues: p1 (ref)
		p1.isNearBottom = p2.anchorIndex <= p1.props.autoScrollMaxIndex + 1
		p1.focusIndex = if p1.isNearBottom then 1 else p2.anchorIndex + 1
		
		if p2.anchorIndex == 1 and not p1.props.itemList[1].read then
			p1.props.markAsRead()
		end
	end
	
	function p2.identifier(p2)
		return p2.messageId .. "|" .. (p2.position or "")
	end
	
	function p2.getScrollRef()
		-- upvalues: p1 (ref)
		if p1.ref.current == nil then
			return nil
		end
		local nativeScrollRef = p1.ref.current._listRef._scrollRef.getNativeScrollRef()
		
		return if nativeScrollRef == nil then nil else nativeScrollRef._nativeRef.current
	end
	
	function p2.calculateScrollOffset(p2)
		return p2.AbsoluteCanvasSize.Y - p2.CanvasPosition.Y - p2.AbsoluteWindowSize.Y
	end
	
	function p2.onScroll(p2)
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), p1 (ref), createScrollIntervalTrackerModule (copy), appChatPerfTrackerModule (copy)
		if fFlagAppChatPerfTrackingModule then
			if p1._scrollIntervalTracker == nil then
				local scrollRef = p1.getScrollRef()
				
				if scrollRef ~= nil then
					p1._scrollIntervalTracker = createScrollIntervalTrackerModule(appChatPerfTrackerModule.Events.ScrollMessageList, scrollRef, { conversationId = p1.props.conversationId })
				end
			end
			if p1._scrollIntervalTracker then
				p1._scrollIntervalTracker.onScrollTick()
			end
		end
		local var3 = p1.calculateScrollOffset(p2)
		
		if var3 < 512 then
			p1:setState(function(_, p3)
				return { firstItem = p3.itemList[1] }
			end)
		end
		if var3 < 64 then
			p1.props.markAsRead()
		end
		p1.isNearBottom = var3 < 64
	end
	
	p1.initialFetchesAttempted = 0
	p1.focusNavigationService = focusNavigationService.new(coreGui)
end

function messageList.getDerivedStateFromProps(p1, p2)
	if p2.firstItem == nil then
		return { startIndex = 1 }
	end
	local var2 = 1
	while var2 <= #p1.itemList do
		local var3
		local var4 = p1.itemList[var2]
		local firstItem = p2.firstItem
		
		if var4 == nil or firstItem == nil then
			var3 = false
		elseif var4.stable_key ~= nil then
			var3 = true
			
			if var4.stable_key ~= firstItem.stable_key then
				var3 = var4.messageId ~= nil and var4.messageId == firstItem.messageId
			end
		end
		if var3 then break end
		var2 += 1
	end
	return if #p1.itemList < var2 then { startIndex = 1 } else { startIndex = var2 }
end

function messageList.didUpdate(p3, p4, _)
	-- upvalues: fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), appChatInitialMessageFetchLimit (ref), appChatMessageInitialFetchMinMessages (ref), appChatOsaAutoScrollDelayMs (ref), getLastMessageWithFilterModule (ref), isIncomingChatMessage (ref)
	if fFlagAppChatPerfTrackingModule and #p4.itemList < #p3.props.itemList then
		appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.PaginationMessageList, { conversationId = p3.props.conversationId })
	end
	if p3.props.itemList and #p3.props.itemList == 0 and (p4.itemList and #p4.itemList > 0) then
		p3.initialFetchesAttempted = 0
	end
	if p3.props.itemList and p3.props.itemList ~= p4.itemList and (p3.initialFetchesAttempted < appChatInitialMessageFetchLimit and #p3.props.itemList < appChatMessageInitialFetchMinMessages) and p3.props.loadNext then
		p3.initialFetchesAttempted += 1
		p3.props.loadNext()
	end
	if p4.conversationId ~= p3.props.conversationId then
		p3.isNearBottom = true
	end
	local scrollRef = p3.getScrollRef()
	
	if (if scrollRef ~= nil then 0 else p3.calculateScrollOffset(scrollRef)) < 64 then
		p3.isNearBottom = true
		
		if #p3.props.itemList > 0 then
			p3.props.markAsRead()
		end
	end
	if p4.readingMessagesIsEnabled ~= p3.props.readingMessagesIsEnabled and p3.props.readingMessagesIsEnabled and p3.isNearBottom then
		p3.props.markAsRead()
	end
	if p3.props.scrollToTopOnInitialOsaLoad and not p4.scrollToTopOnInitialOsaLoad and #p3.props.itemList > 0 then
		local current = p3.ref and p3.ref.current
		
		if current and current.scrollToEnd then
			task.delay(appChatOsaAutoScrollDelayMs / 1000, function()
				-- upvalues: current (ref), p3 (ref)
				current:scrollToIndex({ animated = false, index = #p3.props.itemList })
			end)
		end
	end
	if p3.props.itemList and not p3.lastIncomingChatMessageId then
		p3.lastIncomingChatMessageId = getLastMessageWithFilterModule(p3.props.itemList, isIncomingChatMessage)
	end
end

function messageList.didMount(p3)
	-- upvalues: appChatMessageInitialFetchMinMessages (ref)
	if #p3.props.itemList < appChatMessageInitialFetchMinMessages and p3.props.loadNext then
		p3.props.loadNext()
	end
	p3.isNearBottom = true
	local scrollRef = p3.getScrollRef()
	
	if scrollRef ~= nil then
		scrollRef.Selectable = false
	end
end

function messageList.willUnmount(p3)
	-- upvalues: fFlagAppChatPerfTrackingModule (ref)
	if fFlagAppChatPerfTrackingModule and p3._scrollIntervalTracker then
		p3._scrollIntervalTracker.cleanup()
	end
	p3.focusNavigationService:teardown()
end

function messageList.renderScrollingFrame(p3)
	-- upvalues: roactModule (ref), bidirectionalFlatList (ref), appChatPerfChatConversationPaginationWindowSize (ref), appChatPerfChatConversationPaginationInitialRender (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), promiseModule (ref), appChatPerfChatConversationPaginationOnEndReached (ref), appChatPerfChatConversationPaginationOnStartReached (ref), compareItemData (ref)
	local t = {}
	local startIndex = p3.state.startIndex
	
	if startIndex ~= 1 then
		local scrollRef = p3.getScrollRef()
		
		if (if scrollRef ~= nil then 0 else p3.calculateScrollOffset(scrollRef)) < 128 then
			startIndex = 1
		end
	end
	if startIndex ~= 1 then
		local var5
		local var6 = p3.props.itemList[1]
		local firstItem = p3.state.firstItem
		
		if var6 == nil or firstItem == nil then
			var5 = false
		elseif var6.stable_key ~= nil then
			var5 = true
			
			if var6.stable_key ~= firstItem.stable_key then
				var5 = var6.messageId ~= nil and var6.messageId == firstItem.messageId
			end
		end
		if var5 then
			t = p3.props.itemList
		else
			table.move(p3.props.itemList, startIndex, #p3.props.itemList, 1, t)
		end
		return roactModule.createElement(bidirectionalFlatList, {
			data = t,
			renderItem = function(p4)
				-- upvalues: p3 (ref)
				return p3.renderItem(p4.item)
			end,
			inverted = true,
			Size = p3.props.Size,
			style = {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				Name = "MessageList"
			},
			contentContainerStyle = { BackgroundTransparency = 1 },
			keyExtractor = function(p4, p5)
				return p4.stable_key or (p4.messageId or p5)
			end,
			windowSize = appChatPerfChatConversationPaginationWindowSize,
			initialNumToRender = if p3.props.scrollToTopOnInitialOsaLoad then #t else appChatPerfChatConversationPaginationInitialRender,
			onScroll = p3.onScroll,
			onEndReached = function()
				-- upvalues: fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), p3 (ref), promiseModule (copy)
				if fFlagAppChatPerfTrackingModule then
					appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.PaginationMessageList, { conversationId = p3.props.conversationId })
				end
				p3.props.loadNext()
				
				return promiseModule.resolve()
			end,
			onEndReachedThreshold = appChatPerfChatConversationPaginationOnEndReached,
			onStartReachedThreshold = appChatPerfChatConversationPaginationOnStartReached,
			compareItemData = compareItemData,
			scrollEventThrottle = p3.props.scrollEventThrottle or 75,
			[roactModule.Ref] = p3.ref,
			autoscrollToTopThreshold = 33,
			enableAutoscrollToTop = true,
			ListHeaderComponent = function()
				-- upvalues: roactModule (copy)
				return roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 10)
				})
			end,
			showDefaultLoadingIndicators = false,
			onContentSizeChange = function(p4, _)
				-- upvalues: p3 (ref)
				p3:setState({ width = p4 })
			end,
			optimizeInvertedCanvasResize = true,
			UNSTABLE_forceSiblingLayoutUpdate = true
		})
	end
end

function messageList.renderEmptyMessageList(p3)
	-- upvalues: roactModule (ref)
	return roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = p3.props.Size })
end

function messageList.render(p3)
	-- upvalues: fFlagAppChatConversationLoadingSkeletonModule (ref), roactModule (ref), var1 (ref)
	return if fFlagAppChatConversationLoadingSkeletonModule and p3.props.isInitialMessageLoading then roactModule.createElement(var1, { size = p3.props.Size }) elseif #p3.props.itemList == 0 then p3:renderEmptyMessageList() else p3:renderScrollingFrame()
end

return messageList