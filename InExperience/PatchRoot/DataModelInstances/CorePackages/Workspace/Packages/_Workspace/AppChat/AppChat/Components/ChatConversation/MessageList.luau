local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local BidirectionalFlatList = require(Parent.VirtualizedList).BidirectionalFlatList
local PromiseModule = require(Parent.Promise)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationService = ReactFocusNavigationModule.FocusNavigationService
local CoreGui = ReactFocusNavigationModule.EngineInterface.CoreGui
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatScrollToLatestModule = require(AppChat.Flags.FFlagAppChatScrollToLatest)
local CreateScrollIntervalTrackerModule = require(AppChat.Telemetry.createScrollIntervalTracker)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local MessageModelModule = require(AppChat.Models.MessageModel)
local EnumMessageTypesModule = require(AppChat.Components.ChatConversation.EnumMessageTypes)
local MessageModelModule1 = require(AppChat.Models.MessageModel)
local GetLastMessageWithFilterModule = require(script.Parent.Utils.getLastMessageWithFilter)
local IsScrolledAwayFromLatestModule = require(script.Parent.ScrollToLatest.isScrolledAwayFromLatest)
local ChatMessageModule = require(script.Parent.ChatMessage)
local SystemMessageModule = require(script.Parent.SystemMessage)
local SystemMessageContainerModule = require(script.Parent.SystemMessageContainer)
local CustomMessageEntryContainerModule = require(script.Parent.CustomMessageEntryContainer)
local GetFFlagEnableSocialCardsFunction = require(Parent.SharedFlags).GetFFlagEnableSocialCards
local FIntAppChatMessageInitialFetchMinMessagesModule = require(AppChat.Flags.FIntAppChatMessageInitialFetchMinMessages)
local FIntAppChatInitialMessageFetchLimitModule = require(AppChat.Flags.FIntAppChatInitialMessageFetchLimit)
local FFlagAppChatGuardOsaScrollToIndexModule = require(AppChat.Flags.FFlagAppChatGuardOsaScrollToIndex)
local FIntAppChatOsaAutoScrollDelayMsModule = require(AppChat.Flags.FIntAppChatOsaAutoScrollDelayMs)
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
	-- upvalues: FFlagAppChatPerfTrackingModule (copy), MessageModelModule (copy), EnumMessageTypesModule (copy), RoactModule (copy), FFlagAppChatAutotranslationRespectsExperienceChatSettingModule (copy), GetLastMessageWithFilterModule (copy), isIncomingChatMessage (copy), CustomMessageEntryContainerModule (copy), SystemMessageContainerModule (copy), GetFFlagEnableSocialCardsFunction (copy), FFlagAppChatEnableAutotranslationModule (copy), ChatMessageModule (copy), MessageModelModule1 (copy), SystemMessageModule (copy), IsScrolledAwayFromLatestModule (copy), CreateScrollIntervalTrackerModule (copy), AppChatPerfTrackerModule (copy), FFlagAppChatScrollToLatestModule (copy), FocusNavigationService (copy), CoreGui (copy)
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
	
	p1.wasScrolledAwayFromLatest = false
	
	function p1.setScrolledAwayFromLatest(WasScrolledAwayFromLatest)
		-- upvalues: p1 (copy)
		local OnScrolledAwayFromLatestChangedFunction: (any) -> () = p1.props.onScrolledAwayFromLatestChanged
		
		if OnScrolledAwayFromLatestChangedFunction ~= nil and WasScrolledAwayFromLatest ~= p1.wasScrolledAwayFromLatest then
			p1.wasScrolledAwayFromLatest = WasScrolledAwayFromLatest
			OnScrolledAwayFromLatestChangedFunction(WasScrolledAwayFromLatest)
		end
	end
	
	function p1.reportScrolledAwayFromLatest(ScrollFrame)
		-- upvalues: p1 (copy), IsScrolledAwayFromLatestModule (upval)
		p1.setScrolledAwayFromLatest(IsScrolledAwayFromLatestModule(p1.calculateScrollOffset(ScrollFrame), ScrollFrame.AbsoluteWindowSize.Y))
	end
	
	p1.scrolledAwayConnections = nil
	
	function p1.disconnectScrolledAwayListener()
		-- upvalues: p1 (copy)
		if p1.scrolledAwayConnections == nil then return end
		for _, scrolledAwayConnection in p1.scrolledAwayConnections do
			scrolledAwayConnection:Disconnect()
		end
		p1.scrolledAwayConnections = nil
	end
	
	function p1.connectScrolledAwayListener()
		-- upvalues: p1 (copy)
		if p1.props.onScrolledAwayFromLatestChanged == nil then return end
		local ScrollRef = p1.getScrollRef()
		
		if ScrollRef == nil then
			p1.disconnectScrolledAwayListener()
			p1.setScrolledAwayFromLatest(false)
			
			return
		end
		if p1.scrolledAwayConnections ~= nil then return end
		local ScrolledAwayConnections = {}
		p1.scrolledAwayConnections = ScrolledAwayConnections
		local Flag = false
		
		local function report()
			-- upvalues: Flag (ref), p1 (upval), ScrolledAwayConnections (copy), ScrollRef (copy)
			if not Flag then
				Flag = true
				task.defer(function()
					-- upvalues: Flag (upval), p1 (upval), ScrolledAwayConnections (upval), ScrollRef (upval)
					Flag = false
					
					if p1.scrolledAwayConnections == ScrolledAwayConnections then
						p1.reportScrolledAwayFromLatest(ScrollRef)
					end
				end)
				
				return
			end
		end
		
		for _, PropertyName in {
			"CanvasPosition",
			"AbsoluteCanvasSize",
			"AbsoluteWindowSize"
		} do
			table.insert(ScrolledAwayConnections, ScrollRef:GetPropertyChangedSignal(PropertyName):Connect(report))
		end
		if not Flag then
			Flag = true
			task.defer(function()
				-- upvalues: Flag (ref), p1 (upval), ScrolledAwayConnections (copy), ScrollRef (copy)
				Flag = false
				
				if p1.scrolledAwayConnections == ScrolledAwayConnections then
					p1.reportScrolledAwayFromLatest(ScrollRef)
				end
			end)
		end
	end
	
	function p1.scrollToLatest()
		-- upvalues: p1 (copy)
		local ListRef = p1.ref.current and p1.ref.current._listRef
		
		if ListRef then
			ListRef:scrollToOffset({ offset = 0, animated = false })
		end
	end
	
	function p1.onScroll(ScrollFrame)
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), p1 (copy), CreateScrollIntervalTrackerModule (upval), AppChatPerfTrackerModule (upval), FFlagAppChatScrollToLatestModule (upval)
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
		
		if FFlagAppChatScrollToLatestModule then
			p1.connectScrolledAwayListener()
		end
	end
	
	function p1.onScrollToIndexFailed()
		-- upvalues: p1 (copy)
		local Current = p1.ref.current
		
		if Current ~= nil then
			Current:scrollToEnd({ animated = false })
		end
	end
	
	p1.initialFetchesAttempted = 0
	p1.focusNavigationService = FocusNavigationService.new(CoreGui)
end

function MessageList.getDerivedStateFromProps(p2, p3)
	if p3.firstItem == nil then
		return { startIndex = 1 }
	end
	local StartIndex = 1
	while StartIndex <= #p2.itemList do
		local Item = p2.itemList[StartIndex]
		local FirstItem = p3.firstItem
		
		if Item ~= nil and FirstItem ~= nil and (if Item.stable_key == nil then Item.messageId ~= nil and Item.messageId == FirstItem.messageId else Item.stable_key == FirstItem.stable_key or Item.messageId ~= nil and Item.messageId == FirstItem.messageId) then break end
		StartIndex += 1
	end
	return if #p2.itemList < StartIndex then { startIndex = 1 } else { startIndex = StartIndex }
end

function MessageList.didUpdate(p4, DefaultProps, _)
	-- upvalues: FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), FIntAppChatInitialMessageFetchLimitModule (copy), FIntAppChatMessageInitialFetchMinMessagesModule (copy), FIntAppChatOsaAutoScrollDelayMsModule (copy), FFlagAppChatGuardOsaScrollToIndexModule (copy), GetLastMessageWithFilterModule (copy), isIncomingChatMessage (copy), FFlagAppChatScrollToLatestModule (copy)
	if FFlagAppChatPerfTrackingModule and #DefaultProps.itemList < #p4.props.itemList then
		AppChatPerfTrackerModule.finish(AppChatPerfTrackerModule.Events.PaginationMessageList, { conversationId = p4.props.conversationId })
	end
	if p4.props.itemList and #p4.props.itemList == 0 and DefaultProps.itemList and #DefaultProps.itemList > 0 then
		p4.initialFetchesAttempted = 0
	end
	if p4.props.itemList and p4.props.itemList ~= DefaultProps.itemList and p4.initialFetchesAttempted < FIntAppChatInitialMessageFetchLimitModule and #p4.props.itemList < FIntAppChatMessageInitialFetchMinMessagesModule and p4.props.loadNext then
		p4.initialFetchesAttempted += 1
		p4.props.loadNext()
	end
	if DefaultProps.conversationId ~= p4.props.conversationId then
		p4.isNearBottom = true
	end
	local ScrollRef = p4.getScrollRef()
	
	if (if ScrollRef == nil then 0 else p4.calculateScrollOffset(ScrollRef)) < 64 then
		p4.isNearBottom = true
		
		if #p4.props.itemList > 0 then
			p4.props.markAsRead()
		end
	end
	if DefaultProps.readingMessagesIsEnabled ~= p4.props.readingMessagesIsEnabled and p4.props.readingMessagesIsEnabled and p4.isNearBottom then
		p4.props.markAsRead()
	end
	if p4.props.scrollToTopOnInitialOsaLoad and not DefaultProps.scrollToTopOnInitialOsaLoad and #p4.props.itemList > 0 then
		local Current = p4.ref and p4.ref.current
		
		if Current and Current.scrollToEnd then
			task.delay(FIntAppChatOsaAutoScrollDelayMsModule / 1000, function()
				-- upvalues: FFlagAppChatGuardOsaScrollToIndexModule (upval), p4 (copy), Current (copy)
				if not FFlagAppChatGuardOsaScrollToIndexModule then
					Current:scrollToIndex({ animated = false, index = #p4.props.itemList })
					
					return
				end
				local Current1 = p4.ref.current
				local Count = #p4:getRenderedItemList()
				
				if Current1 ~= nil and Count > 0 then
					Current1:scrollToIndex({ animated = false, index = Count })
				end
			end)
		end
	end
	if p4.props.itemList and not p4.lastIncomingChatMessageId then
		p4.lastIncomingChatMessageId = GetLastMessageWithFilterModule(p4.props.itemList, isIncomingChatMessage)
	end
	if FFlagAppChatScrollToLatestModule then
		p4.connectScrolledAwayListener()
	end
end

function MessageList.didMount(p4)
	-- upvalues: FIntAppChatMessageInitialFetchMinMessagesModule (copy), FFlagAppChatScrollToLatestModule (copy)
	if #p4.props.itemList < FIntAppChatMessageInitialFetchMinMessagesModule and p4.props.loadNext then
		p4.props.loadNext()
	end
	p4.isNearBottom = true
	local ScrollRef = p4.getScrollRef()
	
	if ScrollRef ~= nil then
		ScrollRef.Selectable = false
	end
	if FFlagAppChatScrollToLatestModule then
		if p4.props.scrollToLatestRef then
			p4.props.scrollToLatestRef.current = p4.scrollToLatest
		end
		p4.connectScrolledAwayListener()
	end
end

function MessageList.willUnmount(p4)
	-- upvalues: FFlagAppChatPerfTrackingModule (copy), FFlagAppChatScrollToLatestModule (copy)
	if FFlagAppChatPerfTrackingModule and p4._scrollIntervalTracker then
		p4._scrollIntervalTracker.cleanup()
	end
	if FFlagAppChatScrollToLatestModule then
		local ScrollToLatestRef = p4.props.scrollToLatestRef
		
		if ScrollToLatestRef and ScrollToLatestRef.current == p4.scrollToLatest then
			ScrollToLatestRef.current = nil
		end
		p4.disconnectScrolledAwayListener()
	end
	p4.focusNavigationService:teardown()
end

function MessageList.getRenderedItemList(p4)
	local ItemList = {}
	local StartIndex = p4.state.startIndex
	
	if StartIndex ~= 1 then
		local ScrollRef = p4.getScrollRef()
		
		if (if ScrollRef == nil then 0 else p4.calculateScrollOffset(ScrollRef)) < 128 then
			StartIndex = 1
		end
	end
	if StartIndex ~= 1 then
		local Item = p4.props.itemList[1]
		local FirstItem = p4.state.firstItem
		
		if Item == nil or FirstItem == nil or not (if Item.stable_key == nil then Item.messageId ~= nil and Item.messageId == FirstItem.messageId else Item.stable_key == FirstItem.stable_key or Item.messageId ~= nil and Item.messageId == FirstItem.messageId) then
			table.move(p4.props.itemList, StartIndex, #p4.props.itemList, 1, ItemList)
			
			return ItemList
		end
	end
	ItemList = p4.props.itemList
	
	return ItemList
end

function MessageList.renderScrollingFrame(p4)
	-- upvalues: RoactModule (copy), BidirectionalFlatList (copy), AppChatPerfChatConversationPaginationWindowSize (copy), AppChatPerfChatConversationPaginationInitialRender (copy), FFlagAppChatGuardOsaScrollToIndexModule (copy), FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), PromiseModule (copy), AppChatPerfChatConversationPaginationOnEndReached (copy), AppChatPerfChatConversationPaginationOnStartReached (copy), compareItemData (copy)
	local RenderedItemList = p4:getRenderedItemList()
	
	return RoactModule.createElement(BidirectionalFlatList, {
		data = RenderedItemList,
		renderItem = function(p5)
			-- upvalues: p4 (copy)
			return p4.renderItem(p5.item)
		end,
		inverted = true,
		Size = p4.props.Size,
		style = {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			Name = "MessageList"
		},
		contentContainerStyle = { BackgroundTransparency = 1 },
		keyExtractor = function(p5, p6)
			return p5.stable_key or (p5.messageId or p6)
		end,
		windowSize = AppChatPerfChatConversationPaginationWindowSize,
		initialNumToRender = if p4.props.scrollToTopOnInitialOsaLoad then #RenderedItemList else AppChatPerfChatConversationPaginationInitialRender,
		onScroll = p4.onScroll,
		onScrollToIndexFailed = if FFlagAppChatGuardOsaScrollToIndexModule then p4.onScrollToIndexFailed else nil,
		onEndReached = function()
			-- upvalues: FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), p4 (copy), PromiseModule (upval)
			if FFlagAppChatPerfTrackingModule then
				AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.PaginationMessageList, { conversationId = p4.props.conversationId })
			end
			p4.props.loadNext()
			
			return PromiseModule.resolve()
		end,
		onEndReachedThreshold = AppChatPerfChatConversationPaginationOnEndReached,
		onStartReachedThreshold = AppChatPerfChatConversationPaginationOnStartReached,
		compareItemData = compareItemData,
		scrollEventThrottle = p4.props.scrollEventThrottle or 75,
		[RoactModule.Ref] = p4.ref,
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
			-- upvalues: p4 (copy)
			p4:setState({ width = Width })
		end,
		optimizeInvertedCanvasResize = true,
		UNSTABLE_forceSiblingLayoutUpdate = true
	})
end

function MessageList.renderEmptyMessageList(p4)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = p4.props.Size })
end

function MessageList.render(p4)
	-- upvalues: FFlagAppChatConversationLoadingSkeletonModule (copy), RoactModule (copy), ConversationMessageSkeletonListModule (copy)
	return if FFlagAppChatConversationLoadingSkeletonModule and p4.props.isInitialMessageLoading then RoactModule.createElement(ConversationMessageSkeletonListModule, { size = p4.props.Size }) elseif #p4.props.itemList == 0 then p4:renderEmptyMessageList() else p4:renderScrollingFrame()
end

return MessageList