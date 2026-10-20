local Signal, Signal2 = require(script:FindFirstAncestor("UserLib").Parent.Signals).createSignal("")

return {
	getCurrentUserId = Signal,
	setCurrentUserId = Signal2,
	reset = function()
		-- upvalues: Signal2 (copy)
		Signal2("")
	end
}