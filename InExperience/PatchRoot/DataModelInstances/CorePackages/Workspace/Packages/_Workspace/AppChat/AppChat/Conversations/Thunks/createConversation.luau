local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local _ = require(appChat.Models.ConversationChannels)
local parseNewConversationResponseModule = require(script.Parent.Parent.parseNewConversationResponse)

return function(p1, p2, p3, p4)
	-- upvalues: appChatNetworkingModule (ref), parseNewConversationResponseModule (ref)
	return function(p5)
		-- upvalues: appChatNetworkingModule (copy), p1 (ref), p2 (ref), parseNewConversationResponseModule (copy), p3 (ref), p4 (ref)
		return p5:dispatch(appChatNetworkingModule.rodux.CreateConversation.API(p1, p2)):andThen(function(p6)
			-- upvalues: parseNewConversationResponseModule (copy), p3 (copy), p4 (copy)
			return parseNewConversationResponseModule(p6.responseBody.conversations and p6.responseBody.conversations[1], p3, p4)
		end)
	end
end