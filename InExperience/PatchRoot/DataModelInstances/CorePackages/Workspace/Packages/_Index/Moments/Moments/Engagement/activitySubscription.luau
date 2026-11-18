local Parent = script:FindFirstAncestor("Moments").Parent
local NotificationService = game:GetService("NotificationService")
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local Signal, Signal2 = require(Parent.Signals).createSignal(false)
local List = nil
local config = {
	onActivityPing = function() end,
	onReconnected = function() end
}
local v1 = nil

local function onActivityEvent(p1)
	-- upvalues: Signal2 (copy), config (ref)
	if type(p1) ~= "table" then return end
	if p1.type == "ActivityPending" and p1.surface == "moments" then
		Signal2(true)
		config.onActivityPing()
		
		return
	end
end

local function onConnectionChanged(ConnectionState)
	-- upvalues: v1 (ref), config (ref)
	local ConnectionState1 = v1
	v1 = ConnectionState
	
	if ConnectionState == Enum.ConnectionState.Connected and ConnectionState1 ~= nil and ConnectionState1 ~= Enum.ConnectionState.Connected then
		config.onReconnected()
	end
end

return {
	subscribe = function(p1, p2)
		-- upvalues: List (ref), config (ref), v1 (ref), RealtimeDeliveryModule (copy), NotificationService (copy), onActivityEvent (copy), onConnectionChanged (copy)
		if List == nil then
			config = p1 or {
				onActivityPing = function() end,
				onReconnected = function() end
			}
			v1 = nil
			local P3 = p2 or RealtimeDeliveryModule.RobloxEventReceiver.new(NotificationService)
			List = {
				P3:observeEvent("EngagementActivityV1", onActivityEvent),
				P3:observeEvent("signalR", onConnectionChanged)
			}
			
			return
		end
	end,
	unsubscribe = function()
		-- upvalues: List (ref)
		if List ~= nil then
			for _, value in List do
				value:disconnect()
			end
			List = nil
		end
	end,
	getIsActivityPending = Signal,
	clearPendingActivity = function()
		-- upvalues: Signal2 (copy)
		Signal2(false)
	end
}