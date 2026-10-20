local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local BidirectionalFlatList = require(Parent.VirtualizedList).BidirectionalFlatList
local PromiseModule = require(Parent.Promise)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationService = ReactFocusNavigationModule.FocusNavigationService
local CoreGui = ReactFocusNavigationModule.EngineInterface.CoreGui
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local CreateScrollIntervalTrackerModule = require(AppChat.Telemetry.createScrollIntervalTracker)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local MessageModelModule = require(AppChat.Models.MessageModel)
local EnumMessageTypesModule = require(AppChat.Components.ChatConversation.EnumMessageTypes)
local MessageModelModule1 = require(AppChat.Models.MessageModel)
local GetLastMessageWithFilterModule = require(script.Parent.Utils.getLastMessageWithFilter)
local ChatMessageModule = require(script.Parent.ChatMessage)
local SystemMessageModule = require(script.Parent.SystemMessage)
local SystemMessageContainerModule = require(script.Parent.SystemMessageContainer)
local CustomMessageEntryContainerModule = require(script.Parent.CustomMessageEntryContainer)
local GetFFlagEnableSocialCardsFunction = require(Parent.SharedFlags).GetFFlagEnableSocialCards
local FIntAppChatMessageInitialFetchMinMessagesModule = require(AppChat.Flags.FIntAppChatMessageInitialFetchMinMessages)
local FIntAppChatInitialMessageFetchLimitModule = require(AppChat.Flags.FIntAppChatInitialMessageFetchLimit)
local AppChatOsaAutoScrollDelayMs = game:DefineFastInt("AppChatOsaAutoScrollDelayMs", 100)
local FFlagAppChatConversationLoadingSkeletonModule = require(AppChat.Flags.FFlagAppChatConversationLoadingSkeleton)
local ConversationMessageSkeletonListModule = if FFlagAppChatConversationLoadingSkeletonModule then require(script.Parent.ConversationMessageSkeletonList) else nil
local FFlagAppChatEnableAutotranslationModule = require(AppChat.Flags.FFlagAppChatEnableAutotranslation)
local FFlagAppChatAutotranslationRespectsExperienceChatSettingModule = require(AppChat.Flags.FFlagAppChatAutotranslationRespectsExperienceChatSetting)
local AppChatPerfChatConversationPaginationWindowSize = game:DefineFastInt("AppChatPerfChatConversationPaginationWindowSize", 2)
local AppChatPerfChatConversationPaginationInitialRender = game:DefineFastInt("AppChatPerfChatConversationPaginationInitialRender", 10)
local AppChatPerfChatConversationPaginationOnStartReached = game:DefineFastInt("AppChatPerfChatConversationPaginationOnStartReached", 64)
local AppChatPerfChatConversationPaginationOnEndReached = game:DefineFastInt("AppChatPerfChatConversationPaginationOnEndReached", 100)

local function isIncomingChatMessage(p1): boolean
	-- upvalues: EnumMessageTypesModule (copy)
	return p1.isIncoming and (p1.messageType == EnumMessageTypesModule.PlainText or p1.messageType == EnumMessageTypesModule.Link)
end

local MessageList = RoactModule.PureComponent:extend("MessageList")
MessageList.defaultProps = {
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

local function compareItemData(p1, p2): boolean
	return p1 ~= nil and p2 ~= nil and (if p1.stable_key == nil then p1.messageId ~= nil and p1.messageId == p2.messageId else p1.stable_key == p2.stable_key or p1.messageId ~= nil and p1.messageId == p2.messageId)
end

function MessageList.init(p1)
	-- upvalues: FFlagAppChatPerfTrackingModule (copy), MessageModelModule (copy), EnumMessageTypesModule (copy), RoactModule (copy), FFlagAppChatAutotranslationRespectsExperienceChatSettingModule (copy), GetLastMessageWithFilterModule (copy), isIncomingChatMessage (copy), CustomMessageEntryContainerModule (copy), SystemMessageContainerModule (copy), GetFFlagEnableSocialCardsFunction (copy), FFlagAppChatEnableAutotranslationModule (copy), ChatMessageModule (copy), MessageModelModule1 (copy), SystemMessageModule (copy), CreateScrollIntervalTrackerModule (copy), AppChatPerfTrackerModule (copy), FocusNavigationService (copy), CoreGui (copy)
	p1.state = {
		width = 0,
		startIndex = 1,
		firstItem = p1.props.itemList[1]
	}
	p1.focusIndex = p1.props.initialFocusIndex
	
	if FFlagAppChatPerfTrackingModule then
		p1._scrollIntervalTracker = nil
	end
	function p1.isValidMessageAndSenderType(MessageType, SenderType): boolean
		-- upvalues: MessageModelModule (upval), EnumMessageTypesModule (upval)
		return if SenderType == MessageModelModule.SenderTypes.System then MessageType == EnumMessageTypesModule.System elseif SenderType == MessageModelModule.SenderTypes.User then MessageType == EnumMessageTypesModule.PlainText or MessageType == EnumMessageTypesModule.Link else MessageType == EnumMessageTypesModule.Custom
	end
	
	p1.ref = p1.props.messageListRef or RoactModule.createRef()
	local ChatTranslationEnabled = if FFlagAppChatAutotranslationRespectsExperienceChatSettingModule then game:GetService("TextChatService").ChatTranslationEnabled else false
	p1.lastIncomingChatMessageId = nil
	
	if p1.props.itemList then
		p1.lastIncomingChatMessageId = GetLastMessageWithFilterModule(p1.props.itemList, isIncomingChatMessage)
	end
	function p1.renderItem(p2)
		-- upvalues: p1 (copy), RoactModule (upval), EnumMessageTypesModule (upval), CustomMessageEntryContainerModule (upval), SystemMessageContainerModule (upval), GetFFlagEnableSocialCardsFunction (upval), FFlagAppChatEnableAutotranslationModule (upval), FFlagAppChatAutotranslationRespectsExperienceChatSettingModule (upval), ChatTranslationEnabled (copy), ChatMessageModule (upval), MessageModelModule1 (upval), SystemMessageModule (upval)
		if not p1.isValidMessageAndSenderType(p2.messageType, p2.senderType) then
			return RoactModule.createElement(SystemMessageModule, { Text = p1.props.invalidMessageTypeText })
		end
		local StringValue = p1.props.isDebugEnabled and RoactModule.createElement("StringValue", { Value = tostring(p2.messageId) })
		
		if p2.messageType == EnumMessageTypesModule.Custom then
			return RoactModule.createElement(CustomMessageEntryContainerModule, {
				openViewProfile = p1.props.openViewProfile,
				customEntryType = p2.customEntryType,
				conversationId = p1.props.conversationId
			})
		end
		if p2.messageType == EnumMessageTypesModule.System then
			return RoactModule.createElement(SystemMessageContainerModule, {
				cards = if GetFFlagEnableSocialCardsFunction() then p2.cards else nil,
				text = p2.content,
				parentWidth = p1.state.width,
				sent = p2.sent,
				showDateTime = p2.showDateTime,
				messageId = p2.messageId,
				senderTargetId = if GetFFlagEnableSocialCardsFunction() then p2.senderTargetId else nil,
				debugElement = StringValue
			})
		end
		local AdditionalProps = p2.additionalProps
		
		if AdditionalProps then
			AdditionalProps.onDetailsOpened = p1.props.onDetailsOpened
		end
		if not AdditionalProps then
			AdditionalProps = {}
		end
		AdditionalProps.openGameDetailsPage = p1.props.openGameDetailsPage
		AdditionalProps.openMomentsDeepLink = p1.props.openMomentsDeepLink
		AdditionalProps.shareLink = p2.shareLink
		
		return RoactModule.createElement(ChatMessageModule, {
			additionalProps = AdditionalProps,
			content = p2.content,
			debugElement = StringValue,
			failed = p2.failed,
			filteredForReceivers = p2.filteredForReceivers,
			isIncoming = p2.isIncoming,
			isNewSender = p2.isNewSender,
			isSending = p2.isSending,
			isUnfiltered = p2.moderationType == MessageModelModule1.ModerationTypes.TrustedComms,
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
			translatedText = if FFlagAppChatEnableAutotranslationModule then if FFlagAppChatAutotranslationRespectsExperienceChatSettingModule then if ChatTranslationEnabled then p2.contentToDisplay else nil else p2.contentToDisplay else nil
		})
	end
	
	function p1.updateWidth(Frame: Frame)
		-- upvalues: p1 (copy)
		if Frame.AbsoluteSize.X ~= p1.state.width then
			p1:setState({ width = Frame.AbsoluteSize.X })
		end
	end
	
	function p1.changeFocus(p2)
		-- upvalues: p1 (copy)
		p1.isNearBottom = p2.anchorIndex <= p1.props.autoScrollMaxIndex + 1
		p1.focusIndex = if p1.isNearBottom then 1 else p2.anchorIndex + 1
		
		if p2.anchorIndex == 1 and not p1.props.itemList[1].read then
			p1.props.markAsRead()
		end
	end
	
	function p1.identifier(p2): string
		return p2.messageId .. "|" .. (p2.position or "")
	end
	
	function p1.getScrollRef()
		-- upvalues: p1 (copy)
		if p1.ref.current == nil then
			return nil
		else
			local NativeScrollRef = p1.ref.current._listRef._scrollRef.getNativeScrollRef()
			
			return if NativeScrollRef == nil then nil else NativeScrollRef._nativeRef.current
		end
	end
	
	function p1.calculateScrollOffset(ScrollFrame)
		return ScrollFrame.AbsoluteCanvasSize.Y - ScrollFrame.CanvasPosition.Y - ScrollFrame.AbsoluteWindowSize.Y
	end
	
	function p1.onScroll(ScrollFrame)
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), p1 (copy), CreateScrollIntervalTrackerModule (upval), AppChatPerfTrackerModule (upval)
		if FFlagAppChatPerfTrackingModule then
			if p1._scrollIntervalTracker == nil then
				local ScrollRef = p1.getScrollRef()
				
				if ScrollRef ~= nil then
					p1._scrollIntervalTracker = CreateScrollIntervalTrackerModule(AppChatPerfTrackerModule.Events.ScrollMessageList, ScrollRef, { conversationId = p1.props.conversationId })
				end
			end
			if p1._scrollIntervalTracker then
				p1._scrollIntervalTracker.onScrollTick()
			end
		end
		local ScrollOffset: number = p1.calculateScrollOffset(ScrollFrame)
		
		if ScrollOffset < 512 then
			p1:setState(function(_, p2)
				return { firstItem = p2.itemList[1] }
			end)
		end
		if ScrollOffset < 64 then
			p1.props.markAsRead()
		end
		p1.isNearBottom = ScrollOffset < 64
	end
	
	p1.initialFetchesAttempted = 0
	p1.focusNavigationService = FocusNavigationService.new(CoreGui)
end

function MessageList.getDerivedStateFromProps(p1, p2)
	if p2.firstItem == nil then
		return { startIndex = 1 }
	end
	local StartIndex = 1
	while StartIndex <= #p1.itemList do
		local Item = p1.itemList[StartIndex]
		local FirstItem = p2.firstItem
		
		if Item ~= nil and FirstItem ~= nil and (if Item.stable_key == nil then Item.messageId ~= nil and Item.messageId == FirstItem.messageId else Item.stable_key == FirstItem.stable_key or Item.messageId ~= nil and Item.messageId == FirstItem.messageId) then break end
		StartIndex += 1
	end
	return if #p1.itemList < StartIndex then { startIndex = 1 } else { startIndex = StartIndex }
end

function MessageList.didUpdate(p3, DefaultProps, _)
	-- upvalues: FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), FIntAppChatInitialMessageFetchLimitModule (copy), FIntAppChatMessageInitialFetchMinMessagesModule (copy), AppChatOsaAutoScrollDelayMs (copy), GetLastMessageWithFilterModule (copy), isIncomingChatMessage (copy)
	if FFlagAppChatPerfTrackingModule and #DefaultProps.itemList < #p3.props.itemList then
		AppChatPerfTrackerModule.finish(AppChatPerfTrackerModule.Events.PaginationMessageList, { conversationId = p3.props.conversationId })
	end
	if p3.props.itemList and #p3.props.itemList == 0 and DefaultProps.itemList and #DefaultProps.itemList > 0 then
		p3.initialFetchesAttempted = 0
	end
	if p3.props.itemList and p3.props.itemList ~= DefaultProps.itemList and p3.initialFetchesAttempted < FIntAppChatInitialMessageFetchLimitModule and #p3.props.itemList < FIntAppChatMessageInitialFetchMinMessagesModule and p3.props.loadNext then
		p3.initialFetchesAttempted += 1
		p3.props.loadNext()
	end
	if DefaultProps.conversationId ~= p3.props.conversationId then
		p3.isNearBottom = true
	end
	local ScrollRef = p3.getScrollRef()
	
	if (if ScrollRef == nil then 0 else p3.calculateScrollOffset(ScrollRef)) < 64 then
		p3.isNearBottom = true
		
		if #p3.props.itemList > 0 then
			p3.props.markAsRead()
		end
	end
	if DefaultProps.readingMessagesIsEnabled ~= p3.props.readingMessagesIsEnabled and p3.props.readingMessagesIsEnabled and p3.isNearBottom then
		p3.props.markAsRead()
	end
	if p3.props.scrollToTopOnInitialOsaLoad and not DefaultProps.scrollToTopOnInitialOsaLoad and #p3.props.itemList > 0 then
		local Current = p3.ref and p3.ref.current
		
		if Current and Current.scrollToEnd then
			task.delay(AppChatOsaAutoScrollDelayMs / 1000, function()
				-- upvalues: Current (copy), p3 (copy)
				Current:scrollToIndex({ animated = false, index = #p3.props.itemList })
			end)
		end
	end
	if p3.props.itemList and not p3.lastIncomingChatMessageId then
		p3.lastIncomingChatMessageId = GetLastMessageWithFilterModule(p3.props.itemList, isIncomingChatMessage)
	end
end

function MessageList.didMount(p3)
	-- upvalues: FIntAppChatMessageInitialFetchMinMessagesModule (copy)
	if #p3.props.itemList < FIntAppChatMessageInitialFetchMinMessagesModule and p3.props.loadNext then
		p3.props.loadNext()
	end
	p3.isNearBottom = true
	local ScrollRef = p3.getScrollRef()
	
	if ScrollRef ~= nil then
		ScrollRef.Selectable = false
	end
end

function MessageList.willUnmount(p3)
	-- upvalues: FFlagAppChatPerfTrackingModule (copy)
	if FFlagAppChatPerfTrackingModule and p3._scrollIntervalTracker then
		p3._scrollIntervalTracker.cleanup()
	end
	p3.focusNavigationService:teardown()
end

function MessageList.renderScrollingFrame(p3)
	-- upvalues: RoactModule (copy), BidirectionalFlatList (copy), AppChatPerfChatConversationPaginationWindowSize (copy), AppChatPerfChatConversationPaginationInitialRender (copy), FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), PromiseModule (copy), AppChatPerfChatConversationPaginationOnEndReached (copy), AppChatPerfChatConversationPaginationOnStartReached (copy), compareItemData (copy)
	local ItemList = {}
	local StartIndex = p3.state.startIndex
	
	if StartIndex ~= 1 then
		local ScrollRef = p3.getScrollRef()
		
		if (if ScrollRef == nil then 0 else p3.calculateScrollOffset(ScrollRef)) < 128 then
			StartIndex = 1
		end
	end
	repeat
		if StartIndex ~= 1 then
			local Item = p3.props.itemList[1]
			local FirstItem = p3.state.firstItem
			
			if Item == nil or FirstItem == nil or not (if Item.stable_key == nil then Item.messageId ~= nil and Item.messageId == FirstItem.messageId else Item.stable_key == FirstItem.stable_key or Item.messageId ~= nil and Item.messageId == FirstItem.messageId) then
				table.move(p3.props.itemList, StartIndex, #p3.props.itemList, 1, ItemList)
				continue
			end
		end
		ItemList = p3.props.itemList
		break
	until true
	return RoactModule.createElement(BidirectionalFlatList, {
		data = ItemList,
		renderItem = function(p4)
			-- upvalues: p3 (copy)
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
		windowSize = AppChatPerfChatConversationPaginationWindowSize,
		initialNumToRender = if p3.props.scrollToTopOnInitialOsaLoad then #ItemList else AppChatPerfChatConversationPaginationInitialRender,
		onScroll = p3.onScroll,
		onEndReached = function()
			-- upvalues: FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), p3 (copy), PromiseModule (upval)
			if FFlagAppChatPerfTrackingModule then
				AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.PaginationMessageList, { conversationId = p3.props.conversationId })
			end
			p3.props.loadNext()
			
			return PromiseModule.resolve()
		end,
		onEndReachedThreshold = AppChatPerfChatConversationPaginationOnEndReached,
		onStartReachedThreshold = AppChatPerfChatConversationPaginationOnStartReached,
		compareItemData = compareItemData,
		scrollEventThrottle = p3.props.scrollEventThrottle or 75,
		[RoactModule.Ref] = p3.ref,
		autoscrollToTopThreshold = 33,
		enableAutoscrollToTop = true,
		ListHeaderComponent = function()
			-- upvalues: RoactModule (upval)
			return RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 10)
			})
		end,
		showDefaultLoadingIndicators = false,
		onContentSizeChange = function(Width, _)
			-- upvalues: p3 (copy)
			p3:setState({ width = Width })
		end,
		optimizeInvertedCanvasResize = true,
		UNSTABLE_forceSiblingLayoutUpdate = true
	})
end

function MessageList.renderEmptyMessageList(p3)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = p3.props.Size })
end

function MessageList.render(p3)
	-- upvalues: FFlagAppChatConversationLoadingSkeletonModule (copy), RoactModule (copy), ConversationMessageSkeletonListModule (copy)
	return if FFlagAppChatConversationLoadingSkeletonModule and p3.props.isInitialMessageLoading then RoactModule.createElement(ConversationMessageSkeletonListModule, { size = p3.props.Size }) elseif #p3.props.itemList == 0 then p3:renderEmptyMessageList() else p3:renderScrollingFrame()
end

return MessageList