local FriendsCallingService = game:GetService("FriendsCallingService")
local CreateFriendsCallingStoreModule = require(script.createFriendsCallingStore)

return require(script:FindFirstAncestor("FriendsCalling").Parent.Signals).createComputed(function()
	-- upvalues: CreateFriendsCallingStoreModule (copy), FriendsCallingService (copy)
	return CreateFriendsCallingStoreModule(FriendsCallingService)
end)