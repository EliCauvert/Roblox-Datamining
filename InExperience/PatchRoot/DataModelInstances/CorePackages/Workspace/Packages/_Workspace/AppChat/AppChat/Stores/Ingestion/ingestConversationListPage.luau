local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(Parent.AppChatNetworking)
local CryoModule = require(Parent.Cryo)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local _ = require(AppChat.Stores.GetConversationStore)
local GetResponseBodyModule = require(script.Parent.getResponseBody)
local BuildValidMessagesModule = require(script.Parent.buildValidMessages)
local IngestBatchModule = require(script.Parent.ingestBatch)
local IngestOperationModule = require(script.Parent.IngestOperation)
local FFlagAppChatIngestConversationMessagesModule = require(AppChat.Flags.FFlagAppChatIngestConversationMessages)
local SearchIntroducedConversationIdsModule = require(AppChat.Stores.searchIntroducedConversationIds)
local FFlagAppChatAnyServerSideConversationSearchModule = require(AppChat.Flags.FFlagAppChatAnyServerSideConversationSearch)

local function _(p1): boolean --[[ Line: 25 | Named "isInitialCursor" ]]
	return p1 == nil or p1 == ""
end

local function upsertConversationResponse(p1, p2) --[[ Line: 29 ]]
	-- upvalues: ConversationChannelsModule (copy), FFlagAppChatAnyServerSideConversationSearchModule (copy), SignalsExperimentalModule (copy), SearchIntroducedConversationIdsModule (copy), FFlagAppChatIngestConversationMessagesModule (copy), BuildValidMessagesModule (copy), IngestBatchModule (copy), IngestOperationModule (copy)
	if p2 == nil or p2.status == "failed" then return end
	if p2.source == ConversationChannelsModule.Source.Channels and p2.type == ConversationChannelsModule.Type.OneToOne and p2.participant_user_ids ~= nil then
		p1.removeConversation(ConversationChannelsModule.getFriendConversationId(p2.participant_user_ids))
	end
	local FromChannelsApiResult = ConversationChannelsModule.fromChannelsApi(p2)
	
	if FFlagAppChatAnyServerSideConversationSearchModule then
		SignalsExperimentalModule.batch(function() --[[ Line: 53 ]]
			-- upvalues: p1 (copy), FromChannelsApiResult (copy), SearchIntroducedConversationIdsModule (upval)
			p1.upsertConversation(FromChannelsApiResult)
			SearchIntroducedConversationIdsModule.remove(FromChannelsApiResult.id)
		end)
	else
		p1.upsertConversation(FromChannelsApiResult)
	end
	if FFlagAppChatIngestConversationMessagesModule then
		local ValidMessagesModule = BuildValidMessagesModule(FromChannelsApiResult.id, p2.messages or {})
		
		if #ValidMessagesModule > 0 then
			IngestBatchModule(FromChannelsApiResult.id, ValidMessagesModule, IngestOperationModule.Prepend)
		end
	end
end

return {
	beginFetch = function(p1, p2) --[[ Line: 92 ]]
		-- upvalues: CryoModule (copy)
		p1.setListStatus({
			isFetchingConversations = true,
			isFetchingNextPage = not (p2 == nil or p2 == ""),
			error = CryoModule.None
		})
	end,
	ingestSuccess = function(p1, Cursor, p2) --[[ Line: 100 ]]
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
	ingestFailure = function(p3, p4) --[[ Line: 132 ]]
		p3.setListStatus({
			isFetchingConversations = false,
			isFetchingNextPage = false,
			error = p4
		})
	end,
	ingestConversationResponses = function(p3, p4) --[[ Line: 79 ]]
		-- upvalues: upsertConversationResponse (copy)
		if p4 == nil or p4.conversations == nil then return end
		for _, conversation in p4.conversations do
			upsertConversationResponse(p3, conversation)
		end
	end,
	ingestConversationDetails = upsertConversationResponse
}