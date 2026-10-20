local SignalsModule = require(script:FindFirstAncestor("StreamNotifications").Parent.Signals)
local Signal, Signal2 = SignalsModule.createSignal(false)
local Signal1, Signal2_1 = SignalsModule.createSignal(nil)

return {
	PrimaryBellId = "StreamNotificationPrimaryBell",
	setStreamPresented = Signal2,
	getStreamPresented = Signal,
	getActiveBellId = Signal1,
	setActiveBellId = Signal2_1,
	isBellActive = function(p1, p2, p3, Enabled): boolean
		return if p1 then p2 == p3 or p2 == nil and Enabled == true else false
	end
}