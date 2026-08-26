local appChat = script:FindFirstAncestor("AppChat")
local networkingChatModule = require(appChat.Http.NetworkingChat)
local promiseModule = require(appChat.Parent.Promise)
local roduxNetworkingModule = require(appChat.Http.RoduxNetworking)
local processConversationsModule = require(script.Parent.processConversations)

return function(p1, p2)
	-- upvalues: networkingChatModule (ref), roduxNetworkingModule (ref), promiseModule (ref), processConversationsModule (ref)
	return function(p3)
		-- upvalues: networkingChatModule (copy), p1 (ref), roduxNetworkingModule (copy), promiseModule (copy), p2 (ref), processConversationsModule (copy)
		return if networkingChatModule.GetUserConversations.getStatus(p3:getState(), p1) == roduxNetworkingModule.Enum.NetworkStatus.Fetching then promiseModule.resolve() else p3:dispatch(networkingChatModule.GetUserConversations.API(p1, p2)):andThen(function(p4)
			-- upvalues: p3 (ref), processConversationsModule (copy)
			p3:dispatch(processConversationsModule(p4.responseBody))
		end):catch(function(p4)
			warn("NetworkingChat failure in DEPRECATED_getLocalUserConversations, Status: " .. tostring(p4))
		end)
	end
end