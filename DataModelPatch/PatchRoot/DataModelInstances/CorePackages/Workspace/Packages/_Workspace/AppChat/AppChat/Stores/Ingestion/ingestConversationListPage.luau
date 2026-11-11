local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.AppChatNetworking)
local CryoModule = require(Parent.Cryo)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local _ = require(AppChat.Stores.GetConversationStore)
local GetResponseBodyModule = require(script.Parent.getResponseBody)

local function _(p1): boolean
	return p1 == nil or p1 == ""
end

local function upsertConversationResponse(p1, p2)
	-- upvalues: ConversationChannelsModule (copy)
	if p2 == nil or p2.status == "failed" then return end
	if p2.source == ConversationChannelsModule.Source.Channels and p2.type == ConversationChannelsModule.Type.OneToOne and p2.participant_user_ids ~= nil then
		p1.removeConversation(ConversationChannelsModule.getFriendConversationId(p2.participant_user_ids))
	end
	p1.upsertConversation(ConversationChannelsModule.fromChannelsApi(p2))
end

return {
	beginFetch = function(p1, p2)
		-- upvalues: CryoModule (copy)
		p1.setListStatus({
			isFetchingConversations = true,
			isFetchingNextPage = not (p2 == nil or p2 == ""),
			error = CryoModule.None
		})
	end,
	ingestSuccess = function(p1, Cursor, p2)
		-- upvalues: GetResponseBodyModule (copy), upsertConversationResponse (copy), CryoModule (copy)
		local ResponseBodyModule = GetResponseBodyModule(p2)
		local NextCursor = if ResponseBodyModule == nil then nil else ResponseBodyModule.next_cursor
		local CountConversations: number = if ResponseBodyModule == nil or ResponseBodyModule.conversations == nil then 0 else #ResponseBodyModule.conversations
		local NoNextCursor: boolean = NextCursor == nil or NextCursor == ""
		local ListStatus = p1.getListStatus(false)
		
		if ResponseBodyModule ~= nil and ResponseBodyModule.conversations ~= nil then
			for _, conversation in ResponseBodyModule.conversations do
				upsertConversationResponse(p1, conversation)
			end
		end
		local config = {
			isFetchingConversations = false,
			isFetchingNextPage = false,
			hasFetchedInitialPage = if NoCursor then true else ListStatus.hasFetchedInitialPage,
			oldestConversationIsFetched = NoNextCursor,
			isExhausted = NoNextCursor,
			nextCursor = if NoNextCursor then CryoModule.None else NextCursor,
			error = CryoModule.None
		}
		local NoCursor: boolean = Cursor == nil or Cursor == ""
		p1.setListStatus(config)
		
		return {
			cursor = Cursor,
			nextCursor = NextCursor,
			conversationCount = CountConversations,
			responseBody = ResponseBodyModule
		}
	end,
	ingestFailure = function(p3, p4)
		p3.setListStatus({
			isFetchingConversations = false,
			isFetchingNextPage = false,
			error = p4
		})
	end,
	ingestConversationResponses = function(p3, p4)
		-- upvalues: upsertConversationResponse (copy)
		if p4 == nil or p4.conversations == nil then return end
		for _, conversation in p4.conversations do
			upsertConversationResponse(p3, conversation)
		end
	end,
	ingestConversationDetails = upsertConversationResponse
}