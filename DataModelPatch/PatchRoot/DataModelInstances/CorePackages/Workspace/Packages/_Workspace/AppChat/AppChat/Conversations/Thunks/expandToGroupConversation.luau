local AppChatNetworkingModule = require(script:FindFirstAncestor("AppChat").Parent.AppChatNetworking)
local ParseNewConversationResponseModule = require(script.Parent.Parent.parseNewConversationResponse)

return function(p1, p2, p3)
	-- upvalues: AppChatNetworkingModule (copy), ParseNewConversationResponseModule (copy)
	return function(p4)
		-- upvalues: AppChatNetworkingModule (upval), p1 (copy), p2 (copy), ParseNewConversationResponseModule (upval), p3 (copy)
		return p4:dispatch(AppChatNetworkingModule.rodux.ExpandToGroupConversation.API(p1, p2)):andThen(function(Result)
			-- upvalues: ParseNewConversationResponseModule (upval), p3 (upval)
			return ParseNewConversationResponseModule(Result.responseBody.new_conversation, p3, "userExpandedToGroupConversation")
		end)
	end
end