local Slot = require(script.Parent.slot).Slot
local BindFunction = Slot.bind
local SetTimeoutFunction = require(script.Parent.Parent.Parent.Parent.LuauPolyfill).setTimeout

return {
	Slot = Slot,
	bind = BindFunction,
	noContext = Slot.noContext,
	setTimeout = function(p1, p2)
		-- upvalues: SetTimeoutFunction (copy), BindFunction (copy)
		return SetTimeoutFunction(BindFunction(p1), p2)
	end
}