local notificationService = game:GetService("NotificationService")
local playersService = game:GetService("Players")
local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local var3 = require(parent.RealtimeDelivery).RobloxEventReceiver.new(notificationService)
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

return function(p0) --[[ line: 40 | named "createTrustedConnectionEventListener" ]]
	-- upvalues: getLocalPlayerUserId (ref), playersService (ref), var3 (ref), t (ref), trustedConnectionStatusModule (ref), fFlagAddFriendsPageTrustedFriendRequestSection (ref)
	local var6 = getLocalPlayerUserId()
	local var7 = playersService:GetPropertyChangedSignal("LocalPlayer"):Connect(function() --[[ line: 48 ]]
		-- upvalues: getLocalPlayerUserId (copy), var6 (write)
		local var9 = getLocalPlayerUserId()
		
		if var9 ~= var6 then
			var6 = var9
		end
	end)
	local namespace = var3:observeEvent(t.Namespace, function(p1) --[[ line: 57 ]]
		-- upvalues: var6 (write), t (copy), p0 (ref), trustedConnectionStatusModule (copy), fFlagAddFriendsPageTrustedFriendRequestSection (copy)
		if not p1.Actor or not p1.Target or not var6 then return end
		local var10 = tostring(p1.Actor)
		local var11 = tostring(p1.Target)
		local var12 = tostring(var6)
		
		if p1.EventType == t.EventTypes.TrustedConnectionCreated then
			p0(if var10 == var12 then var11 else var10, trustedConnectionStatusModule.TrustedFriends)
		end
		if p1.EventType == t.EventTypes.TrustedConnectionDeleted then
			if var12 ~= var10 then
				p0(var10, trustedConnectionStatusModule.RequestSent)
			elseif fFlagAddFriendsPageTrustedFriendRequestSection then
				p0(var11, trustedConnectionStatusModule.RequestIgnored)
			else
				p0(var11, trustedConnectionStatusModule.RequestReceived)
			end
		end
		if p1.EventType == t.EventTypes.TrustedConnectionRequestSent then
			if var12 == var10 then
				p0(var11, trustedConnectionStatusModule.RequestSent)
				
				return
			end
			p0(var10, trustedConnectionStatusModule.RequestReceived)
		end
	end)
	
	return function() --[[ line: 93 ]]
		-- upvalues: var7 (write), namespace (ref)
		if var7 then
			var7:Disconnect()
			var7 = nil
		end
		if namespace then
			namespace:disconnect()
			var7 = nil
		end
	end
end