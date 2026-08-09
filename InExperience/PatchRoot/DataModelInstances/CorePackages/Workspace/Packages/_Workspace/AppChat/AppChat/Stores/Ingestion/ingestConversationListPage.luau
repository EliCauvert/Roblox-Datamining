local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(parent.AppChatNetworking)
local cryoModule = require(parent.Cryo)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local _ = require(appChat.Stores.GetConversationStore)
local getResponseBodyModule = require(script.Parent.getResponseBody)

local function _(p0) --[[ line: 18 | named "isInitialCursor" ]]
	return if p0 ~= nil then p0 == "" else true
end

local function upsertConversationResponse(p1, p2) --[[ line: 22 ]]
	-- upvalues: conversationChannelsModule (ref)
	if p2 == nil or p2.status == "failed" then return end
	if p2.source == conversationChannelsModule.Source.Channels and p2.type == conversationChannelsModule.Type.OneToOne and p2.participant_user_ids ~= nil then
		p1.removeConversation(conversationChannelsModule.getFriendConversationId(p2.participant_user_ids))
	end
	p1.upsertConversation(conversationChannelsModule.fromChannelsApi(p2))
end

return {
	beginFetch = function(p3, p4) --[[ line: 56 ]]
		-- upvalues: cryoModule (ref)
		p3.setListStatus({
			isFetchingConversations = true,
			isFetchingNextPage = not (if p4 ~= nil then p4 == "" else true),
			error = cryoModule.None
		})
	end,
	ingestSuccess = function(p5, p6, p7) --[[ line: 64 ]]
		-- upvalues: getResponseBodyModule (ref), upsertConversationResponse (ref), cryoModule (ref)
		local var5 = getResponseBodyModule(p7)
		local var6 = if var5 ~= nil then nil else var5.next_cursor
		local var7 = if var5 == nil or var5.conversations == nil then -1 else #var5.conversations
		local var8 = if var6 ~= nil then var6 == "" else true
		local listStatus = p5.getListStatus(false)
		
		if var5 ~= nil and var5.conversations ~= nil then
			for i, v in var5.conversations do
				upsertConversationResponse(p5, v)
			end
		end
		p5.setListStatus({
			isFetchingConversations = false,
			isFetchingNextPage = false,
			hasFetchedInitialPage = if if p6 ~= nil then p6 == "" else true then true else listStatus.hasFetchedInitialPage,
			oldestConversationIsFetched = var8,
			isExhausted = var8,
			nextCursor = if var8 then cryoModule.None else var6,
			error = cryoModule.None
		})
		
		return {
			cursor = p6,
			nextCursor = var6,
			conversationCount = var7,
			responseBody = var5
		}
	end,
	ingestFailure = function(p8, p9) --[[ line: 96 ]]
		p8.setListStatus({
			isFetchingConversations = false,
			isFetchingNextPage = false,
			error = p9
		})
	end,
	ingestConversationResponses = function(p10, p11) --[[ line: 43 ]]
		-- upvalues: upsertConversationResponse (ref)
		if p11 == nil or p11.conversations == nil then return end
		for i, v in p11.conversations do
			upsertConversationResponse(p10, v)
		end
	end,
	ingestConversationDetails = upsertConversationResponse
}