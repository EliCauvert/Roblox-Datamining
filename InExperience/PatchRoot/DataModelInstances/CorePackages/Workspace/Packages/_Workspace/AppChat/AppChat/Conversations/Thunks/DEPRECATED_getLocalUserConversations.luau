local AppChat = script:FindFirstAncestor("AppChat")
local NetworkingChatModule = require(AppChat.Http.NetworkingChat)
local PromiseModule = require(AppChat.Parent.Promise)
local RoduxNetworkingModule = require(AppChat.Http.RoduxNetworking)
local ProcessConversationsModule = require(script.Parent.processConversations)

return function(p1, p2) --[[ Line: 10 ]]
	-- upvalues: NetworkingChatModule (copy), RoduxNetworkingModule (copy), PromiseModule (copy), ProcessConversationsModule (copy)
	return function(p3) --[[ Line: 11 ]]
		-- upvalues: NetworkingChatModule (upval), p1 (copy), RoduxNetworkingModule (upval), PromiseModule (upval), p2 (copy), ProcessConversationsModule (upval)
		return if NetworkingChatModule.GetUserConversations.getStatus(p3:getState(), p1) == RoduxNetworkingModule.Enum.NetworkStatus.Fetching then PromiseModule.resolve() else p3:dispatch(NetworkingChatModule.GetUserConversations.API(p1, p2)):andThen(function(Result) --[[ Line: 20 ]]
			-- upvalues: p3 (copy), ProcessConversationsModule (upval)
			p3:dispatch(ProcessConversationsModule(Result.responseBody))
		end):catch(function(Err) --[[ Line: 25 ]]
			warn("NetworkingChat failure in DEPRECATED_getLocalUserConversations, Status: " .. tostring(Err))
		end)
	end
end