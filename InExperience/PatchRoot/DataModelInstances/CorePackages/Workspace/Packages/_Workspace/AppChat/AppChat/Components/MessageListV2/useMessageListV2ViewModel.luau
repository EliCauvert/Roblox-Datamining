local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local viewRecyclerModule = require(parent.ViewRecycler)
local enumMessageTypesModule = require(appChat.Components.ChatConversation.EnumMessageTypes)
local getConversationMessageViewModelStoreModule = require(appChat.Stores.GetConversationMessageViewModelStore)
local listItemsModule = require(script.Parent.ListItems)
local _ = require(script.Parent.MessageListContext)
local messageRowTypesModule = require(script.Parent.MessageRowTypes)
local useMessageListLayoutModule = require(script.Parent.useMessageListLayout)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local createScrollIntervalTrackerModule = require(appChat.Telemetry.createScrollIntervalTracker)
local fFlagAppChatConversationLoadingSkeletonModule = require(appChat.Flags.FFlagAppChatConversationLoadingSkeleton)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fIntAppChatInitialMessageFetchLimitModule = require(appChat.Flags.FIntAppChatInitialMessageFetchLimit)
local fIntAppChatMessageListV2OverscanRowsModule = require(appChat.Flags.FIntAppChatMessageListV2OverscanRows)
local fIntAppChatMessageInitialFetchMinMessagesModule = require(appChat.Flags.FIntAppChatMessageInitialFetchMinMessages)
local t = {
	viewportFraction = math.max(0, require(appChat.Flags.FIntAppChatMessageListV2StartReachedViewports))
}

local function noop() end

local function _(a)
	-- upvalues: enumMessageTypesModule (ref)
	return a.isIncoming == true and (if a.messageType ~= enumMessageTypesModule.PlainText then a.messageType == enumMessageTypesModule.Link else true)
end

local _ = function(a)
	-- upvalues: enumMessageTypesModule (ref)
	for i = #a, 1, -1 do
		local var1 = a[i]
		
		if not (var1.isIncoming == true and (if var1.messageType ~= enumMessageTypesModule.PlainText then var1.messageType == enumMessageTypesModule.Link else true)) then
			continue
		end
		return a[i].messageId
	end
	return nil
end

return function(p1)
	-- upvalues: reactModule (ref), listItemsModule (ref), enumMessageTypesModule (ref), fFlagAppChatPerfTrackingModule (ref), appChatPerfTrackerModule (ref), signalsModule (ref), getConversationMessageViewModelStoreModule (ref), signalsReactModule (ref), fIntAppChatMessageInitialFetchMinMessagesModule (ref), fIntAppChatInitialMessageFetchLimitModule (ref), createScrollIntervalTrackerModule (ref), viewRecyclerModule (ref), useMessageListLayoutModule (ref), t (ref), messageRowTypesModule (ref), fIntAppChatMessageListV2OverscanRowsModule (ref), noop (ref), fFlagAppChatConversationLoadingSkeletonModule (ref)
	local var2
	local var3 = reactModule.useRef(p1)
	var3.current = p1
	local conversationId = p1.conversationId
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useMemo(function()
		-- upvalues: listItemsModule (copy), p1 (ref), var4 (ref)
		return listItemsModule.build(p1.itemList, var4.current)
	end, { p1.itemList })
	var4.current = var5
	local items = var5.items
	local itemsCount = #items
	local var6 = reactModule.useRef(nil)
	
	if var6.current == nil then
		local messageId
		for i = #items, 1, -1 do
			local var7 = items[i]
			var2 = var7.isIncoming == true and (if var7.messageType ~= enumMessageTypesModule.PlainText then var7.messageType == enumMessageTypesModule.Link else true)
			
			if not var2 then
				continue
			end
			messageId = items[i].messageId
			var6.current = messageId
		end
		messageId = nil
	end
	local current = var6.current
	local var8 = reactModule.useRef(itemsCount)
	reactModule.useEffect(function()
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), itemsCount (ref), var8 (ref), appChatPerfTrackerModule (copy), conversationId (ref)
		if fFlagAppChatPerfTrackingModule and var8.current < itemsCount then
			appChatPerfTrackerModule.finish(appChatPerfTrackerModule.Events.PaginationMessageList, { conversationId = conversationId })
		end
		var8.current = itemsCount
	end, { itemsCount, conversationId })
	local var9 = reactModule.useRef(0)
	local var10 = items[itemsCount]
	var2 = if var10 ~= nil then nil else listItemsModule.getKey(var10)
	local var11 = reactModule.useRef(var2)
	reactModule.useEffect(function()
		-- upvalues: var11 (ref), var2 (ref), var9 (ref), var3 (ref)
		local current = var11.current
		var11.current = var2
		
		if current ~= nil and var2 ~= nil and (var2 ~= current and var9.current < 64) then
			var3.current.markAsRead()
		end
	end, { var2 })
	local var12 = reactModule.useRef(nil)
	local var13 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getConversationMessageViewModelStoreModule (copy), conversationId (ref)
		return signalsModule.createComputed(function(p2)
			-- upvalues: getConversationMessageViewModelStoreModule (copy), conversationId (copy)
			local metadata = getConversationMessageViewModelStoreModule(false).conversationMessageListStore.getMetadata(conversationId, p2)
			
			return metadata ~= nil and metadata.isLoading == true
		end)
	end, { conversationId }))
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var12 (ref)
		if not var13 then
			var12.current = nil
		end
	end, { var13 })
	local var14 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var4 (ref), listItemsModule (copy), var12 (ref), fFlagAppChatPerfTrackingModule (copy), appChatPerfTrackerModule (copy), conversationId (ref)
		local loadNext = var3.current.loadNext
		
		if loadNext == nil then return end
		local items = var4.current.items
		local var15 = items[1]
		local var16 = `{#items}:{if var15 ~= nil then "" else listItemsModule.getKey(var15)}`
		
		if var12.current == var16 then return end
		var12.current = var16
		
		if fFlagAppChatPerfTrackingModule then
			appChatPerfTrackerModule.start(appChatPerfTrackerModule.Events.PaginationMessageList, { conversationId = conversationId })
		end
		loadNext()
	end, { conversationId })
	local var17 = p1.openAtStart == true
	local var18 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getConversationMessageViewModelStoreModule (copy), conversationId (ref), var17 (ref), fIntAppChatMessageInitialFetchMinMessagesModule (copy)
		return signalsModule.createComputed(function(p2)
			-- upvalues: getConversationMessageViewModelStoreModule (copy), conversationId (copy), var17 (copy), fIntAppChatMessageInitialFetchMinMessagesModule (copy)
			local conversationMessageListStore = getConversationMessageViewModelStoreModule(false).conversationMessageListStore
			local metadata = conversationMessageListStore.getMetadata(conversationId, p2)
			
			if metadata ~= nil and metadata.fetchedOldest == true then
				return nil
			end
			local count = #conversationMessageListStore.getOrderedIds(conversationId, p2)
			
			return if var17 or fIntAppChatMessageInitialFetchMinMessagesModule > count then count else nil
		end)
	end, { conversationId, var17 }))
	local var19 = p1.loadNext ~= nil
	local var20 = var19 and var18 ~= nil
	local var21 = reactModule.useRef(0)
	local var22 = reactModule.useRef(nil)
	local var23 = reactModule.useRef(false)
	local var24, var25 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), var17 (ref), var21 (ref), fIntAppChatInitialMessageFetchLimitModule (copy), var22 (ref), var18 (ref), var23 (ref), var14 (ref), getConversationMessageViewModelStoreModule (copy), conversationId (ref), var25 (ref)
		if var20 and not var17 and var21.current < fIntAppChatInitialMessageFetchLimitModule then
			var21.current += 1
			var22.current = var18
			var23.current = false
			var14()
			local metadata = getConversationMessageViewModelStoreModule(false).conversationMessageListStore.getMetadata(conversationId)
			
			if metadata == nil or metadata.isLoading ~= true then
				var25(true)
			end
		end
	end, {
		conversationId,
		var18,
		var20,
		var17,
		var14
	})
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var23 (ref), var18 (ref), var22 (ref), var21 (ref), fIntAppChatInitialMessageFetchLimitModule (copy), var25 (ref)
		if var13 then
			var23.current = true
			
			return
		elseif var23.current and (var18 == var22.current or fIntAppChatInitialMessageFetchLimitModule <= var21.current) then
			var25(true)
		end
	end, { var13, var18 })
	local var26 = reactModule.useRef(nil)
	local var27 = reactModule.useRef(nil)
	local var28, var29 = reactModule.useState(nil)
	reactModule.useEffect(function()
		-- upvalues: fFlagAppChatPerfTrackingModule (copy), var28 (ref), createScrollIntervalTrackerModule (copy), appChatPerfTrackerModule (copy), conversationId (ref), var27 (ref)
		if fFlagAppChatPerfTrackingModule and var28 ~= nil then
			local var30 = createScrollIntervalTrackerModule(appChatPerfTrackerModule.Events.ScrollMessageList, var28, { conversationId = conversationId })
			var27.current = var30
			
			return function()
				-- upvalues: var30 (ref), var27 (copy)
				var30.cleanup()
				var27.current = nil
			end
		end
		return nil
	end, { var28, conversationId })
	local var30 = reactModule.useCallback(function()
		-- upvalues: var27 (ref), var26 (ref), var9 (ref), var4 (ref), var3 (ref)
		if var27.current ~= nil then
			var27.current.onScrollTick()
		end
		local current = var26.current
		
		if current == nil then return end
		local distanceFromEnd = current.getScrollState().distanceFromEnd
		var9.current = distanceFromEnd
		
		if distanceFromEnd < 64 and #var4.current.items > 0 then
			var3.current.markAsRead()
		end
	end, {})
	local readingMessagesIsEnabled = p1.readingMessagesIsEnabled
	local var31 = reactModule.useRef(readingMessagesIsEnabled)
	reactModule.useEffect(function()
		-- upvalues: var31 (ref), readingMessagesIsEnabled (ref), var9 (ref), var3 (ref)
		local current = var31.current
		var31.current = readingMessagesIsEnabled
		
		if readingMessagesIsEnabled and not current and var9.current < 64 then
			var3.current.markAsRead()
		end
	end, { readingMessagesIsEnabled })
	local var32, var33 = reactModule.useState(0)
	local var34 = reactModule.useCallback(function(p2)
		-- upvalues: var33 (ref)
		var33(p2.X)
	end, {})
	local var35 = reactModule.useCallback(function(p2)
		-- upvalues: var29 (ref)
		if p2 ~= nil then
			p2.Selectable = false
		end
		var29(p2)
	end, {})
	local var36 = if p1.isInitialMessageLoading ~= true then var20 and (var17 or not var24) else true
	local var37 = reactModule.useRef(nil)
	
	if var37.current == nil and not var36 then
		var37.current = if var17 then viewRecyclerModule.ScrollAlignment.Start else viewRecyclerModule.ScrollAlignment.End
	end
	local current_1 = var37.current
	local var38 = reactModule.useRef(var5.byKey)
	local var39 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var38 (ref), var5 (ref), var39 (ref), var36 (ref), var26 (ref), listItemsModule (copy)
		local current = var38.current
		var38.current = var5.byKey
		local current_1 = var39.current
		var39.current = not var36
		local var40 = var5.items[#var5.items]
		local current_2 = var26.current
		
		if current_1 and current_2 ~= nil and (var40 ~= nil and var40.isIncoming ~= true) and current[listItemsModule.getKey(var40)] == nil then
			current_2.scrollToEnd()
		end
	end, { var5, var36 })
	local var40, var41 = reactModule.useState(false)
	local var42 = useMessageListLayoutModule(reactModule.useCallback(function()
		-- upvalues: var41 (ref)
		var41(true)
	end, {}))
	local var43 = reactModule.useRef(false)
	local current_2 = var43.current or (var40 or itemsCount == 0)
	
	if not var36 then
		var43.current = current_2
	end
	return {
		contextValue = reactModule.useMemo(function()
			-- upvalues: conversationId (ref), var32 (ref), p1 (ref), current (ref), noop (copy)
			return {
				conversationId = conversationId,
				width = var32,
				wideMode = p1.wideMode == true,
				isDebugEnabled = p1.isDebugEnabled == true,
				lastIncomingChatMessageId = current,
				viewProfileOnAvatarPressed = p1.viewProfileOnAvatarPressed ~= false,
				inputBoxRef = p1.inputBoxRef,
				closeKeyboard = p1.closeKeyboard or noop,
				onDetailsOpened = p1.onDetailsOpened or noop,
				openGameDetailsPage = p1.openGameDetailsPage or noop,
				openMomentsDeepLink = p1.openMomentsDeepLink,
				openViewProfile = p1.openViewProfile or noop,
				invalidMessageTypeText = p1.invalidMessageTypeText,
				messageDefaultNoticeText = p1.messageDefaultNoticeText,
				messageModeratedNoticeText = p1.messageModeratedNoticeText,
				messageHiddenNoticeText = p1.messageHiddenNoticeText,
				unknownUserText = p1.unknownUserText
			}
		end, {
			conversationId, var32, current, p1.wideMode, p1.isDebugEnabled,
			p1.viewProfileOnAvatarPressed, p1.inputBoxRef, p1.closeKeyboard,
			p1.onDetailsOpened, p1.openGameDetailsPage, p1.openMomentsDeepLink,
			p1.openViewProfile, p1.invalidMessageTypeText, p1.messageDefaultNoticeText,
			p1.messageModeratedNoticeText, p1.messageHiddenNoticeText, p1.unknownUserText
		}),
		listProps = reactModule.useMemo(function()
			-- upvalues: viewRecyclerModule (copy), t (copy), current_1 (ref), items (ref), listItemsModule (copy), var42 (ref), messageRowTypesModule (copy), var26 (ref), fIntAppChatMessageListV2OverscanRowsModule (copy), var19 (ref), var14 (ref), var30 (ref), var34 (ref), var35 (ref), current_2 (ref)
			local cloned = table.clone(viewRecyclerModule.ChatPreset.create({ startReachedThreshold = t }))
			cloned.initialScrollAlignment = current_1 or cloned.initialScrollAlignment
			cloned.data = { items = items, getItemKey = listItemsModule.getKey }
			cloned.layout = var42
			cloned.axis = viewRecyclerModule.Axis.Y
			cloned.itemType = messageRowTypesModule.MessageRowType
			cloned.pinnedEndItem = messageRowTypesModule.EndSpacerItem
			cloned.listRef = var26
			cloned.overscan = fIntAppChatMessageListV2OverscanRowsModule
			cloned.onStartReached = if var19 then var14 else nil
			cloned.onScrollOffsetChanged = var30
			cloned.onViewportChanged = var34
			cloned.scrollingFrameRef = var35
			cloned.scrollingFrameProps = {
				Name = "MessageList",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScrollBarThickness = 0,
				Visible = current_2
			}
			
			return cloned
		end, {
			var35, var19, current_1, current_2, items, var42, var30, var34, var14
		}),
		isLoading = var36,
		isListVisible = current_2,
		showLoadingSkeleton = fFlagAppChatConversationLoadingSkeletonModule
	}
end