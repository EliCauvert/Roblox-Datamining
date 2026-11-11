local SignalsModule = require(script.Parent.Parent.Parent.Signals)
local Signal, Signal2 = SignalsModule.createSignal(true)
local Signal1, Signal2_1 = SignalsModule.createSignal({})
local v1 = nil

return {
	getVisible = Signal,
	setVisible = Signal2,
	getEffectiveVisible = SignalsModule.createComputed(function(p1): boolean
		-- upvalues: Signal (copy), Signal1 (copy)
		return Signal(p1) and next(Signal1(p1)) == nil
	end),
	setTempHide = function(p1, p2)
		-- upvalues: Signal1 (copy), Signal2_1 (copy), v1 (ref), Signal (copy), Signal2 (copy)
		local NoNextEntry = next(Signal1(false)) == nil
		Signal2_1(function(Tbl)
			-- upvalues: p1 (copy), p2 (copy)
			local Copy = table.clone(Tbl)
			Copy[p1] = if p2 then true else nil
			
			return Copy
		end)
		local NoNextEntry1 = next(Signal1(false)) == nil
		
		if NoNextEntry and not NoNextEntry1 then
			v1 = Signal(false)
			
			return
		end
		if not NoNextEntry and NoNextEntry1 and v1 ~= nil then
			local v2 = v1
			v1 = nil
			
			if Signal(false) ~= v2 then
				Signal2(v2)
			end
		end
	end,
	reset = function()
		-- upvalues: v1 (ref), Signal2_1 (copy), Signal2 (copy)
		v1 = nil
		Signal2_1({})
		Signal2(true)
	end
}