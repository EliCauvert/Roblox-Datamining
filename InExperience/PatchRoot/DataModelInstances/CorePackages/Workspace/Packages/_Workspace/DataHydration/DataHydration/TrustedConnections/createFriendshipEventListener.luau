local notificationService = game:GetService("NotificationService")
local playersService = game:GetService("Players")
local dataHydration = script:FindFirstAncestor("DataHydration")
local var3 = require(dataHydration.Parent.RealtimeDelivery).RobloxEventReceiver.new(notificationService)
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

return function(p0)
	-- upvalues: getLocalPlayerUserId (ref), playersService (ref), var3 (ref), t (ref), trustedConnectionStatusModule (ref)
	local var6 = getLocalPlayerUserId()
	local var7 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: getLocalPlayerUserId (copy), var6 (write)
		local var9 = getLocalPlayerUserId()
		
		if var9 ~= var6 then
			var6 = var9
		end
	end)
	local namespace = var3:observeEvent(t.Namespace, function(p1)
		-- upvalues: var6 (write), t (copy), p0 (ref), trustedConnectionStatusModule (copy)
		if not p1.EventArgs or not p1.EventArgs.UserId1 or (not p1.EventArgs.UserId2 or not var6) then return end
		local userId2 = tostring(var6) == tostring(p1.EventArgs.UserId1) and tostring(p1.EventArgs.UserId2) or tostring(p1.EventArgs.UserId1)
		
		if p1.Type == t.EventTypes.FriendshipDestroyed or p1.Type == t.EventTypes.FriendshipDeclined then
			p0(userId2, trustedConnectionStatusModule.NotFriends)
		end
	end)
	
	return function()
		-- upvalues: var7 (write), namespace (write)
		if var7 then
			var7:Disconnect()
			var7 = nil
		end
		if namespace then
			namespace:disconnect()
			namespace = nil
		end
	end
end