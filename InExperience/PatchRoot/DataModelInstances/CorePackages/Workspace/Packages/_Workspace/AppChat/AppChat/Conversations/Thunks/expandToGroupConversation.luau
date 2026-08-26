local appChatNetworkingModule = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking)
local parseNewConversationResponseModule = require(script.Parent.Parent.parseNewConversationResponse)

return function(p1, p2, p3)
	-- upvalues: appChatNetworkingModule (ref), parseNewConversationResponseModule (ref)
	return function(p4)
		-- upvalues: appChatNetworkingModule (copy), p1 (ref), p2 (ref), parseNewConversationResponseModule (copy), p3 (ref)
		return p4:dispatch(appChatNetworkingModule.rodux.ExpandToGroupConversation.API(p1, p2)):andThen(function(p5)
			-- upvalues: parseNewConversationResponseModule (copy), p3 (copy)
			return parseNewConversationResponseModule(p5.responseBody.new_conversation, p3, "userExpandedToGroupConversation")
		end)
	end
end