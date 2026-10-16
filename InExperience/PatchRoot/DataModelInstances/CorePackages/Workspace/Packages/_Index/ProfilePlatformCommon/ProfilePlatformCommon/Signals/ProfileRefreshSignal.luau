local Signal, Signal2 = require(script:FindFirstAncestor("ProfilePlatformCommon").Parent.Signals).createSignal(0)

return {
	notifyProfileRefresh = function() --[[ Line: 7 ]]
		-- upvalues: Signal2 (copy)
		Signal2(os.clock())
	end,
	getProfileRefreshSignal = Signal
}