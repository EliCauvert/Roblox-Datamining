local Parent = script:FindFirstAncestor("Moments").Parent
local NotificationService = game:GetService("NotificationService")
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local Signal, Signal2 = require(Parent.Signals).createSignal(false)
local EngagementActivityV1 = nil

local function v6() end

local function onActivityEvent(p1)
	-- upvalues: Signal2 (copy), v6 (ref)
	if type(p1) ~= "table" then return end
	if p1.type == "ActivityPending" and p1.surface == "moments" then
		Signal2(true)
		v6()
		
		return
	end
end

return {
	subscribe = function(p1, p2)
		-- upvalues: EngagementActivityV1 (ref), v6 (ref), RealtimeDeliveryModule (copy), NotificationService (copy), onActivityEvent (copy)
		if EngagementActivityV1 == nil then
			v6 = p1 or function() end
			EngagementActivityV1 = (p2 or RealtimeDeliveryModule.RobloxEventReceiver.new(NotificationService)):observeEvent("EngagementActivityV1", onActivityEvent)
			
			return
		end
	end,
	unsubscribe = function()
		-- upvalues: EngagementActivityV1 (ref)
		if EngagementActivityV1 ~= nil then
			EngagementActivityV1:disconnect()
			EngagementActivityV1 = nil
		end
	end,
	getIsActivityPending = Signal,
	clearPendingActivity = function()
		-- upvalues: Signal2 (copy)
		Signal2(false)
	end
}