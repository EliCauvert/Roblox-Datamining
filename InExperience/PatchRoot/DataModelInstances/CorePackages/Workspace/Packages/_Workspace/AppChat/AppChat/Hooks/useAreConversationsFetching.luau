local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local roduxNetworkingModule = require(appChat.Http.RoduxNetworking)
local appChatNetworkingModule = require(parent.AppChatNetworking)

return function()
	-- upvalues: useSelector (ref), appChatNetworkingModule (ref), roduxNetworkingModule (ref)
	return useSelector(function(p1)
		-- upvalues: appChatNetworkingModule (copy), roduxNetworkingModule (copy)
		return appChatNetworkingModule.rodux.GetUserConversations.getStatus(p1, 1) == roduxNetworkingModule.Enum.NetworkStatus.Fetching
	end)
end