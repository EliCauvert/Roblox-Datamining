local signalsModule = require(script:FindFirstAncestor("StreamNotifications").Parent.Signals)
local var1, var2 = signalsModule.createSignal(false)
local var3, var4 = signalsModule.createSignal(nil)

return {
	PrimaryBellId = "StreamNotificationPrimaryBell",
	setStreamPresented = var2,
	getStreamPresented = var1,
	getActiveBellId = var3,
	setActiveBellId = var4,
	isBellActive = function(p1, p2, p3, p4, p5)
		return not (not p1 or p5 == false) and (if p2 == "StreamNotificationPrimaryBell" then p4 == true else p2 == p3 or (p2 == nil and p4 == true))
	end
}