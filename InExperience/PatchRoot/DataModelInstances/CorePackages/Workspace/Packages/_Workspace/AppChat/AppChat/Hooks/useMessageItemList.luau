local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local _DateTime = require(Parent.Time).DateTime
local FilterForLinksWithPolicyModule = require(AppChat.Components.ChatConversation.Utils.filterForLinksWithPolicy)
local PopulateMessageWithStateModule = require(AppChat.Conversations.populateMessageWithState)
local GetConversationMessageViewModelStoreModule = require(AppChat.Stores.GetConversationMessageViewModelStore)
local _ = require(AppChat.MessageData.Types)
local EnumsModule = require(AppChat.MessageData.Enums)
local FFlagAppChatPerfTrackingModule = require(AppChat.Flags.FFlagAppChatPerfTracking)
local FFlagAppChatMessageTTIMilestonesModule = require(AppChat.Flags.FFlagAppChatMessageTTIMilestones)
local AppChatPerfTrackerModule = require(AppChat.Telemetry.AppChatPerfTracker)
local MessageStatus = EnumsModule.MessageStatus
local MessageType = EnumsModule.MessageType

local function _(p1) --[[ Line: 32 | Named "toLuaDateTime" ]]
	-- upvalues: _DateTime (copy)
	if p1 == nil or p1 == "" then
		return nil
	else
		local Success, Result = pcall(function() --[[ Line: 36 ]]
			-- upvalues: _DateTime (upval), p1 (copy)
			return _DateTime.fromIsoDate(p1)
		end)
		
		return if Success then Result else nil
	end
end

local function buildLegacyRepliesTo(p1, p2) --[[ Line: 48 ]]
	-- upvalues: CryoModule (copy), _DateTime (copy), MessageType (copy)
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
		local CreatedAt1 = RepliesTo.created_at
		local Sent = nil
		
		if CreatedAt1 == nil or CreatedAt1 == "" then
			Sent = nil
		else
			local Success1, Result1 = pcall(function() --[[ Line: 36 ]]
				-- upvalues: _DateTime (upval), CreatedAt1 (copy)
				return _DateTime.fromIsoDate(CreatedAt1)
			end)
			Sent = if Success1 then Result1 else nil
		end
		config1.sent = Sent
		
		return config1
	else
		local JoinFunction = CryoModule.Dictionary.join
		local config = { senderTargetId = tostring(v1.sender_user_id) }
		local CreatedAt = v1.created_at
		local Sent = nil
		
		if CreatedAt == nil or CreatedAt == "" then
			Sent = nil
		else
			local Success, Result = pcall(function() --[[ Line: 36 ]]
				-- upvalues: _DateTime (upval), CreatedAt (copy)
				return _DateTime.fromIsoDate(CreatedAt)
			end)
			Sent = if Success then Result else nil
		end
		config.sent = Sent
		config.messageType = if v1.type == MessageType.System then "System" else "PlainText"
		
		return JoinFunction(v1, config)
	end
end

local function toLegacyMessage(p1, p2) --[[ Line: 75 ]]
	-- upvalues: MessageType (copy), CryoModule (copy), _DateTime (copy), MessageStatus (copy), buildLegacyRepliesTo (copy)
	local System: string = if p1.type == MessageType.System then "System" else "PlainText"
	local JoinFunction = CryoModule.Dictionary.join
	local config = {
		senderTargetId = tostring(p1.sender_user_id),
		senderType = p1.type,
		messageType = p1.messageType or System
	}
	local CreatedAt = p1.created_at
	local Sent = nil
	
	if CreatedAt == nil or CreatedAt == "" then
		Sent = nil
	else
		local Success, Result = pcall(function() --[[ Line: 36 ]]
			-- upvalues: _DateTime (upval), CreatedAt (copy)
			return _DateTime.fromIsoDate(CreatedAt)
		end)
		Sent = if Success then Result else nil
	end
	config.sent = Sent
	config.moderationType = p1.moderation_type
	config.moderated = p1.status == MessageStatus.Moderated
	config.failed = p1.status == MessageStatus.Failed
	config.isSending = p1.status == MessageStatus.Pending
	config.filteredForReceivers = p1.filtered_for_receivers
	config.contentToDisplay = p1.content_to_display
	config.repliesTo = buildLegacyRepliesTo(p1, p2)
	
	return JoinFunction(p1, config)
end

local _ = function(p1, First) --[[ Line: 93 | Named "applyGroupedVariant" ]]
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

local function buildPopulatedMessage(p1, First, p2, p3, p4, Users, LocalUserId, p5) --[[ Line: 117 ]]
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

local function buildMessageItemList(OrderedIds, MessagesResult, Callback, Current, Current1, LocalUserId) --[[ Line: 157 ]]
	-- upvalues: CryoModule (copy), toLegacyMessage (copy), FilterForLinksWithPolicyModule (copy), buildPopulatedMessage (copy)
	if #OrderedIds == 0 or Current == nil then
		return {}
	end
	local FilterMapResult = CryoModule.List.filterMap(OrderedIds, function(p1) --[[ Line: 169 ]]
		-- upvalues: MessagesResult (copy), toLegacyMessage (upval)
		local MessagesResultEntry = MessagesResult[p1]
		
		return if MessagesResultEntry == nil then nil else toLegacyMessage(MessagesResultEntry, MessagesResult)
	end)
	local List = {}
	local v1 = nil
	
	for i = #FilterMapResult, 1, -1 do
		local FilterMapResultEntry = FilterMapResult[i]
		local FilterForLinksWithPolicyModuleResult = FilterForLinksWithPolicyModule(FilterMapResultEntry)
		local FilterMapResultEntry1 = if i > 1 then FilterMapResult[i - 1] else nil
		local CallbackResult = Callback(FilterMapResultEntry.id)
		
		for i1, value in FilterForLinksWithPolicyModuleResult do
			local PopulatedMessage = buildPopulatedMessage(value, if #FilterForLinksWithPolicyModuleResult == 1 then CallbackResult else nil, v1, FilterForLinksWithPolicyModuleResult[i1 + 1] or FilterMapResultEntry1, Current, Current1, LocalUserId, i1)
			table.insert(List, PopulatedMessage)
			v1 = PopulatedMessage
		end
	end
	return CryoModule.List.reverse(List)
end

return {
	useMessageItemList = function(ConversationId, Current, p1, Current1) --[[ Line: 218 ]]
		-- upvalues: ReactModule (copy), GetConversationMessageViewModelStoreModule (copy), SignalsModule (copy), FFlagAppChatPerfTrackingModule (copy), FFlagAppChatMessageTTIMilestonesModule (copy), AppChatPerfTrackerModule (copy), buildMessageItemList (copy), UseSignalStateFunction (copy)
		local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 219 ]]
			-- upvalues: GetConversationMessageViewModelStoreModule (upval)
			return GetConversationMessageViewModelStoreModule(false)
		end, {})
		local ConversationMessageStore = UseMemoResult.conversationMessageStore
		local ConversationMessageListStore = UseMemoResult.conversationMessageListStore
		local UseRefResult = ReactModule.useRef(Current1)
		UseRefResult.current = Current1
		local UseRefResult1 = ReactModule.useRef(Current)
		UseRefResult1.current = Current
		
		return UseSignalStateFunction((ReactModule.useMemo(function() --[[ Line: 232 ]]
			-- upvalues: ConversationId (copy), SignalsModule (upval), ConversationMessageListStore (copy), ConversationMessageStore (copy), p1 (copy), UseRefResult (copy), FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), AppChatPerfTrackerModule (upval), buildMessageItemList (upval), UseMemoResult (copy), UseRefResult1 (copy)
			return if ConversationId == nil then SignalsModule.createComputed(function() --[[ Line: 234 ]]
				return {}
			end) else SignalsModule.createComputed(function(p2) --[[ Line: 239 ]]
				-- upvalues: ConversationMessageListStore (upval), ConversationId (upval), ConversationMessageStore (upval), p1 (upval), UseRefResult (upval), FFlagAppChatPerfTrackingModule (upval), FFlagAppChatMessageTTIMilestonesModule (upval), AppChatPerfTrackerModule (upval), buildMessageItemList (upval), UseMemoResult (upval), UseRefResult1 (upval)
				local OrderedIds = ConversationMessageListStore.getOrderedIds(ConversationId, p2)
				local MessagesResult = ConversationMessageStore.messages(p2)
				local Text = tostring(p1 or "")
				
				if UseRefResult.current == nil then
					return {}
				end
				local IsActive = FFlagAppChatPerfTrackingModule and (FFlagAppChatMessageTTIMilestonesModule and AppChatPerfTrackerModule.isActive(AppChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = ConversationId }))
				
				if IsActive then
					local config = { conversationId = ConversationId }
					AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, config)
					AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, AppChatPerfTrackerModule.Milestone.DataProcessingStarted.Subphase.DataUpdate, config)
				end
				local MessageItemList = buildMessageItemList(OrderedIds, MessagesResult, function(p3) --[[ Line: 268 ]]
					-- upvalues: UseMemoResult (upval), ConversationId (upval), p2 (copy)
					return UseMemoResult.getGroupedVariant(p3, ConversationId)(p2)
				end, UseRefResult.current, UseRefResult1.current, Text)
				
				if IsActive then
					local config = { conversationId = ConversationId }
					AppChatPerfTrackerModule.trackMilestone(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, config)
					AppChatPerfTrackerModule.trackSubphase(AppChatPerfTrackerModule.Events.ChatConversationTTI, AppChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, AppChatPerfTrackerModule.Milestone.DataProcessingCompleted.Subphase.DataUpdate, config)
				end
				return MessageItemList
			end)
		end, {
			ConversationId,
			p1,
			UseMemoResult,
			ConversationMessageStore,
			ConversationMessageListStore
		})))
	end,
	buildMessageItemList = buildMessageItemList
}