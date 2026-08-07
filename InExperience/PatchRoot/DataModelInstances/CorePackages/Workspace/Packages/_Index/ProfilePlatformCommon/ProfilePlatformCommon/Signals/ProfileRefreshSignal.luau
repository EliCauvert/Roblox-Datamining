local var0, var1 = require(script:FindFirstAncestor("ProfilePlatformCommon").Parent.Signals).createSignal(0)

return {
	notifyProfileRefresh = function() --[[ line: 7 ]]
		-- upvalues: var1 (ref)
		var1(os.clock())
	end,
	getProfileRefreshSignal = var0
}