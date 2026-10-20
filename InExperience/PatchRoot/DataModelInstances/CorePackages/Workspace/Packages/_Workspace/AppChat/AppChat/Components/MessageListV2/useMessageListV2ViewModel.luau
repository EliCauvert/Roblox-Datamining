local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local EnumMessageTypesModule = require(AppChat.Components.ChatConversation.EnumMessageTypes)
local GetConversationMessageViewModelStoreModule = require(AppChat.Stores.GetConversationMessageViewModelStore)
local ListItemsModule = require(script.Parent.ListItems)
local _ = require(script.Parent.MessageListContext)
local MessageRowTypesModule = require(script.Parent.MessageRowTypes)
local UseMessageListLayoutModule = require(script.Parent.useMessageListLayout)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local CreateScrollIntervalTrackerModule = require(AppChat.Telemetry.createScrollIntervalTracker)
local FFlagAppChatConversationLoadingSkeletonModule = require(AppChat.Flags.FFlagAppChatConversationLoadingSkeleton)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FIntAppChatInitialMessageFetchLimitModule = require(AppChat.Flags.FIntAppChatInitialMessageFetchLimit)
local FIntAppChatMessageListV2OverscanRowsModule = require(AppChat.Flags.FIntAppChatMessageListV2OverscanRows)
local FIntAppChatMessageInitialFetchMinMessagesModule = require(AppChat.Flags.FIntAppChatMessageInitialFetchMinMessages)
local StartReachedThreshold = {
	viewportFraction = math.max(0, (require(AppChat.Flags.FIntAppChatMessageListV2StartReachedViewports)))
}

local function noop() end

local function _(p1): boolean
	-- upvalues: EnumMessageTypesModule (copy)
	return p1.isIncoming == true and (p1.messageType == EnumMessageTypesModule.PlainText or p1.messageType == EnumMessageTypesModule.Link)
end

local _ = function(p1)
	-- upvalues: EnumMessageTypesModule (copy)
	for i = #p1, 1, -1 do
		local v1 = p1[i]
		
		if v1.isIncoming == true and (v1.messageType == EnumMessageTypesModule.PlainText or v1.messageType == EnumMessageTypesModule.Link) then
			return p1[i].messageId
		end
	end
	return nil
end

return function(Current)
	-- upvalues: ReactModule (copy), ListItemsModule (copy), EnumMessageTypesModule (copy), FFlagAppChatPerfTrackingModule (copy), AppChatPerfTrackerModule (copy), SignalsModule (copy), GetConversationMessageViewModelStoreModule (copy), SignalsReactModule (copy), FIntAppChatMessageInitialFetchMinMessagesModule (copy), FIntAppChatInitialMessageFetchLimitModule (copy), CreateScrollIntervalTrackerModule (copy), ViewRecyclerModule (copy), UseMessageListLayoutModule (copy), StartReachedThreshold (copy), MessageRowTypesModule (copy), FIntAppChatMessageListV2OverscanRowsModule (copy), noop (copy), FFlagAppChatConversationLoadingSkeletonModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local ConversationId = Current.conversationId
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: ListItemsModule (upval), Current (copy), UseRefResult1 (copy)
		return ListItemsModule.build(Current.itemList, UseRefResult1.current)
	end, { Current.itemList })
	UseRefResult1.current = UseMemoResult
	local Items = UseMemoResult.items
	local CountItems = #Items
	local UseRefResult2 = ReactModule.useRef(nil)
	
	if UseRefResult2.current == nil then
		local MessageId = nil
		
		for i = #Items, 1, -1 do
			local Item = Items[i]
			
			if Item.isIncoming ~= true or Item.messageType ~= EnumMessageTypesModule.PlainText and Item.messageType ~= EnumMessageTypesModule.Link then
				continue
			end
			MessageId = Items[i].messageId
			break
		end
		UseRefResult2.current = MessageId
	end
	local Current1 = UseRefResult2.current
	local UseRefResult3 = ReactModule.useRef(CountItems)
	ReactModule.useEffect(function()
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), CountItems (copy), UseRefResult3 (copy), AppChatPerfTrackerModule (upval), ConversationId (copy)
		if FFlagAppChatPerfTrackingModule and UseRefResult3.current < CountItems then
			AppChatPerfTrackerModule.finish(AppChatPerfTrackerModule.Events.PaginationMessageList, { conversationId = ConversationId })
		end
		UseRefResult3.current = CountItems
	end, { CountItems, ConversationId })
	local UseRefResult4 = ReactModule.useRef(0)
	local Item = Items[CountItems]
	local Key = if Item == nil then nil else ListItemsModule.getKey(Item)
	local UseRefResult5 = ReactModule.useRef(Key)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult5 (copy), Key (copy), UseRefResult4 (copy), UseRefResult (copy)
		local Current = UseRefResult5.current
		UseRefResult5.current = Key
		
		if Current ~= nil and Key ~= nil and Key ~= Current and UseRefResult4.current < 64 then
			UseRefResult.current.markAsRead()
		end
	end, { Key })
	local UseRefResult6 = ReactModule.useRef(nil)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetConversationMessageViewModelStoreModule (upval), ConversationId (copy)
		return SignalsModule.createComputed(function(p2): boolean
			-- upvalues: GetConversationMessageViewModelStoreModule (upval), ConversationId (upval)
			local Metadata = GetConversationMessageViewModelStoreModule(false).conversationMessageListStore.getMetadata(ConversationId, p2)
			
			return Metadata ~= nil and Metadata.isLoading == true
		end)
	end, { ConversationId })))
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseRefResult6 (copy)
		if not UseSignalStateResult then
			UseRefResult6.current = nil
		end
	end, { UseSignalStateResult })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), ListItemsModule (upval), UseRefResult6 (copy), FFlagAppChatPerfTrackingModule (upval), AppChatPerfTrackerModule (upval), ConversationId (copy)
		local LoadNextFunction: () -> () = UseRefResult.current.loadNext
		
		if LoadNextFunction == nil then return end
		local Items = UseRefResult1.current.items
		local Item = Items[1]
		local Text: string = `{#Items}:{if Item == nil then "" else ListItemsModule.getKey(Item)}`
		
		if UseRefResult6.current == Text then return end
		UseRefResult6.current = Text
		
		if FFlagAppChatPerfTrackingModule then
			AppChatPerfTrackerModule.start(AppChatPerfTrackerModule.Events.PaginationMessageList, { conversationId = ConversationId })
		end
		LoadNextFunction()
	end, { ConversationId })
	local IsOpenAtStart = Current.openAtStart == true
	local UseSignalStateResult1 = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetConversationMessageViewModelStoreModule (upval), ConversationId (copy), IsOpenAtStart (copy), FIntAppChatMessageInitialFetchMinMessagesModule (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: GetConversationMessageViewModelStoreModule (upval), ConversationId (upval), IsOpenAtStart (upval), FIntAppChatMessageInitialFetchMinMessagesModule (upval)
			local ConversationMessageListStore = GetConversationMessageViewModelStoreModule(false).conversationMessageListStore
			local Metadata = ConversationMessageListStore.getMetadata(ConversationId, p2)
			
			if Metadata == nil or Metadata.fetchedOldest ~= true then
				local Count = #ConversationMessageListStore.getOrderedIds(ConversationId, p2)
				
				return if IsOpenAtStart or FIntAppChatMessageInitialFetchMinMessagesModule > Count then Count else nil
			else
				return nil
			end
		end)
	end, { ConversationId, IsOpenAtStart })))
	local HasLoadNext = Current.loadNext ~= nil
	local HasUseSignalStateResult: boolean = HasLoadNext and UseSignalStateResult1 ~= nil
	local UseRefResult7 = ReactModule.useRef(0)
	local UseRefResult8 = ReactModule.useRef(nil)
	local UseRefResult9 = ReactModule.useRef(false)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: HasUseSignalStateResult (copy), IsOpenAtStart (copy), UseRefResult7 (copy), FIntAppChatInitialMessageFetchLimitModule (upval), UseRefResult8 (copy), UseSignalStateResult1 (copy), UseRefResult9 (copy), UseResult (copy), GetConversationMessageViewModelStoreModule (upval), ConversationId (copy), UseStateResult2 (copy)
		if HasUseSignalStateResult and not IsOpenAtStart and UseRefResult7.current < FIntAppChatInitialMessageFetchLimitModule then
			UseRefResult7.current += 1
			UseRefResult8.current = UseSignalStateResult1
			UseRefResult9.current = false
			UseResult()
			local Metadata = GetConversationMessageViewModelStoreModule(false).conversationMessageListStore.getMetadata(ConversationId)
			
			if Metadata == nil or Metadata.isLoading ~= true then
				UseStateResult2(true)
			end
		end
	end, {
		ConversationId,
		UseSignalStateResult1,
		HasUseSignalStateResult,
		IsOpenAtStart,
		UseResult
	})
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), UseRefResult9 (copy), UseSignalStateResult1 (copy), UseRefResult8 (copy), UseRefResult7 (copy), FIntAppChatInitialMessageFetchLimitModule (upval), UseStateResult2 (copy)
		if UseSignalStateResult then
			UseRefResult9.current = true
			
			return
		end
		if UseRefResult9.current and (UseSignalStateResult1 == UseRefResult8.current or FIntAppChatInitialMessageFetchLimitModule <= UseRefResult7.current) then
			UseStateResult2(true)
		end
	end, { UseSignalStateResult, UseSignalStateResult1 })
	local UseRefResult10 = ReactModule.useRef(nil)
	local UseRefResult11 = ReactModule.useRef(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	ReactModule.useEffect(function()
		-- upvalues: FFlagAppChatPerfTrackingModule (upval), UseStateResult1 (copy), CreateScrollIntervalTrackerModule (upval), AppChatPerfTrackerModule (upval), ConversationId (copy), UseRefResult11 (copy)
		if FFlagAppChatPerfTrackingModule and UseStateResult1 ~= nil then
			local ScrollIntervalTrackerModule = CreateScrollIntervalTrackerModule(AppChatPerfTrackerModule.Events.ScrollMessageList, UseStateResult1, { conversationId = ConversationId })
			UseRefResult11.current = ScrollIntervalTrackerModule
			
			return function()
				-- upvalues: ScrollIntervalTrackerModule (copy), UseRefResult11 (upval)
				ScrollIntervalTrackerModule.cleanup()
				UseRefResult11.current = nil
			end
		else
			return nil
		end
	end, { UseStateResult1, ConversationId })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult11 (copy), UseRefResult10 (copy), UseRefResult4 (copy), UseRefResult1 (copy), UseRefResult (copy)
		if UseRefResult11.current ~= nil then
			UseRefResult11.current.onScrollTick()
		end
		local Current = UseRefResult10.current
		
		if Current == nil then return end
		local DistanceFromEnd: number = Current.getScrollState().distanceFromEnd
		UseRefResult4.current = DistanceFromEnd
		
		if DistanceFromEnd < 64 and #UseRefResult1.current.items > 0 then
			UseRefResult.current.markAsRead()
		end
	end, {})
	local ReadingMessagesIsEnabled = Current.readingMessagesIsEnabled
	local UseRefResult12 = ReactModule.useRef(ReadingMessagesIsEnabled)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult12 (copy), ReadingMessagesIsEnabled (copy), UseRefResult4 (copy), UseRefResult (copy)
		local Current = UseRefResult12.current
		UseRefResult12.current = ReadingMessagesIsEnabled
		
		if ReadingMessagesIsEnabled and not Current and UseRefResult4.current < 64 then
			UseRefResult.current.markAsRead()
		end
	end, { ReadingMessagesIsEnabled })
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local UseResult2 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(p2.X)
	end, {})
	local UseResult3 = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_1 (copy)
		if p2 ~= nil then
			p2.Selectable = false
		end
		UseStateResult2_1(p2)
	end, {})
	local IsIsInitialMessageLoading: boolean = Current.isInitialMessageLoading == true or HasUseSignalStateResult and (IsOpenAtStart or not UseStateResult)
	local UseRefResult13 = ReactModule.useRef(nil)
	
	if UseRefResult13.current == nil and not IsIsInitialMessageLoading then
		UseRefResult13.current = if IsOpenAtStart then ViewRecyclerModule.ScrollAlignment.Start else ViewRecyclerModule.ScrollAlignment.End
	end
	local Current2 = UseRefResult13.current
	local UseRefResult14 = ReactModule.useRef(UseMemoResult.byKey)
	local UseRefResult15 = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult14 (copy), UseMemoResult (copy), UseRefResult15 (copy), IsIsInitialMessageLoading (copy), UseRefResult10 (copy), ListItemsModule (upval)
		local Current = UseRefResult14.current
		UseRefResult14.current = UseMemoResult.byKey
		local Current1 = UseRefResult15.current
		UseRefResult15.current = not IsIsInitialMessageLoading
		local Item = UseMemoResult.items[#UseMemoResult.items]
		local Current2 = UseRefResult10.current
		
		if Current1 and Current2 ~= nil and Item ~= nil and Item.isIncoming ~= true and Current[ListItemsModule.getKey(Item)] == nil then
			Current2.scrollToEnd()
		end
	end, { UseMemoResult, IsIsInitialMessageLoading })
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseMessageListLayoutModuleResult = UseMessageListLayoutModule((ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(true)
	end, {})))
	local UseRefResult16 = ReactModule.useRef(false)
	local Current3 = UseRefResult16.current or (UseStateResult4 or CountItems == 0)
	
	if not IsIsInitialMessageLoading then
		UseRefResult16.current = Current3
	end
	return {
		contextValue = ReactModule.useMemo(function()
			-- upvalues: ConversationId (copy), UseStateResult3 (copy), Current (copy), Current1 (copy), noop (upval)
			return {
				conversationId = ConversationId,
				width = UseStateResult3,
				wideMode = Current.wideMode == true,
				isDebugEnabled = Current.isDebugEnabled == true,
				lastIncomingChatMessageId = Current1,
				viewProfileOnAvatarPressed = Current.viewProfileOnAvatarPressed ~= false,
				inputBoxRef = Current.inputBoxRef,
				closeKeyboard = Current.closeKeyboard or noop,
				onDetailsOpened = Current.onDetailsOpened or noop,
				openGameDetailsPage = Current.openGameDetailsPage or noop,
				openMomentsDeepLink = Current.openMomentsDeepLink,
				openViewProfile = Current.openViewProfile or noop,
				invalidMessageTypeText = Current.invalidMessageTypeText,
				messageDefaultNoticeText = Current.messageDefaultNoticeText,
				messageModeratedNoticeText = Current.messageModeratedNoticeText,
				messageHiddenNoticeText = Current.messageHiddenNoticeText,
				unknownUserText = Current.unknownUserText
			}
		end, {
			ConversationId, UseStateResult3, Current1, Current.wideMode,
			Current.isDebugEnabled, Current.viewProfileOnAvatarPressed,
			Current.inputBoxRef, Current.closeKeyboard, Current.onDetailsOpened,
			Current.openGameDetailsPage, Current.openMomentsDeepLink,
			Current.openViewProfile, Current.invalidMessageTypeText,
			Current.messageDefaultNoticeText, Current.messageModeratedNoticeText,
			Current.messageHiddenNoticeText, Current.unknownUserText
		}),
		listProps = ReactModule.useMemo(function()
			-- upvalues: ViewRecyclerModule (upval), StartReachedThreshold (upval), Current2 (copy), Items (copy), ListItemsModule (upval), UseMessageListLayoutModuleResult (copy), MessageRowTypesModule (upval), UseRefResult10 (copy), FIntAppChatMessageListV2OverscanRowsModule (upval), HasLoadNext (copy), UseResult (copy), UseResult1 (copy), UseResult2 (copy), UseResult3 (copy), Current3 (copy)
			local Copy = table.clone(ViewRecyclerModule.ChatPreset.create({ startReachedThreshold = StartReachedThreshold }))
			Copy.initialScrollAlignment = Current2 or Copy.initialScrollAlignment
			Copy.data = { items = Items, getItemKey = ListItemsModule.getKey }
			Copy.layout = UseMessageListLayoutModuleResult
			Copy.axis = ViewRecyclerModule.Axis.Y
			Copy.itemType = MessageRowTypesModule.MessageRowType
			Copy.pinnedEndItem = MessageRowTypesModule.EndSpacerItem
			Copy.listRef = UseRefResult10
			Copy.overscan = FIntAppChatMessageListV2OverscanRowsModule
			Copy.onStartReached = if HasLoadNext then UseResult else nil
			Copy.onScrollOffsetChanged = UseResult1
			Copy.onViewportChanged = UseResult2
			Copy.scrollingFrameRef = UseResult3
			Copy.scrollingFrameProps = {
				Name = "MessageList",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 0,
				Visible = Current3
			}
			
			return Copy
		end, {
			UseResult3, HasLoadNext, Current2, Current3, Items,
			UseMessageListLayoutModuleResult, UseResult1, UseResult2, UseResult
		}),
		isLoading = IsIsInitialMessageLoading,
		isListVisible = Current3,
		showLoadingSkeleton = FFlagAppChatConversationLoadingSkeletonModule
	}
end