local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local useSignalState = require(parent.SignalsReact).useSignalState
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local dateTime = require(parent.Time).DateTime
local filterForLinksWithPolicyModule = require(appChat.Components.ChatConversation.Utils.filterForLinksWithPolicy)
local populateMessageWithStateModule = require(appChat.Conversations.populateMessageWithState)
local getConversationMessageViewModelStoreModule = require(appChat.Stores.GetConversationMessageViewModelStore)
local _ = require(appChat.MessageData.Types)
local enumsModule = require(appChat.MessageData.Enums)
local fFlagAppChatPerfTrackingModule = require(appChat.Flags.FFlagAppChatPerfTracking)
local fFlagAppChatMessageTTIMilestonesModule = require(appChat.Flags.FFlagAppChatMessageTTIMilestones)
local appChatPerfTrackerModule = require(appChat.Telemetry.AppChatPerfTracker)
local messageStatus = enumsModule.MessageStatus
local messageType = enumsModule.MessageType

local function _(p1)
	-- upvalues: dateTime (ref)
	if p1 == nil or p1 == "" then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: dateTime (copy), p1 (ref)
		return dateTime.fromIsoDate(p1)
	end)
	
	return if ok then status else nil
end

local function buildLegacyRepliesTo(p1, p2)
	-- upvalues: cryoModule (ref), dateTime (ref), messageType (ref)
	local repliesTo = p1.replies_to
	
	if repliesTo == nil then
		return nil
	end
	local status
	local id = p2[repliesTo.id]
	
	if id == nil then
		local var1
		local t = {
			id = repliesTo.id,
			content = repliesTo.content,
			messageType = if repliesTo.type == messageType.System then "System" else "PlainText",
			senderTargetId = tostring(repliesTo.sender_user_id)
		}
		local createdAt = repliesTo.created_at
		
		if createdAt == nil or createdAt == "" then
			var1 = nil
		else
			ok, status = pcall(function()
				-- upvalues: dateTime (copy), createdAt (ref)
				return dateTime.fromIsoDate(createdAt)
			end)
			var1 = if ok then status else nil
		end
		t.sent = var1
		
		return t
	else
		local var2
		local join = cryoModule.Dictionary.join
		local var3 = id
		local t = { senderTargetId = tostring(id.sender_user_id) }
		status = id.created_at
		
		if status == nil or status == "" then
			var2 = nil
		else
			local ok, status = pcall(function()
				-- upvalues: dateTime (copy), status (ref)
				return dateTime.fromIsoDate(status)
			end)
			var2 = if ok then status else nil
		end
		t.sent = var2
		t.messageType = if id.type == messageType.System then "System" else "PlainText"
		
		return join(var3, t)
	end
end

local function toLegacyMessage(p1, p2)
	-- upvalues: messageType (ref), cryoModule (ref), dateTime (ref), messageStatus (ref), buildLegacyRepliesTo (ref)
	local var1
	local join = cryoModule.Dictionary.join
	local t = {
		senderTargetId = tostring(p1.sender_user_id),
		senderType = p1.type,
		messageType = p1.messageType or (if p1.type == messageType.System then "System" else "PlainText")
	}
	local createdAt = p1.created_at
	
	if createdAt == nil or createdAt == "" then
		var1 = nil
	else
		local ok, status = pcall(function()
			-- upvalues: dateTime (copy), createdAt (ref)
			return dateTime.fromIsoDate(createdAt)
		end)
		var1 = if ok then status else nil
	end
	t.sent = var1
	t.moderationType = p1.moderation_type
	t.moderated = p1.status == messageStatus.Moderated
	t.failed = p1.status == messageStatus.Failed
	t.isSending = p1.status == messageStatus.Pending
	t.filteredForReceivers = p1.filtered_for_receivers
	t.contentToDisplay = p1.content_to_display
	t.repliesTo = buildLegacyRepliesTo(p1, p2)
	
	return join(p1, t)
end

local _ = function(p1, p2)
	-- upvalues: enumsModule (ref)
	if p2 == nil then
		return p1
	end
	local groupedMessageVariant = enumsModule.GroupedMessageVariant
	
	if p2 == groupedMessageVariant.Single then
		p1.isNewSender = true
		p1.isLastMessageInMessageGroup = true
		
		return p1
	elseif p2 == groupedMessageVariant.First then
		p1.isNewSender = true
		p1.isLastMessageInMessageGroup = false
		
		return p1
	elseif p2 == groupedMessageVariant.Middle then
		p1.isNewSender = false
		p1.isLastMessageInMessageGroup = false
		
		return p1
	elseif p2 == groupedMessageVariant.Last then
		p1.isNewSender = false
		p1.isLastMessageInMessageGroup = true
	end
	return p1
end

local function buildPopulatedMessage(p1, p2, p3, p4, p5, p6, p7, p8)
	-- upvalues: populateMessageWithStateModule (ref), enumsModule (ref)
	local var1 = populateMessageWithStateModule({ Users = p6, LocalUserId = p7 }, p1, p1.id, p5, p3, p1.isSending == true, p4)
	
	if p2 == nil then
		var1 = var1
	else
		local groupedMessageVariant = enumsModule.GroupedMessageVariant
		
		if p2 == groupedMessageVariant.Single then
			var1.isNewSender = true
			var1.isLastMessageInMessageGroup = true
		elseif p2 == groupedMessageVariant.First then
			var1.isNewSender = true
			var1.isLastMessageInMessageGroup = false
		elseif p2 == groupedMessageVariant.Middle then
			var1.isNewSender = false
			var1.isLastMessageInMessageGroup = false
		elseif p2 == groupedMessageVariant.Last then
			var1.isNewSender = false
			var1.isLastMessageInMessageGroup = true
		end
		var1 = var1
	end
	var1.stable_key = `{var1.stableKey or var1.messageId}_{p8}`
	
	return var1
end

local function buildMessageItemList(p1, p2, p3, p4, p5, p6)
	-- upvalues: cryoModule (ref), toLegacyMessage (ref), filterForLinksWithPolicyModule (ref), buildPopulatedMessage (ref)
	if #p1 == 0 or p4 == nil then
		return {}
	end
	local var1 = cryoModule.List.filterMap(p1, function(p7)
		-- upvalues: p2 (ref), toLegacyMessage (copy)
		local var2 = p2[p7]
		
		return if var2 == nil then nil else toLegacyMessage(var2, p2)
	end)
	local t = {}
	local var2 = nil
	
	for i_1 = #var1, 1, -1 do
		local var3 = var1[i_1]
		local var4 = filterForLinksWithPolicyModule(var3)
		local var5 = if i_1 > 1 then var1[i_1 - 1] else nil
		local var6 = p3(var3.id)
		
		for i, v in var4 do
			local var7 = buildPopulatedMessage(v, if #var4 == 1 then var6 else nil, var2, var4[i + 1] or var5, p4, p5, p6, i)
			table.insert(t, var7)
			var2 = var7
		end
	end
	return cryoModule.List.reverse(t)
end

return {
	useMessageItemList = function(p7, p8, p9, p10)
		-- upvalues: reactModule (ref), getConversationMessageViewModelStoreModule (ref), signalsModule (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), buildMessageItemList (ref), useSignalState (ref)
		local var8 = reactModule.useMemo(function()
			-- upvalues: getConversationMessageViewModelStoreModule (copy)
			return getConversationMessageViewModelStoreModule(false)
		end, {})
		local conversationMessageStore = var8.conversationMessageStore
		local conversationMessageListStore = var8.conversationMessageListStore
		local var9 = reactModule.useRef(p10)
		var9.current = p10
		local var10 = reactModule.useRef(p8)
		var10.current = p8
		
		return useSignalState(reactModule.useMemo(function()
			-- upvalues: p7 (ref), signalsModule (copy), conversationMessageListStore (ref), conversationMessageStore (ref), p9 (ref), var9 (ref), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), buildMessageItemList (copy), var8 (ref), var10 (ref)
			return if p7 == nil then signalsModule.createComputed(function()
				return {}
			end) else signalsModule.createComputed(function(p11)
				-- upvalues: conversationMessageListStore (copy), p7 (copy), conversationMessageStore (copy), p9 (copy), var9 (copy), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), buildMessageItemList (copy), var8 (copy), var10 (copy)
				local orderedIds = conversationMessageListStore.getOrderedIds(p7, p11)
				local var11 = conversationMessageStore.messages(p11)
				local var12 = tostring(p9 or "")
				
				if var9.current == nil then
					return {}
				end
				local chatConversationTTI = fFlagAppChatPerfTrackingModule and (fFlagAppChatMessageTTIMilestonesModule and appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = p7 }))
				
				if chatConversationTTI then
					local t = { conversationId = p7 }
					appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, t)
					appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Subphase.DataUpdate, t)
				end
				local var13 = buildMessageItemList(orderedIds, var11, function(p12)
					-- upvalues: var8 (copy), p7 (copy), p11 (ref)
					return var8.getGroupedVariant(p12, p7)(p11)
				end, var9.current, var10.current, var12)
				
				if chatConversationTTI then
					local t = { conversationId = p7 }
					appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, t)
					appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Subphase.DataUpdate, t)
				end
				return var13
			end)
		end, {
			p7,
			p9,
			var8,
			conversationMessageStore,
			conversationMessageListStore
		}))
	end,
	buildMessageItemList = buildMessageItemList
}