local Signal, Signal2 = require(script.Parent.Parent.Parent.Signals).createSignal(0)

return {
	getBodyContentHeight = Signal,
	setBodyContentHeight = Signal2,
	reset = function() --[[ Line: 21 ]]
		-- upvalues: Signal2 (copy)
		Signal2(0)
	end
}