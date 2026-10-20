local Players = game:GetService("Players")
local DataHydration = script:FindFirstAncestor("DataHydration")
local NewResult = require(DataHydration.Parent.RealtimeDelivery).RobloxEventReceiver.new((game:GetService("NotificationService")))
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local TrustedConnectionStatusModule = require(DataHydration.TrustedConnections.Enums.TrustedConnectionStatus)
local config = {
	Namespace = "FriendshipNotifications",
	EventTypes = {
		FriendshipCreated = "FriendshipCreated",
		FriendshipDestroyed = "FriendshipDestroyed",
		FriendshipRequested = "FriendshipRequested",
		FriendshipDeclined = "FriendshipDeclined"
	}
}

return function(Callback)
	-- upvalues: GetLocalPlayerUserIdFunction (copy), Players (copy), NewResult (copy), config (copy), TrustedConnectionStatusModule (copy)
	local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
	local Connection = Players:GetPropertyChangedSignal("LocalPlayer"):Connect(function()
		-- upvalues: GetLocalPlayerUserIdFunction (upval), LocalPlayerUserId (ref)
		local LocalPlayerUserId1 = GetLocalPlayerUserIdFunction()
		
		if LocalPlayerUserId1 ~= LocalPlayerUserId then
			LocalPlayerUserId = LocalPlayerUserId1
		end
	end)
	local ObserveEventResult = NewResult:observeEvent(config.Namespace, function(p1)
		-- upvalues: LocalPlayerUserId (ref), config (upval), Callback (copy), TrustedConnectionStatusModule (upval)
		if not p1.EventArgs or not p1.EventArgs.UserId1 or not p1.EventArgs.UserId2 or not LocalPlayerUserId then return end
		local Text: string = tostring(LocalPlayerUserId) == tostring(p1.EventArgs.UserId1) and tostring(p1.EventArgs.UserId2) or tostring(p1.EventArgs.UserId1)
		
		if p1.Type == config.EventTypes.FriendshipDestroyed or p1.Type == config.EventTypes.FriendshipDeclined then
			Callback(Text, TrustedConnectionStatusModule.NotFriends)
		end
	end)
	
	return function()
		-- upvalues: Connection (ref), ObserveEventResult (ref)
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
		if ObserveEventResult then
			ObserveEventResult:disconnect()
			ObserveEventResult = nil
		end
	end
end