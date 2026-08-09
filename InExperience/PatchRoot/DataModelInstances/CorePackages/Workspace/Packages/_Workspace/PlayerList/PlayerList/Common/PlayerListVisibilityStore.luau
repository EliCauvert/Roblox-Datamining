local signalsModule = require(script.Parent.Parent.Parent.Signals)
local var1, var2 = signalsModule.createSignal(true)
local var3, var4 = signalsModule.createSignal({})

return {
	getVisible = var1,
	setVisible = var2,
	getEffectiveVisible = signalsModule.createComputed(function(p0) --[[ line: 24 ]]
		-- upvalues: var1 (ref), var3 (ref)
		return var1(p0) and next(var3(p0)) == nil
	end),
	setTempHide = function(value, p1) --[[ line: 28 ]]
		-- upvalues: var4 (ref)
		var4(function(p2) --[[ line: 29 ]]
			-- upvalues: value (ref), p1 (ref)
			local cloned = table.clone(p2)
			cloned[value] = if p1 then true else nil
			
			return cloned
		end)
	end,
	reset = function() --[[ line: 38 ]]
		-- upvalues: var4 (ref), var2 (ref)
		var4({})
		var2(true)
	end
}