local notificationService = game:GetService("NotificationService")
local playersService = game:GetService("Players")
local dataHydration = script:FindFirstAncestor("DataHydration")
local var1 = require(dataHydration.Parent.RealtimeDelivery).RobloxEventReceiver.new(notificationService)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local trustedConnectionStatusModule = require(dataHydration.TrustedConnections.Enums.TrustedConnectionStatus)
local t = {
	Namespace = "FriendshipNotifications",
	EventTypes = {
		FriendshipCreated = "FriendshipCreated",
		FriendshipDestroyed = "FriendshipDestroyed",
		FriendshipRequested = "FriendshipRequested",
		FriendshipDeclined = "FriendshipDeclined"
	}
}

return function(p1)
	-- upvalues: getLocalPlayerUserId (ref), playersService (ref), var1 (ref), t (ref), trustedConnectionStatusModule (ref)
	local var2 = getLocalPlayerUserId()
	local var3 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: getLocalPlayerUserId (copy), var2 (write)
		local var4 = getLocalPlayerUserId()
		
		if var4 ~= var2 then
			var2 = var4
		end
	end)
	local namespace = var1:observeEvent(t.Namespace, function(p2)
		-- upvalues: var2 (write), t (copy), p1 (ref), trustedConnectionStatusModule (copy)
		if not p2.EventArgs or not p2.EventArgs.UserId1 or (not p2.EventArgs.UserId2 or not var2) then return end
		local userId2 = tostring(var2) == tostring(p2.EventArgs.UserId1) and tostring(p2.EventArgs.UserId2) or tostring(p2.EventArgs.UserId1)
		
		if p2.Type == t.EventTypes.FriendshipDestroyed or p2.Type == t.EventTypes.FriendshipDeclined then
			p1(userId2, trustedConnectionStatusModule.NotFriends)
		end
	end)
	
	return function()
		-- upvalues: var3 (write), namespace (write)
		if var3 then
			var3:Disconnect()
			var3 = nil
		end
		if namespace then
			namespace:disconnect()
			namespace = nil
		end
	end
end