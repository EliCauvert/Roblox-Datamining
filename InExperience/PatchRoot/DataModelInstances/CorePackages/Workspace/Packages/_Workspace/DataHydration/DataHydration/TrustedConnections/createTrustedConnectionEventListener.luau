local notificationService = game:GetService("NotificationService")
local playersService = game:GetService("Players")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local var1 = require(parent.RealtimeDelivery).RobloxEventReceiver.new(notificationService)
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local trustedConnectionStatusModule = require(dataHydration.TrustedConnections.Enums.TrustedConnectionStatus)
local fFlagAddFriendsPageTrustedFriendRequestSection = require(parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local t = {
	Namespace = "TrustedConnectionNotifications",
	EventTypes = {
		TrustedConnectionCreated = 1,
		TrustedConnectionDeleted = 2,
		TrustedConnectionRequestSent = 3,
		TrustedConnectionRequestAccepted = 4,
		TrustedConnectionRequestIgnored = 5
	}
}

return function(p1)
	-- upvalues: getLocalPlayerUserId (ref), playersService (ref), var1 (ref), t (ref), trustedConnectionStatusModule (ref), fFlagAddFriendsPageTrustedFriendRequestSection (ref)
	local var2 = getLocalPlayerUserId()
	local var3 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: getLocalPlayerUserId (copy), var2 (write)
		local var4 = getLocalPlayerUserId()
		
		if var4 ~= var2 then
			var2 = var4
		end
	end)
	local namespace = var1:observeEvent(t.Namespace, function(p2)
		-- upvalues: var2 (write), t (copy), p1 (ref), trustedConnectionStatusModule (copy), fFlagAddFriendsPageTrustedFriendRequestSection (copy)
		if not p2.Actor or not p2.Target or not var2 then return end
		local var4 = tostring(p2.Actor)
		local var5 = tostring(p2.Target)
		local var6 = tostring(var2)
		
		if p2.EventType == t.EventTypes.TrustedConnectionCreated then
			p1(if var4 == var6 then var5 else var4, trustedConnectionStatusModule.TrustedFriends)
		end
		if p2.EventType == t.EventTypes.TrustedConnectionDeleted then
			if var6 ~= var4 then
				p1(var4, trustedConnectionStatusModule.RequestSent)
			elseif fFlagAddFriendsPageTrustedFriendRequestSection then
				p1(var5, trustedConnectionStatusModule.RequestIgnored)
			else
				p1(var5, trustedConnectionStatusModule.RequestReceived)
			end
		end
		if p2.EventType == t.EventTypes.TrustedConnectionRequestSent then
			if var6 == var4 then
				p1(var5, trustedConnectionStatusModule.RequestSent)
				
				return
			end
			p1(var4, trustedConnectionStatusModule.RequestReceived)
		end
	end)
	
	return function()
		-- upvalues: var3 (write), namespace (ref)
		if var3 then
			var3:Disconnect()
			var3 = nil
		end
		if namespace then
			namespace:disconnect()
			var3 = nil
		end
	end
end