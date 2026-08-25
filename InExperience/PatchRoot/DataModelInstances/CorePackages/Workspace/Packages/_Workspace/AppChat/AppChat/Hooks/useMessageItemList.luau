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

local function _(p0)
	-- upvalues: dateTime (ref)
	if p0 == nil or p0 == "" then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: dateTime (copy), p0 (ref)
		return dateTime.fromIsoDate(p0)
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
		local var19
		local t = {
			id = repliesTo.id,
			content = repliesTo.content,
			messageType = if repliesTo.type == messageType.System then "System" else "PlainText",
			senderTargetId = tostring(repliesTo.sender_user_id)
		}
		local createdAt = repliesTo.created_at
		
		if createdAt == nil or createdAt == "" then
			var19 = nil
		else
			ok, status = pcall(function()
				-- upvalues: dateTime (copy), createdAt (ref)
				return dateTime.fromIsoDate(createdAt)
			end)
			var19 = if ok then status else nil
		end
		t.sent = var19
		
		return t
	else
		local var17
		local join = cryoModule.Dictionary.join
		local var15 = id
		local t = { senderTargetId = tostring(id.sender_user_id) }
		status = id.created_at
		
		if status == nil or status == "" then
			var17 = nil
		else
			local ok, status = pcall(function()
				-- upvalues: dateTime (copy), status (ref)
				return dateTime.fromIsoDate(status)
			end)
			var17 = if ok then status else nil
		end
		t.sent = var17
		t.messageType = if id.type == messageType.System then "System" else "PlainText"
		
		return join(var15, t)
	end
end

local function toLegacyMessage(p3, p4)
	-- upvalues: messageType (ref), cryoModule (ref), dateTime (ref), messageStatus (ref), buildLegacyRepliesTo (ref)
	local var21
	local join = cryoModule.Dictionary.join
	local t = {
		senderTargetId = tostring(p3.sender_user_id),
		senderType = p3.type,
		messageType = p3.messageType or (if p3.type == messageType.System then "System" else "PlainText")
	}
	local createdAt = p3.created_at
	
	if createdAt == nil or createdAt == "" then
		var21 = nil
	else
		local ok, status = pcall(function()
			-- upvalues: dateTime (copy), createdAt (ref)
			return dateTime.fromIsoDate(createdAt)
		end)
		var21 = if ok then status else nil
	end
	t.sent = var21
	t.moderationType = p3.moderation_type
	t.moderated = p3.status == messageStatus.Moderated
	t.failed = p3.status == messageStatus.Failed
	t.isSending = p3.status == messageStatus.Pending
	t.filteredForReceivers = p3.filtered_for_receivers
	t.contentToDisplay = p3.content_to_display
	t.repliesTo = buildLegacyRepliesTo(p3, p4)
	
	return join(p3, t)
end

local _ = function(p5, p6)
	-- upvalues: enumsModule (ref)
	if p6 == nil then
		return p5
	end
	local groupedMessageVariant = enumsModule.GroupedMessageVariant
	
	if p6 == groupedMessageVariant.Single then
		p5.isNewSender = true
		p5.isLastMessageInMessageGroup = true
		
		return p5
	elseif p6 == groupedMessageVariant.First then
		p5.isNewSender = true
		p5.isLastMessageInMessageGroup = false
		
		return p5
	elseif p6 == groupedMessageVariant.Middle then
		p5.isNewSender = false
		p5.isLastMessageInMessageGroup = false
		
		return p5
	elseif p6 == groupedMessageVariant.Last then
		p5.isNewSender = false
		p5.isLastMessageInMessageGroup = true
	end
	return p5
end

local function buildPopulatedMessage(p7, p8, p9, p10, p11, p12, p13, p14)
	-- upvalues: populateMessageWithStateModule (ref), enumsModule (ref)
	local var22 = populateMessageWithStateModule({ Users = p12, LocalUserId = p13 }, p7, p7.id, p11, p9, p7.isSending == true, p10)
	
	if p8 == nil then
		var22 = var22
	else
		local groupedMessageVariant = enumsModule.GroupedMessageVariant
		
		if p8 == groupedMessageVariant.Single then
			var22.isNewSender = true
			var22.isLastMessageInMessageGroup = true
		elseif p8 == groupedMessageVariant.First then
			var22.isNewSender = true
			var22.isLastMessageInMessageGroup = false
		elseif p8 == groupedMessageVariant.Middle then
			var22.isNewSender = false
			var22.isLastMessageInMessageGroup = false
		elseif p8 == groupedMessageVariant.Last then
			var22.isNewSender = false
			var22.isLastMessageInMessageGroup = true
		end
		var22 = var22
	end
	var22.stable_key = `{var22.stableKey or var22.messageId}_{p14}`
	
	return var22
end

local function buildMessageItemList(p15, p16, p17, p18, p19, p20)
	-- upvalues: cryoModule (ref), toLegacyMessage (ref), filterForLinksWithPolicyModule (ref), buildPopulatedMessage (ref)
	if #p15 == 0 or p18 == nil then
		return {}
	end
	local var23 = cryoModule.List.filterMap(p15, function(p21)
		-- upvalues: p16 (ref), toLegacyMessage (copy)
		local var31 = p16[p21]
		
		return if var31 == nil then nil else toLegacyMessage(var31, p16)
	end)
	local t = {}
	local var25 = nil
	
	for i_1 = #var23, 1, -1 do
		local var26 = var23[i_1]
		local var27 = filterForLinksWithPolicyModule(var26)
		local var28 = if i_1 > 1 then var23[i_1 - 1] else nil
		local var29 = p17(var26.id)
		
		for i, v in var27 do
			local var30 = buildPopulatedMessage(v, if #var27 == 1 then var29 else nil, var25, var27[i + 1] or var28, p18, p19, p20, i)
			table.insert(t, var30)
			var25 = var30
		end
	end
	return cryoModule.List.reverse(t)
end

return {
	useMessageItemList = function(p22, p23, p24, p25)
		-- upvalues: reactModule (ref), getConversationMessageViewModelStoreModule (ref), signalsModule (ref), fFlagAppChatPerfTrackingModule (ref), fFlagAppChatMessageTTIMilestonesModule (ref), appChatPerfTrackerModule (ref), buildMessageItemList (ref), useSignalState (ref)
		local var32 = reactModule.useMemo(function()
			-- upvalues: getConversationMessageViewModelStoreModule (copy)
			return getConversationMessageViewModelStoreModule(false)
		end, {})
		local conversationMessageStore = var32.conversationMessageStore
		local conversationMessageListStore = var32.conversationMessageListStore
		local var33 = reactModule.useRef(p25)
		var33.current = p25
		local var34 = reactModule.useRef(p23)
		var34.current = p23
		
		return useSignalState(reactModule.useMemo(function()
			-- upvalues: p22 (ref), signalsModule (copy), conversationMessageListStore (ref), conversationMessageStore (ref), p24 (ref), var33 (ref), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), buildMessageItemList (copy), var32 (ref), var34 (ref)
			return if p22 == nil then signalsModule.createComputed(function()
				return {}
			end) else signalsModule.createComputed(function(p26)
				-- upvalues: conversationMessageListStore (copy), p22 (copy), conversationMessageStore (copy), p24 (copy), var33 (copy), fFlagAppChatPerfTrackingModule (copy), fFlagAppChatMessageTTIMilestonesModule (copy), appChatPerfTrackerModule (copy), buildMessageItemList (copy), var32 (copy), var34 (copy)
				local orderedIds = conversationMessageListStore.getOrderedIds(p22, p26)
				local var36 = conversationMessageStore.messages(p26)
				local var37 = tostring(p24 or "")
				
				if var33.current == nil then
					return {}
				end
				local chatConversationTTI = fFlagAppChatPerfTrackingModule and (fFlagAppChatMessageTTIMilestonesModule and appChatPerfTrackerModule.isActive(appChatPerfTrackerModule.Events.ChatConversationTTI, { conversationId = p22 }))
				
				if chatConversationTTI then
					local t = { conversationId = p22 }
					appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, t)
					appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Name, appChatPerfTrackerModule.Milestone.DataProcessingStarted.Subphase.DataUpdate, t)
				end
				local var40 = buildMessageItemList(orderedIds, var36, function(p27)
					-- upvalues: var32 (copy), p22 (copy), p26 (ref)
					return var32.getGroupedVariant(p27, p22)(p26)
				end, var33.current, var34.current, var37)
				
				if chatConversationTTI then
					local t = { conversationId = p22 }
					appChatPerfTrackerModule.trackMilestone(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, t)
					appChatPerfTrackerModule.trackSubphase(appChatPerfTrackerModule.Events.ChatConversationTTI, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Name, appChatPerfTrackerModule.Milestone.DataProcessingCompleted.Subphase.DataUpdate, t)
				end
				return var40
			end)
		end, {
			p22,
			p24,
			var32,
			conversationMessageStore,
			conversationMessageListStore
		}))
	end,
	buildMessageItemList = buildMessageItemList
}