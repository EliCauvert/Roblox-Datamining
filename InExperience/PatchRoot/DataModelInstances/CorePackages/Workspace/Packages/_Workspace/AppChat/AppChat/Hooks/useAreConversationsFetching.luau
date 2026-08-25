local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local roduxNetworkingModule = require(appChat.Http.RoduxNetworking)
local appChatNetworkingModule = require(parent.AppChatNetworking)

return function()
	-- upvalues: useSelector (ref), appChatNetworkingModule (ref), roduxNetworkingModule (ref)
	return useSelector(function(p0)
		-- upvalues: appChatNetworkingModule (copy), roduxNetworkingModule (copy)
		return appChatNetworkingModule.rodux.GetUserConversations.getStatus(p0, 1) == roduxNetworkingModule.Enum.NetworkStatus.Fetching
	end)
end