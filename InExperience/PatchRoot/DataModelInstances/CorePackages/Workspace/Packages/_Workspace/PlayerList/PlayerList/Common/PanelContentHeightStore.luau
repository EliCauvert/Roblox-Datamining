local var1, var2 = require(script.Parent.Parent.Parent.Signals).createSignal(0)

return {
	getBodyContentHeight = var1,
	setBodyContentHeight = var2,
	reset = function()
		-- upvalues: var2 (ref)
		var2(0)
	end
}