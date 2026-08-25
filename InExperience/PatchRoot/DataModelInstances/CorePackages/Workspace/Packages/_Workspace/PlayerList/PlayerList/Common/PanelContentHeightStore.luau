local var0, var1 = require(script.Parent.Parent.Parent.Signals).createSignal(0)

return {
	getBodyContentHeight = var0,
	setBodyContentHeight = var1,
	reset = function()
		-- upvalues: var1 (ref)
		var1(0)
	end
}