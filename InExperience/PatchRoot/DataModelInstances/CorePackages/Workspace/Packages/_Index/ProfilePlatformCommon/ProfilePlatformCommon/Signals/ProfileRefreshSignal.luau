local var1, var2 = require(script:FindFirstAncestor("ProfilePlatformCommon").Parent.Signals).createSignal(0)

return {
	notifyProfileRefresh = function()
		-- upvalues: var2 (ref)
		var2(os.clock())
	end,
	getProfileRefreshSignal = var1
}