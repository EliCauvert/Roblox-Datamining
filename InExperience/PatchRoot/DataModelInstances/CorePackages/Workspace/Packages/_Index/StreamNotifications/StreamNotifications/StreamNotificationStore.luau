local signalsModule = require(script:FindFirstAncestor("StreamNotifications").Parent.Signals)
local var1, var2 = signalsModule.createSignal(false)
local var3, var4 = signalsModule.createSignal(nil)

return {
	PrimaryBellId = "StreamNotificationPrimaryBell",
	setStreamPresented = var2,
	getStreamPresented = var1,
	getActiveBellId = var3,
	setActiveBellId = var4,
	isBellActive = function(p0, p1, p2, p3, p4) --[[ line: 26 ]]
		return not (not p0 or p4 == false) and (if p1 == "StreamNotificationPrimaryBell" then p3 == true else p1 == p2 or (p1 == nil and p3 == true))
	end
}