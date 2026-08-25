local appChat = script:FindFirstAncestor("AppChat")
local networkingChatModule = require(appChat.Http.NetworkingChat)
local promiseModule = require(appChat.Parent.Promise)
local roduxNetworkingModule = require(appChat.Http.RoduxNetworking)
local processConversationsModule = require(script.Parent.processConversations)

return function(p0, p1)
	-- upvalues: networkingChatModule (ref), roduxNetworkingModule (ref), promiseModule (ref), processConversationsModule (ref)
	return function(p2)
		-- upvalues: networkingChatModule (copy), p0 (ref), roduxNetworkingModule (copy), promiseModule (copy), p1 (ref), processConversationsModule (copy)
		return if networkingChatModule.GetUserConversations.getStatus(p2:getState(), p0) == roduxNetworkingModule.Enum.NetworkStatus.Fetching then promiseModule.resolve() else p2:dispatch(networkingChatModule.GetUserConversations.API(p0, p1)):andThen(function(p4)
			-- upvalues: p2 (ref), processConversationsModule (copy)
			p2:dispatch(processConversationsModule(p4.responseBody))
		end):catch(function(p3)
			warn("NetworkingChat failure in DEPRECATED_getLocalUserConversations, Status: " .. tostring(p3))
		end)
	end
end