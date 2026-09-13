local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(parent.AppChatNetworking)
local cryoModule = require(parent.Cryo)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local _ = require(appChat.Stores.GetConversationStore)
local getResponseBodyModule = require(script.Parent.getResponseBody)
local buildValidMessagesModule = require(script.Parent.buildValidMessages)
local ingestBatchModule = require(script.Parent.ingestBatch)
local ingestOperationModule = require(script.Parent.IngestOperation)
local fFlagAppChatIngestConversationMessagesModule = require(appChat.Flags.FFlagAppChatIngestConversationMessages)

local function _(p1)
	return if p1 ~= nil then p1 == "" else true
end

local function upsertConversationResponse(p1, p2)
	-- upvalues: conversationChannelsModule (ref), fFlagAppChatIngestConversationMessagesModule (ref), buildValidMessagesModule (ref), ingestBatchModule (ref), ingestOperationModule (ref)
	if p2 == nil or p2.status == "failed" then return end
	if p2.source == conversationChannelsModule.Source.Channels and p2.type == conversationChannelsModule.Type.OneToOne and p2.participant_user_ids ~= nil then
		p1.removeConversation(conversationChannelsModule.getFriendConversationId(p2.participant_user_ids))
	end
	local var1 = conversationChannelsModule.fromChannelsApi(p2)
	p1.upsertConversation(var1)
	
	if fFlagAppChatIngestConversationMessagesModule then
		local var2 = buildValidMessagesModule(var1.id, p2.messages or {})
		
		if #var2 > 0 then
			ingestBatchModule(var1.id, var2, ingestOperationModule.Prepend)
		end
	end
end

return {
	beginFetch = function(p1, p2)
		-- upvalues: cryoModule (ref)
		p1.setListStatus({
			isFetchingConversations = true,
			isFetchingNextPage = not (if p2 ~= nil then p2 == "" else true),
			error = cryoModule.None
		})
	end,
	ingestSuccess = function(p1, p2, p3)
		-- upvalues: getResponseBodyModule (ref), upsertConversationResponse (ref), cryoModule (ref)
		local var1 = getResponseBodyModule(p3)
		local var2 = if var1 ~= nil then nil else var1.next_cursor
		local var3 = if var1 == nil or var1.conversations == nil then 0 else #var1.conversations
		local var4 = if var2 ~= nil then var2 == "" else true
		local listStatus = p1.getListStatus(false)
		
		if var1 ~= nil and var1.conversations ~= nil then
			for i, v in var1.conversations do
				upsertConversationResponse(p1, v)
			end
		end
		p1.setListStatus({
			isFetchingConversations = false,
			isFetchingNextPage = false,
			hasFetchedInitialPage = if if p2 ~= nil then p2 == "" else true then true else listStatus.hasFetchedInitialPage,
			oldestConversationIsFetched = var4,
			isExhausted = var4,
			nextCursor = if var4 then cryoModule.None else var2,
			error = cryoModule.None
		})
		
		return {
			cursor = p2,
			nextCursor = var2,
			conversationCount = var3,
			responseBody = var1
		}
	end,
	ingestFailure = function(p4, p5)
		p4.setListStatus({
			isFetchingConversations = false,
			isFetchingNextPage = false,
			error = p5
		})
	end,
	ingestConversationResponses = function(p4, p5)
		-- upvalues: upsertConversationResponse (ref)
		if p5 == nil or p5.conversations == nil then return end
		for i, v in p5.conversations do
			upsertConversationResponse(p4, v)
		end
	end,
	ingestConversationDetails = upsertConversationResponse
}