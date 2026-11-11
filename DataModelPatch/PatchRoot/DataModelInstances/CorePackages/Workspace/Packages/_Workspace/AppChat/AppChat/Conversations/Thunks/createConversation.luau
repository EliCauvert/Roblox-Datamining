local AppChat = script:FindFirstAncestor("AppChat")
local AppChatNetworkingModule = require(AppChat.Parent.AppChatNetworking)
local _ = require(AppChat.Models.ConversationChannels)
local ParseNewConversationResponseModule = require(script.Parent.Parent.parseNewConversationResponse)

return function(p1, p2, p3, p4)
	-- upvalues: AppChatNetworkingModule (copy), ParseNewConversationResponseModule (copy)
	return function(p5)
		-- upvalues: AppChatNetworkingModule (upval), p1 (copy), p2 (copy), ParseNewConversationResponseModule (upval), p3 (copy), p4 (copy)
		return p5:dispatch(AppChatNetworkingModule.rodux.CreateConversation.API(p1, p2)):andThen(function(Result)
			-- upvalues: ParseNewConversationResponseModule (upval), p3 (upval), p4 (upval)
			return ParseNewConversationResponseModule(Result.responseBody.conversations and Result.responseBody.conversations[1], p3, p4)
		end)
	end
end