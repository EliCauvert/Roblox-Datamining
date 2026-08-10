local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(parent.AppChatNetworking)
local cryoModule = require(parent.Cryo)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local _ = require(appChat.Stores.GetConversationStore)
local getResponseBodyModule = require(script.Parent.getResponseBody)
local buildConversationMessageFromApiModule = require(script.Parent.buildConversationMessageFromApi)
local ingestBatchModule = require(script.Parent.ingestBatch)
local ingestOperationModule = require(script.Parent.IngestOperation)
local fFlagAppChatIngestPreviewMessageModule = require(appChat.Flags.FFlagAppChatIngestPreviewMessage)

local function _(p0) --[[ line: 22 | named "isInitialCursor" ]]
	return if p0 ~= nil then p0 == "" else true
end

local function upsertConversationResponse(p1, p2) --[[ line: 26 ]]
	-- upvalues: conversationChannelsModule (ref), fFlagAppChatIngestPreviewMessageModule (ref), ingestBatchModule (ref), buildConversationMessageFromApiModule (ref), ingestOperationModule (ref)
	if p2 == nil or p2.status == "failed" then return end
	if p2.source == conversationChannelsModule.Source.Channels and p2.type == conversationChannelsModule.Type.OneToOne and p2.participant_user_ids ~= nil then
		p1.removeConversation(conversationChannelsModule.getFriendConversationId(p2.participant_user_ids))
	end
	local var9 = conversationChannelsModule.fromChannelsApi(p2)
	p1.upsertConversation(var9)
	
	if fFlagAppChatIngestPreviewMessageModule then
		local previewMessage = p2.preview_message
		
		if previewMessage ~= nil and var9.previewMessageId ~= nil then
			ingestBatchModule(var9.id, {
				buildConversationMessageFromApiModule(previewMessage, var9.id)
			}, ingestOperationModule.Prepend)
		end
	end
end

return {
	beginFetch = function(p3, p4) --[[ line: 79 ]]
		-- upvalues: cryoModule (ref)
		p3.setListStatus({
			isFetchingConversations = true,
			isFetchingNextPage = not (if p4 ~= nil then p4 == "" else true),
			error = cryoModule.None
		})
	end,
	ingestSuccess = function(p5, p6, p7) --[[ line: 87 ]]
		-- upvalues: getResponseBodyModule (ref), upsertConversationResponse (ref), cryoModule (ref)
		local var10 = getResponseBodyModule(p7)
		local var11 = if var10 ~= nil then nil else var10.next_cursor
		local var12 = if var10 == nil or var10.conversations == nil then 0 else #var10.conversations
		local var13 = if var11 ~= nil then var11 == "" else true
		local listStatus = p5.getListStatus(false)
		
		if var10 ~= nil and var10.conversations ~= nil then
			for i, v in var10.conversations do
				upsertConversationResponse(p5, v)
			end
		end
		p5.setListStatus({
			isFetchingConversations = false,
			isFetchingNextPage = false,
			hasFetchedInitialPage = if if p6 ~= nil then p6 == "" else true then true else listStatus.hasFetchedInitialPage,
			oldestConversationIsFetched = var13,
			isExhausted = var13,
			nextCursor = if var13 then cryoModule.None else var11,
			error = cryoModule.None
		})
		
		return {
			cursor = p6,
			nextCursor = var11,
			conversationCount = var12,
			responseBody = var10
		}
	end,
	ingestFailure = function(p8, p9) --[[ line: 119 ]]
		p8.setListStatus({
			isFetchingConversations = false,
			isFetchingNextPage = false,
			error = p9
		})
	end,
	ingestConversationResponses = function(p10, p11) --[[ line: 66 ]]
		-- upvalues: upsertConversationResponse (ref)
		if p11 == nil or p11.conversations == nil then return end
		for i, v in p11.conversations do
			upsertConversationResponse(p10, v)
		end
	end,
	ingestConversationDetails = upsertConversationResponse
}