local Players = game:GetService("Players")
local DataHydration = script:FindFirstAncestor("DataHydration")
local NewResult = require(DataHydration.Parent.RealtimeDelivery).RobloxEventReceiver.new((game:GetService("NotificationService")))
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local TrustedConnectionStatusModule = require(DataHydration.TrustedConnections.Enums.TrustedConnectionStatus)
local config = {
	Namespace = "TrustedConnectionNotifications",
	EventTypes = {
		TrustedConnectionCreated = 1,
		TrustedConnectionDeleted = 2,
		TrustedConnectionRequestSent = 3,
		TrustedConnectionRequestAccepted = 4,
		TrustedConnectionRequestIgnored = 5
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
	local ObserveEventResult = NewResult:observeEvent(config.Namespace, function(Mouse)
		-- upvalues: LocalPlayerUserId (ref), config (upval), Callback (copy), TrustedConnectionStatusModule (upval)
		if not Mouse.Actor or not Mouse.Target or not LocalPlayerUserId then return end
		local Text = tostring(Mouse.Actor)
		local Text1 = tostring(Mouse.Target)
		local Text2 = tostring(LocalPlayerUserId)
		
		if Mouse.EventType == config.EventTypes.TrustedConnectionCreated then
			Callback(if Text == Text2 then Text1 else Text, TrustedConnectionStatusModule.TrustedFriends)
		end
		if Mouse.EventType == config.EventTypes.TrustedConnectionDeleted then
			if Text2 == Text then
				Callback(Text1, TrustedConnectionStatusModule.RequestReceived)
			else
				Callback(Text, TrustedConnectionStatusModule.RequestSent)
			end
		end
		if Mouse.EventType == config.EventTypes.TrustedConnectionRequestSent then
			if Text2 == Text then
				Callback(Text1, TrustedConnectionStatusModule.RequestSent)
				
				return
			end
			Callback(Text, TrustedConnectionStatusModule.RequestReceived)
		end
	end)
	
	return function()
		-- upvalues: Connection (ref), ObserveEventResult (copy)
		if Connection then
			Connection:Disconnect()
			Connection = nil
		end
		if ObserveEventResult then
			ObserveEventResult:disconnect()
			Connection = nil
		end
	end
end