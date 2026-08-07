local appChat = script:FindFirstAncestor("AppChat")
local appChatNetworkingModule = require(appChat.Parent.AppChatNetworking)
local _ = require(appChat.Models.ConversationChannels)
local parseNewConversationResponseModule = require(script.Parent.Parent.parseNewConversationResponse)

return function(p0, p1, p2, p3) --[[ line: 16 ]]
	-- upvalues: appChatNetworkingModule (ref), parseNewConversationResponseModule (ref)
	return function(p4) --[[ line: 22 ]]
		-- upvalues: appChatNetworkingModule (copy), p0 (ref), p1 (ref), parseNewConversationResponseModule (copy), p2 (ref), p3 (ref)
		return p4:dispatch(appChatNetworkingModule.rodux.CreateConversation.API(p0, p1)):andThen(function(p5) --[[ line: 25 ]]
			-- upvalues: parseNewConversationResponseModule (copy), p2 (copy), p3 (copy)
			return parseNewConversationResponseModule(p5.responseBody.conversations and p5.responseBody.conversations[1], p2, p3)
		end)
	end
end