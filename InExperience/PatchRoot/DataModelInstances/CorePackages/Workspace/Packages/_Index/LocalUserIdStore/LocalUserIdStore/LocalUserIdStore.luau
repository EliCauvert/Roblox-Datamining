local var1, var2 = require(script:FindFirstAncestor("LocalUserIdStore").Parent.Signals).createSignal("")

return {
	getCurrentUserId = var1,
	setCurrentUserId = var2,
	reset = function()
		-- upvalues: var2 (ref)
		var2("")
	end
}