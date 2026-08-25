local var0, var1 = require(script:FindFirstAncestor("LocalUserIdStore").Parent.Signals).createSignal("")

return {
	getCurrentUserId = var0,
	setCurrentUserId = var1,
	reset = function()
		-- upvalues: var1 (ref)
		var1("")
	end
}