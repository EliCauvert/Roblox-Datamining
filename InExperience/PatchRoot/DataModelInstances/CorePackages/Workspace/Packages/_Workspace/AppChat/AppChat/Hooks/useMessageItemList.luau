local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local _DateTime = require(Parent.Time).DateTime
local FilterForLinksWithPolicyModule = require(AppChat.Components.ChatConversation.Utils.filterForLinksWithPolicy)
local PopulateMessageWithStateModule = require(AppChat.Conversations.populateMessageWithState)
local GetConversationMessageViewModelStoreModule = require(AppChat.Stores.GetConversationMessageViewModelStore)
local _ = require(AppChat.MessageData.Types)
local EnumsModule = require(AppChat.MessageData.Enums)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatMessageTTIMilestonesModule = require(AppChat.Flags.FFlagAppChatMessageTTIMilestones)
local FFlagAppChatIncrementalMessageItemListModule = require(AppChat.Flags.FFlagAppChatIncrementalMessageItemList)
local FFlagAppChatParseMessageTimestampsOnceModule = require(AppChat.Flags.FFlagAppChatParseMessageTimestampsOnce)
local FFlagAppChatFixMessageItemListStaleRefsModule = require(AppChat.Flags.FFlagAppChatFixMessageItemListStaleRefs)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local MessageStatus = EnumsModule.MessageStatus
local MessageType = EnumsModule.MessageType

local function _(p1)
	-- upvalues: _DateTime (copy)
	if p1 == nil or p1 == "" then
		return nil
	else
		local Success, Result = pcall(function()
			-- upvalues: _DateTime (upval), p1 (copy)
			return _DateTime.fromIsoDate(p1)
		end)
		
		return if Success then Result else nil
	end
end

local _ = function(p1)
	-- upvalues: _DateTime (copy)
	local CreatedAtUnixMillis = p1.createdAtUnixMillis
	
	if CreatedAtUnixMillis ~= nil then
		return _DateTime.fromUnixTimestampMillis(CreatedAtUnixMillis)
	end
	local CreatedAt = p1.created_at
	
	if CreatedAt == nil or CreatedAt == "" then
		return nil
	else
		local Success, Result = pcall(function()
			-- upvalues: _DateTime (upval), CreatedAt (copy)
			return _DateTime.fromIsoDate(CreatedAt)
		end)
		
		return if Success then Result else nil
	end
end

local function buildLegacyRepliesTo(p1, p2)
	-- upvalues: CryoModule (copy), FFlagAppChatParseMessageTimestampsOnceModule (copy), _DateTime (copy), MessageType (copy)
	local RepliesTo = p1.replies_to
	
	if RepliesTo == nil then
		return nil
	end
	local v1 = p2[RepliesTo.id]
	
	if v1 == nil then
		local config1 = {
			id = RepliesTo.id,
			content = RepliesTo.content,
			messageType = if RepliesTo.type == MessageType.System then "System" else "PlainText",
			senderTargetId = tostring(RepliesTo.sender_user_id)
		}
		local FromUnixTimestampMillisResult = nil
		
		if FFlagAppChatParseMessageTimestampsOnceModule then
			local CreatedAtUnixMillis = RepliesTo.createdAtUnixMillis
			
			if CreatedAtUnixMillis == nil then
				local CreatedAt3 = RepliesTo.created_at
				
				if CreatedAt3 == nil or CreatedAt3 == "" then
					FromUnixTimestampMillisResult = nil
				else
					local Success2, Result2 = pcall(function()
						-- upvalues: _DateTime (upval), CreatedAt3 (copy)
						return _DateTime.fromIsoDate(CreatedAt3)
					end)
					FromUnixTimestampMillisResult = if Success2 then Result2 else nil
				end
			else
				FromUnixTimestampMillisResult = _DateTime.fromUnixTimestampMillis(CreatedAtUnixMillis)
			end
		else
			local CreatedAt2 = RepliesTo.created_at
			
			if CreatedAt2 == nil or CreatedAt2 == "" then
				FromUnixTimestampMillisResult = nil
			else
				local Success3, Result3 = pcall(function()
					-- upvalues: _DateTime (upval), CreatedAt2 (copy)
					return _DateTime.fromIsoDate(CreatedAt2)
				end)
				FromUnixTimestampMillisResult = if Success3 then Result3 else nil
			end
		end
		config1.sent = FromUnixTimestampMillisResult
		
		return config1
	else
		local JoinFunction = CryoModule.Dictionary.join
		local config = { senderTargetId = tostring(v1.sender_user_id) }
		local FromUnixTimestampMillisResult = nil
		
		if FFlagAppChatParseMessageTimestampsOnceModule then
			local CreatedAtUnixMillis = v1.createdAtUnixMillis
			
			if CreatedAtUnixMillis == nil then
				local CreatedAt1 = v1.created_at
				
				if CreatedAt1 == nil or CreatedAt1 == "" then
					FromUnixTimestampMillisResult = nil
				else
					local Success, Result = pcall(function()
						-- upvalues: _DateTime (upval), CreatedAt1 (copy)
						return _DateTime.fromIsoDate(CreatedAt1)
					end)
					FromUnixTimestampMillisResult = if Success then Result else nil
				end
			else
				FromUnixTimestampMillisResult = _DateTime.fromUnixTimestampMillis(CreatedAtUnixMillis)
			end
		else
			local CreatedAt = v1.created_at
			
			if CreatedAt == nil or CreatedAt == "" then
				FromUnixTimestampMillisResult = nil
			else
				local Success1, Result1 = pcall(function()
					-- upvalues: _DateTime (upval), CreatedAt (copy)
					return _DateTime.fromIsoDate(CreatedAt)
				end)
				FromUnixTimestampMillisResult = if Success1 then Result1 else nil
			end
		end
		config.sent = FromUnixTimestampMillisResult
		config.messageType = if v1.type == MessageType.System then "System" else "PlainText"
		
		return JoinFunction(v1, config)
	end
end

local function toLegacyMessage(Message, p1)
	-- upvalues: MessageType (copy), CryoModule (copy), FFlagAppChatParseMessageTimestampsOnceModule (copy), _DateTime (copy), MessageStatus (copy), buildLegacyRepliesTo (copy)
	local System: string = if Message.type == MessageType.System then "System" else "PlainText"
	local JoinFunction = CryoModule.Dictionary.join
	local config = {
		senderTargetId = tostring(Message.sender_user_id),
		senderType = Message.type,
		messageType = Message.messageType or System
	}
	local FromUnixTimestampMillisResult = nil
	
	if FFlagAppChatParseMessageTimestampsOnceModule then
		local CreatedAtUnixMillis = Message.createdAtUnixMillis
		
		if CreatedAtUnixMillis == nil then
			local CreatedAt1 = Message.created_at
			
			if CreatedAt1 == nil or CreatedAt1 == "" then
				FromUnixTimestampMillisResult = nil
			else
				local Success, Result = pcall(function()
					-- upvalues: _DateTime (upval), CreatedAt1 (copy)
					return _DateTime.fromIsoDate(CreatedAt1)
				end)
				FromUnixTimestampMillisResult = if Success then Result else nil
			end
		else
			FromUnixTimestampMillisResult = _DateTime.fromUnixTimestampMillis(CreatedAtUnixMillis)
		end
	else
		local CreatedAt = Message.created_at
		
		if CreatedAt == nil or CreatedAt == "" then
			FromUnixTimestampMillisResult = nil
		else
			local Success1, Result1 = pcall(function()
				-- upvalues: _DateTime (upval), CreatedAt (copy)
				return _DateTime.fromIsoDate(CreatedAt)
			end)
			FromUnixTimestampMillisResult = if Success1 then Result1 else nil
		end
	end
	config.sent = FromUnixTimestampMillisResult
	config.moderationType = Message.moderation_type
	config.moderated = Message.status == MessageStatus.Moderated
	config.failed = Message.status == MessageStatus.Failed
	config.isSending = Message.status == MessageStatus.Pending
	config.filteredForReceivers = Message.filtered_for_receivers
	config.contentToDisplay = Message.content_to_display
	config.repliesTo = buildLegacyRepliesTo(Message, p1)
	
	return JoinFunction(Message, config)
end

local _ = function(p1, First)
	-- upvalues: EnumsModule (copy)
	if First == nil then
		return p1
	end
	local GroupedMessageVariant = EnumsModule.GroupedMessageVariant
	
	if First == GroupedMessageVariant.Single then
		p1.isNewSender = true
		p1.isLastMessageInMessageGroup = true
		
		return p1
	end
	if First == GroupedMessageVariant.First then
		p1.isNewSender = true
		p1.isLastMessageInMessageGroup = false
		
		return p1
	end
	if First == GroupedMessageVariant.Middle then
		p1.isNewSender = false
		p1.isLastMessageInMessageGroup = false
		
		return p1
	end
	if First == GroupedMessageVariant.Last then
		p1.isNewSender = false
		p1.isLastMessageInMessageGroup = true
	end
	return p1
end

local function buildPopulatedMessage(p1, First, p2, p3, p4, Users, LocalUserId, p5)
	-- upvalues: PopulateMessageWithStateModule (copy), EnumsModule (copy)
	local PopulateMessageWithStateModuleResult = PopulateMessageWithStateModule({ Users = Users, LocalUserId = LocalUserId }, p1, p1.id, p4, p2, p1.isSending == true, p3)
	local PopulateMessageWithStateModuleResult1 = nil
	
	if First == nil then
		PopulateMessageWithStateModuleResult1 = PopulateMessageWithStateModuleResult
	else
		local GroupedMessageVariant = EnumsModule.GroupedMessageVariant
		
		if First == GroupedMessageVariant.Single then
			PopulateMessageWithStateModuleResult.isNewSender = true
			PopulateMessageWithStateModuleResult.isLastMessageInMessageGroup = true
		elseif First == GroupedMessageVariant.First then
			PopulateMessageWithStateModuleResult.isNewSender = true
			PopulateMessageWithStateModuleResult.isLastMessageInMessageGroup = false
		elseif First == GroupedMessageVariant.Middle then
			PopulateMessageWithStateModuleResult.isNewSender = false
			PopulateMessageWithStateModuleResult.isLastMessageInMessageGroup = false
		elseif First == GroupedMessageVariant.Last then
			PopulateMessageWithStateModuleResult.isNewSender = false
			PopulateMessageWithStateModuleResult.isLastMessageInMessageGroup = true
		end
		PopulateMessageWithStateModuleResult1 = PopulateMessageWithStateModuleResult
	end
	PopulateMessageWithStateModuleResult1.stable_key = `{PopulateMessageWithStateModuleResult1.stableKey or PopulateMessageWithStateModuleResult1.messageId}_{p5}`
	
	return PopulateMessageWithStateModuleResult1
end

local function buildMessageRows(LegacyMessage, p1, Row, GroupedVariant, p2, Users, LocalUserId)
	-- upvalues: FilterForLinksWithPolicyModule (copy), buildPopulatedMessage (copy)
	local FilterForLinksWithPolicyModuleResult = FilterForLinksWithPolicyModule(LegacyMessage)
	local Buffer = table.create(#FilterForLinksWithPolicyModuleResult)
	
	for i, value in FilterForLinksWithPolicyModuleResult do
		local PopulatedMessage = buildPopulatedMessage(value, if #FilterForLinksWithPolicyModuleResult == 1 then GroupedVariant else nil, Row, FilterForLinksWithPolicyModuleResult[i + 1] or p1, p2, Users, LocalUserId, i)
		table.insert(Buffer, PopulatedMessage)
		Row = PopulatedMessage
	end
	return Buffer
end

local function buildMessageItemList(p3, p4, Callback, p5, p6, p7)
	-- upvalues: CryoModule (copy), toLegacyMessage (copy), buildMessageRows (copy)
	if #p3 == 0 or p5 == nil then
		return {}
	end
	local FilterMapResult = CryoModule.List.filterMap(p3, function(p8)
		-- upvalues: p4 (copy), toLegacyMessage (upval)
		local v1 = p4[p8]
		
		return if v1 == nil then nil else toLegacyMessage(v1, p4)
	end)
	local List = {}
	local v1 = nil
	
	for i = #FilterMapResult, 1, -1 do
		local FilterMapResultEntry = FilterMapResult[i]
		local MessageRows = buildMessageRows(FilterMapResultEntry, if i > 1 then FilterMapResult[i - 1] else nil, v1, Callback(FilterMapResultEntry.id), p5, p6, p7)
		
		for _, messageRow in MessageRows do
			table.insert(List, messageRow)
		end
		v1 = MessageRows[#MessageRows] or v1
	end
	return CryoModule.List.reverse(List)
end

local function createIncrementalMessageItemList()
	-- upvalues: toLegacyMessage (copy), buildMessageRows (copy)
	local T = {}
	local t = {}
	local Count = 0
	local Id = nil
	local ConversationType = nil
	local v2 = nil
	
	return function(List, p8, Callback, p9, p10, p11)
		-- upvalues: T (ref), Count (ref), t (ref), Id (ref), ConversationType (ref), v2 (ref), toLegacyMessage (upval), buildMessageRows (upval)
		if #List == 0 or p9 == nil then
			T = {}
			Count = 0
			
			if #t > 0 then
				t = {}
			end
			return t
		else
			if p9.id ~= Id or p9.conversationType ~= ConversationType or p11 ~= v2 then
				T = {}
				Id = p9.id
				ConversationType = p9.conversationType
				v2 = p11
			end
			local List1 = {}
			
			for _, value in List do
				local v3 = p8[value]
				
				if v3 ~= nil then
					table.insert(List1, v3)
				end
			end
			local function _(p12)
				-- upvalues: p8 (copy)
				return if p12.replies_to == nil then nil else p8[p12.replies_to.id]
			end
			
			local LegacyMessages = {}
			
			local _ = function(Message)
				-- upvalues: LegacyMessages (copy), T (upval), p8 (copy), toLegacyMessage (upval)
				local LegacyMessage = LegacyMessages[Message.id]
				
				if LegacyMessage == nil then
					local Entry = T[Message.id]
					local LegacyMessage1 = if Entry == nil or Entry.message ~= Message then toLegacyMessage(Message, p8) elseif Entry.replyTarget == (if Message.replies_to == nil then nil else p8[Message.replies_to.id]) then Entry.legacyMessage else toLegacyMessage(Message, p8)
					LegacyMessages[Message.id] = LegacyMessage1
					
					return LegacyMessage1
				else
					return LegacyMessage
				end
			end
			
			local t1 = {}
			local Flag = false
			local Row = nil
			local Total = 0
			
			for i = #List1, 1, -1 do
				local Entry = List1[i]
				local Entry1 = List1[i + 1]
				local Entry2 = List1[i - 1]
				local ReplyTarget = if Entry.replies_to == nil then nil else p8[Entry.replies_to.id]
				local CallbackResult = Callback(Entry.id)
				local HasSender: boolean = p10 ~= nil and p10[tostring(Entry.sender_user_id)] ~= nil
				local IsFetchedOldestMessage: boolean = Entry1 == nil and p9.fetchedOldestMessage == true
				local Entry3 = T[Entry.id]
				
				if Entry3 == nil or Entry3.message ~= Entry or Entry3.replyTarget ~= ReplyTarget or Entry3.olderMessage ~= Entry1 or Entry3.newerMessage ~= Entry2 or Entry3.groupedVariant ~= CallbackResult or Entry3.hasSender ~= HasSender or Entry3.showsOldestDateTime ~= IsFetchedOldestMessage then
					Flag = true
					local LegacyMessage = LegacyMessages[Entry.id]
					local LegacyMessage1 = nil
					
					if LegacyMessage == nil then
						local Entry4 = T[Entry.id]
						local LegacyMessage2 = if Entry4 == nil or Entry4.message ~= Entry then toLegacyMessage(Entry, p8) elseif Entry4.replyTarget == (if Entry.replies_to == nil then nil else p8[Entry.replies_to.id]) then Entry4.legacyMessage else toLegacyMessage(Entry, p8)
						LegacyMessages[Entry.id] = LegacyMessage2
						LegacyMessage1 = LegacyMessage2
					else
						LegacyMessage1 = LegacyMessage
					end
					local v4 = nil
					if Entry2 == nil then
						v4 = nil
					else
						local LegacyMessage3 = LegacyMessages[Entry2.id]
						
						if LegacyMessage3 == nil then
							local Entry5 = T[Entry2.id]
							local LegacyMessage4 = if Entry5 == nil or Entry5.message ~= Entry2 then toLegacyMessage(Entry2, p8) elseif Entry5.replyTarget == (if Entry2.replies_to == nil then nil else p8[Entry2.replies_to.id]) then Entry5.legacyMessage else toLegacyMessage(Entry2, p8)
							LegacyMessages[Entry2.id] = LegacyMessage4
							v4 = LegacyMessage4
						else
							v4 = LegacyMessage3
						end
					end
					Entry3 = {
						message = Entry,
						replyTarget = ReplyTarget,
						legacyMessage = LegacyMessage1,
						olderMessage = Entry1,
						newerMessage = Entry2,
						groupedVariant = CallbackResult,
						hasSender = HasSender,
						showsOldestDateTime = IsFetchedOldestMessage,
						rows = buildMessageRows(LegacyMessage1, v4, Row, CallbackResult, p9, p10, p11)
					}
				end
				t1[Entry.id] = Entry3
				Total += #Entry3.rows
				Row = Entry3.rows[#Entry3.rows] or Row
			end
			T = t1
			
			if not Flag and #List1 == Count then
				return t
			end
			Count = #List1
			local Buffer = table.create(Total)
			
			for _, value1 in List1 do
				local Rows = t1[value1.id].rows
				
				for i1 = #Rows, 1, -1 do
					table.insert(Buffer, Rows[i1])
				end
			end
			t = Buffer
			
			return Buffer
		end
	end
end

local function isSameItemListConversation(p12, p13): boolean
	return if p12 == nil or p13 == nil then p12 == p13 else p12.id == p13.id and p12.fetchedOldestMessage == p13.fetchedOldestMessage and p12.conversationType == p13.conversationType
end

local function isSameUserIdSet(List, List1): boolean
	for i in List do
		if not List1[i] then
			return false
		end
	end
	for i1 in List1 do
		if not List[i1] then
			return false
		end
	end
	return true
end

local function useItemListInputs(ConversationId, Current, Current1, UseMemoResult)
	-- upvalues: ReactModule (copy), SignalsModule (copy), isSameItemListConversation (copy), isSameUserIdSet (copy), SignalsExperimentalModule (copy)
	local ConversationMessageStore = UseMemoResult.conversationMessageStore
	local ConversationMessageListStore = UseMemoResult.conversationMessageListStore
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Current (copy), isSameItemListConversation (upval), Current1 (copy), ConversationId (copy), ConversationMessageStore (copy), ConversationMessageListStore (copy), isSameUserIdSet (upval)
		local Signal, Signal2 = SignalsModule.createSignal(Current, isSameItemListConversation)
		local Signal1, Signal2_1 = SignalsModule.createSignal(Current1)
		
		return {
			getConversation = Signal,
			setConversation = Signal2,
			getUsers = Signal1,
			setUsers = Signal2_1,
			getKnownSenderIds = SignalsModule.createComputed(function(p12)
				-- upvalues: Signal1 (copy), ConversationId (upval), ConversationMessageStore (upval), ConversationMessageListStore (upval)
				local t = {}
				local SignalResult = Signal1(p12)
				
				if ConversationId == nil or SignalResult == nil then
					return t
				end
				local MessagesResult = ConversationMessageStore.messages(p12)
				
				for _, value in ConversationMessageListStore.getOrderedIds(ConversationId, p12) do
					local MessagesResultEntry = MessagesResult[value]
					local NoMessagesResultEntry = MessagesResultEntry == nil
					local Text = nil
					
					if not NoMessagesResultEntry then
						Text = tostring(MessagesResultEntry.sender_user_id)
						NoMessagesResultEntry = SignalResult[Text] == nil
					end
					if not NoMessagesResultEntry then
						t[Text] = true
					end
				end
				return t
			end, isSameUserIdSet)
		}
	end, {
		ConversationId,
		ConversationMessageStore,
		ConversationMessageListStore
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: SignalsExperimentalModule (upval), UseMemoResult1 (copy), Current (copy), Current1 (copy)
		SignalsExperimentalModule.batch(function()
			-- upvalues: UseMemoResult1 (upval), Current (upval), Current1 (upval)
			UseMemoResult1.setConversation(Current)
			UseMemoResult1.setUsers(Current1)
		end)
	end, { UseMemoResult1, Current, Current1 })
	
	return UseMemoResult1
end

return {
	useMessageItemList = function(ConversationId, Current, p12, Current1)
		-- upvalues: ReactModule (copy), GetConversationMessageViewModelStoreModule (copy), FFlagAppChatFixMessageItemListStaleRefsModule (copy), useItemListInputs (copy), SignalsModule (copy), FFlagAppChatIncrementalMessageItemListModule (copy), createIncrementalMessageItemList (copy), buildMessageItemList (copy), FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), UseSignalStateFunction (copy)
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: GetConversationMessageViewModelStoreModule (upval)
			return GetConversationMessageViewModelStoreModule(false)
		end, {})
		local ConversationMessageStore = UseMemoResult.conversationMessageStore
		local ConversationMessageListStore = UseMemoResult.conversationMessageListStore
		local UseRefResult = ReactModule.useRef(Current1)
		UseRefResult.current = Current1
		local UseRefResult1 = ReactModule.useRef(Current)
		UseRefResult1.current = Current
		local UseItemListInputsResult = if FFlagAppChatFixMessageItemListStaleRefsModule then useItemListInputs(ConversationId, Current1, Current, UseMemoResult) else nil
		
		return UseSignalStateFunction((ReactModule.useMemo(function()
			-- upvalues: ConversationId (copy), SignalsModule (upval), FFlagAppChatIncrementalMessageItemListModule (upval), createIncrementalMessageItemList (upval), buildMessageItemList (upval), ConversationMessageListStore (copy), ConversationMessageStore (copy), p12 (copy), UseRefResult (copy), UseRefResult1 (copy), FFlagAppChatFixMessageItemListStaleRefsModule (upval), UseItemListInputsResult (ref), FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), AppChatPerfTrackerModule (upval), UseMemoResult (copy)
			if ConversationId == nil then
				return SignalsModule.createComputed(function()
					return {}
				end)
			else
				local IncrementalMessageItemList = if FFlagAppChatIncrementalMessageItemListModule then createIncrementalMessageItemList() else buildMessageItemList
				
				return SignalsModule.createComputed(function(p13)
					-- upvalues: ConversationMessageListStore (upval), ConversationId (upval), ConversationMessageStore (upval), p12 (upval), UseRefResult (upval), UseRefResult1 (upval), FFlagAppChatFixMessageItemListStaleRefsModule (upval), UseItemListInputsResult (upval), FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), AppChatPerfTrackerModule (upval), IncrementalMessageItemList (copy), UseMemoResult (upval)
					local OrderedIds = ConversationMessageListStore.getOrderedIds(ConversationId, p13)
					local MessagesResult = ConversationMessageStore.messages(p13)
					local Text = tostring(p12 or "")
					local Current = UseRefResult.current
					local Current1 = UseRefResult1.current
					
					if FFlagAppChatFixMessageItemListStaleRefsModule then
						local UseItemListInputsResult1 = UseItemListInputsResult
						Current = UseItemListInputsResult1.getConversation(p13)
						UseItemListInputsResult1.getKnownSenderIds(p13)
						Current1 = UseItemListInputsResult1.getUsers(false)
					end
					if Current == nil then
						return {}
					end
					local IsActive = FFlagAppChatPerfTrackingModule and (FFlagAppChatMessageTTIMilestonesModule and AppChatPerfTrackerModule.isActive(AppChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = ConversationId }))
					
					if IsActive then
						local config = { conversationId = ConversationId }
						AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, config)
						AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, AppChatPerfTrackerModule.Milestone.DataProcessingStarted.Subphase.DataUpdate, config)
					end
					local IncrementalMessageItemListResult = IncrementalMessageItemList(OrderedIds, MessagesResult, function(p14)
						-- upvalues: UseMemoResult (upval), ConversationId (upval), p13 (copy)
						return UseMemoResult.getGroupedVariant(p14, ConversationId)(p13)
					end, Current, Current1, Text)
					
					if IsActive then
						local config = { conversationId = ConversationId }
						AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, config)
						AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, AppChatPerfTrackerModule.Milestone.DataProcessingCompleted.Subphase.DataUpdate, config)
					end
					return IncrementalMessageItemListResult
				end)
			end
		end, {
			ConversationId, p12, UseMemoResult, ConversationMessageStore,
			ConversationMessageListStore, UseItemListInputsResult
		})))
	end,
	buildMessageItemList = buildMessageItemList,
	createIncrementalMessageItemList = createIncrementalMessageItemList
}