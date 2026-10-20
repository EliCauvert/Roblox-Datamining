local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local AppChatNetworkingModule = require(Parent.AppChatNetworking)
local ConversationChannelsModule = require(AppChat.Models.ConversationChannels)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local GetOtherParticipantsModule = require(script.Parent.getOtherParticipants)
local GetConversationStoreModule = require(AppChat.Stores.GetConversationStore)
local GetConversationSearchDataHydrationModule = require(AppChat.Stores.GetConversationSearchDataHydration)
local FFlagAppChatAnyServerSideConversationSearchModule = require(AppChat.Flags.FFlagAppChatAnyServerSideConversationSearch)

return function(p1, p2)
	-- upvalues: GetOtherParticipantsModule (copy), GetConversationStoreModule (copy), AppChatNetworkingModule (copy), ConversationChannelsModule (copy), SignalsExperimentalModule (copy), FFlagAppChatAnyServerSideConversationSearchModule (copy), GetConversationSearchDataHydrationModule (copy)
	local OtherParticipantsModule = GetOtherParticipantsModule(p1, p2)
	
	if #OtherParticipantsModule == 1 then
		local OtherParticipantsModuleEntry = OtherParticipantsModule[1]
		local ConversationStoreModule = GetConversationStoreModule(false)
		
		return AppChatNetworkingModule.http.CreateConversation(nil, "one_to_one", { OtherParticipantsModuleEntry }):andThen(function(Result)
			-- upvalues: ConversationChannelsModule (upval), SignalsExperimentalModule (upval), ConversationStoreModule (copy), p1 (copy), FFlagAppChatAnyServerSideConversationSearchModule (upval), GetConversationSearchDataHydrationModule (upval)
			local ResponseBody = Result and Result.responseBody
			local Conversation = ResponseBody and (ResponseBody.conversations and ResponseBody.conversations[1])
			
			if Conversation == nil or Conversation.status == "failed" then
				return nil
			end
			local FromChannelsApiResult = ConversationChannelsModule.fromChannelsApi(Conversation)
			SignalsExperimentalModule.batch(function()
				-- upvalues: ConversationStoreModule (upval), FromChannelsApiResult (copy), p1 (upval)
				ConversationStoreModule.upsertConversation(FromChannelsApiResult, false)
				ConversationStoreModule.removeConversation(p1.id)
			end)
			
			if FFlagAppChatAnyServerSideConversationSearchModule then
				GetConversationSearchDataHydrationModule(false).invalidate()
			end
			return FromChannelsApiResult
		end)
	else
		return nil
	end
end