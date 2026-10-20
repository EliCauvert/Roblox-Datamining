local AppChat = script:FindFirstAncestor("AppChat")
local NetworkingChatModule = require(AppChat.Http.NetworkingChat)
local PromiseModule = require(AppChat.Parent.Promise)
local RoduxNetworkingModule = require(AppChat.Http.RoduxNetworking)
local ProcessConversationsModule = require(script.Parent.processConversations)

return function(p1, p2)
	-- upvalues: NetworkingChatModule (copy), RoduxNetworkingModule (copy), PromiseModule (copy), ProcessConversationsModule (copy)
	return function(p3)
		-- upvalues: NetworkingChatModule (upval), p1 (copy), RoduxNetworkingModule (upval), PromiseModule (upval), p2 (copy), ProcessConversationsModule (upval)
		return if NetworkingChatModule.GetUserConversations.getStatus(p3:getState(), p1) == RoduxNetworkingModule.Enum.NetworkStatus.Fetching then PromiseModule.resolve() else p3:dispatch(NetworkingChatModule.GetUserConversations.API(p1, p2)):andThen(function(Result)
			-- upvalues: p3 (copy), ProcessConversationsModule (upval)
			p3:dispatch(ProcessConversationsModule(Result.responseBody))
		end):catch(function(Err)
			warn("NetworkingChat failure in DEPRECATED_getLocalUserConversations, Status: " .. tostring(Err))
		end)
	end
end