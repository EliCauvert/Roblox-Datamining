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

local function _(p0) --[[ line: 22 | named "isInitialCursor" ]]
	return if p0 ~= nil then p0 == "" else true
end

local function upsertConversationResponse(p1, p2) --[[ line: 26 ]]
	-- upvalues: conversationChannelsModule (ref), fFlagAppChatIngestConversationMessagesModule (ref), buildValidMessagesModule (ref), ingestBatchModule (ref), ingestOperationModule (ref)
	if p2 == nil or p2.status == "failed" then return end
	if p2.source == conversationChannelsModule.Source.Channels and p2.type == conversationChannelsModule.Type.OneToOne and p2.participant_user_ids ~= nil then
		p1.removeConversation(conversationChannelsModule.getFriendConversationId(p2.participant_user_ids))
	end
	local var9 = conversationChannelsModule.fromChannelsApi(p2)
	p1.upsertConversation(var9)
	
	if fFlagAppChatIngestConversationMessagesModule then
		local var10 = buildValidMessagesModule(var9.id, p2.messages or {})
		
		if #var10 > 0 then
			ingestBatchModule(var9.id, var10, ingestOperationModule.Prepend)
		end
	end
end

return {
	beginFetch = function(p3, p4) --[[ line: 74 ]]
		-- upvalues: cryoModule (ref)
		p3.setListStatus({
			isFetchingConversations = true,
			isFetchingNextPage = not (if p4 ~= nil then p4 == "" else true),
			error = cryoModule.None
		})
	end,
	ingestSuccess = function(p5, p6, p7) --[[ line: 82 ]]
		-- upvalues: getResponseBodyModule (ref), upsertConversationResponse (ref), cryoModule (ref)
		local var11 = getResponseBodyModule(p7)
		local var12 = if var11 ~= nil then nil else var11.next_cursor
		local var13 = if var11 == nil or var11.conversations == nil then 0 else #var11.conversations
		local var14 = if var12 ~= nil then var12 == "" else true
		local listStatus = p5.getListStatus(false)
		
		if var11 ~= nil and var11.conversations ~= nil then
			for i, v in var11.conversations do
				upsertConversationResponse(p5, v)
			end
		end
		p5.setListStatus({
			isFetchingConversations = false,
			isFetchingNextPage = false,
			hasFetchedInitialPage = if if p6 ~= nil then p6 == "" else true then true else listStatus.hasFetchedInitialPage,
			oldestConversationIsFetched = var14,
			isExhausted = var14,
			nextCursor = if var14 then cryoModule.None else var12,
			error = cryoModule.None
		})
		
		return {
			cursor = p6,
			nextCursor = var12,
			conversationCount = var13,
			responseBody = var11
		}
	end,
	ingestFailure = function(p8, p9) --[[ line: 114 ]]
		p8.setListStatus({
			isFetchingConversations = false,
			isFetchingNextPage = false,
			error = p9
		})
	end,
	ingestConversationResponses = function(p10, p11) --[[ line: 61 ]]
		-- upvalues: upsertConversationResponse (ref)
		if p11 == nil or p11.conversations == nil then return end
		for i, v in p11.conversations do
			upsertConversationResponse(p10, v)
		end
	end,
	ingestConversationDetails = upsertConversationResponse
}