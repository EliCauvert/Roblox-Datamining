local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local getOtherParticipantsModule = require(script.Parent.getOtherParticipants)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)

return function(p1, p2)
	-- upvalues: getOtherParticipantsModule (ref), getConversationStoreModule (ref), appChatNetworkingModule (ref), conversationChannelsModule (ref), signalsExperimentalModule (ref)
	local var1 = getOtherParticipantsModule(p1, p2)
	
	if #var1 == 1 then
		local var2 = getConversationStoreModule(false)
		
		return appChatNetworkingModule.http.CreateConversation(nil, "one_to_one", { var1[1] }):andThen(function(p3)
			-- upvalues: conversationChannelsModule (copy), signalsExperimentalModule (copy), var2 (ref), p1 (ref)
			local responseBody = p3 and p3.responseBody
			local var3 = responseBody and (responseBody.conversations and responseBody.conversations[1])
			
			if var3 == nil or var3.status == "failed" then
				return nil
			end
			local var4 = conversationChannelsModule.fromChannelsApi(var3)
			signalsExperimentalModule.batch(function()
				-- upvalues: var2 (copy), var4 (ref), p1 (copy)
				var2.upsertConversation(var4, false)
				var2.removeConversation(p1.id)
			end)
			
			return var4
		end)
	end
	return nil
end