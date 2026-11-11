local Parent = script.Parent.Parent
local _ = require(Parent.InternalHttpStore)
local CreateHttpStoreModule = require(script.Parent.createHttpStore)
local v1 = nil
local Signal = nil
local Signal2 = nil
Signal, Signal2 = require(Parent.Signals).createSignal(nil)

return {
	_create = function(p1)
		-- upvalues: v1 (ref), CreateHttpStoreModule (copy), Signal2 (ref)
		v1 = CreateHttpStoreModule(p1)
		Signal2(v1)
		
		return v1
	end,
	_dispose = function()
		-- upvalues: Signal (ref), Signal2 (ref)
		local SignalResult = Signal()
		
		if SignalResult ~= nil then
			SignalResult.cancelAll()
		end
		Signal2(nil)
	end,
	get = function(p1)
		-- upvalues: Signal (ref)
		return Signal(p1)
	end
}