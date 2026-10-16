local SignalsModule = require(script:FindFirstAncestor("StreamNotifications").Parent.Signals)
local Signal, Signal2 = SignalsModule.createSignal(false)
local Signal1, Signal2_1 = SignalsModule.createSignal(nil)

return {
	PrimaryBellId = "StreamNotificationPrimaryBell",
	setStreamPresented = Signal2,
	getStreamPresented = Signal,
	getActiveBellId = Signal1,
	setActiveBellId = Signal2_1,
	isBellActive = function(p1, p2, p3, Enabled1, Enabled): boolean --[[ Line: 26 ]]
		return if p1 and Enabled ~= false then if p2 == "StreamNotificationPrimaryBell" then Enabled1 == true else p2 == p3 or p2 == nil and Enabled1 == true else false
	end
}