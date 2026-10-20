local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local RoduxNetworkingModule = require(AppChat.Http.RoduxNetworking)
local AppChatNetworkingModule = require(Parent.AppChatNetworking)

return function()
	-- upvalues: UseSelectorFunction (copy), AppChatNetworkingModule (copy), RoduxNetworkingModule (copy)
	return UseSelectorFunction(function(p1): boolean
		-- upvalues: AppChatNetworkingModule (upval), RoduxNetworkingModule (upval)
		return AppChatNetworkingModule.rodux.GetUserConversations.getStatus(p1, 1) == RoduxNetworkingModule.Enum.NetworkStatus.Fetching
	end)
end