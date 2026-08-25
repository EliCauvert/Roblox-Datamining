local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local appChatNetworkingModule = require(parent.AppChatNetworking)
local conversationChannelsModule = require(appChat.Models.ConversationChannels)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local getOtherParticipantsModule = require(script.Parent.getOtherParticipants)
local getConversationStoreModule = require(appChat.Stores.GetConversationStore)

return function(p0, p1)
	-- upvalues: getOtherParticipantsModule (ref), getConversationStoreModule (ref), appChatNetworkingModule (ref), conversationChannelsModule (ref), signalsExperimentalModule (ref)
	local var6 = getOtherParticipantsModule(p0, p1)
	
	if #var6 == 1 then
		local var7 = getConversationStoreModule(false)
		
		return appChatNetworkingModule.http.CreateConversation(nil, "one_to_one", { var6[1] }):andThen(function(p2)
			-- upvalues: conversationChannelsModule (copy), signalsExperimentalModule (copy), var7 (ref), p0 (ref)
			local responseBody = p2 and p2.responseBody
			local var9 = responseBody and (responseBody.conversations and responseBody.conversations[1])
			
			if var9 == nil or var9.status == "failed" then
				return nil
			end
			local var10 = conversationChannelsModule.fromChannelsApi(var9)
			signalsExperimentalModule.batch(function()
				-- upvalues: var7 (copy), var10 (ref), p0 (copy)
				var7.upsertConversation(var10, false)
				var7.removeConversation(p0.id)
			end)
			
			return var10
		end)
	end
	return nil
end