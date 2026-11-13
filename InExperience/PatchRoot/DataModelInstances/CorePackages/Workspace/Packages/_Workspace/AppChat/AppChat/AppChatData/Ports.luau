local NotificationService = game:GetService("NotificationService")
local RobloxEventReceiver = require(script:FindFirstAncestor("AppChat").Parent.RealtimeDelivery).RobloxEventReceiver

return {
	current = {
		http = require(script.createHttpPort)(nil),
		realtime = require(script.createRealtimePort)(function()
			-- upvalues: RobloxEventReceiver (copy), NotificationService (copy)
			return RobloxEventReceiver.new(NotificationService)
		end)
	}
}