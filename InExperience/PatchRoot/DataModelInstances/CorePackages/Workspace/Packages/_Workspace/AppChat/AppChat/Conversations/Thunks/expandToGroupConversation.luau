local appChatNetworkingModule = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking)
local parseNewConversationResponseModule = require(script.Parent.Parent.parseNewConversationResponse)

return function(p0, p1, p2) --[[ line: 7 ]]
	-- upvalues: appChatNetworkingModule (ref), parseNewConversationResponseModule (ref)
	return function(p3) --[[ line: 8 ]]
		-- upvalues: appChatNetworkingModule (copy), p0 (ref), p1 (ref), parseNewConversationResponseModule (copy), p2 (ref)
		return p3:dispatch(appChatNetworkingModule.rodux.ExpandToGroupConversation.API(p0, p1)):andThen(function(p4) --[[ line: 11 ]]
			-- upvalues: parseNewConversationResponseModule (copy), p2 (copy)
			return parseNewConversationResponseModule(p4.responseBody.new_conversation, p2, "userExpandedToGroupConversation")
		end)
	end
end