local signalsModule = require(script.Parent.Parent.Parent.Signals)
local var1, var2 = signalsModule.createSignal(true)
local var3, var4 = signalsModule.createSignal({})
local var5 = nil

return {
	getVisible = var1,
	setVisible = var2,
	getEffectiveVisible = signalsModule.createComputed(function(p0) --[[ line: 24 ]]
		-- upvalues: var1 (ref), var3 (ref)
		return var1(p0) and next(var3(p0)) == nil
	end),
	setTempHide = function(value, p1) --[[ line: 30 ]]
		-- upvalues: var3 (ref), var4 (ref), var5 (write), var1 (ref), var2 (ref)
		local var6 = next(var3(false)) == nil
		var4(function(p2) --[[ line: 32 ]]
			-- upvalues: value (ref), p1 (ref)
			local cloned = table.clone(p2)
			cloned[value] = if p1 then true else nil
			
			return cloned
		end)
		local var7 = next(var3(false)) == nil
		
		if var6 and not var7 then
			var5 = var1(false)
			
			return
		elseif not var6 and var7 and var5 ~= nil then
			local var8 = var5
			var5 = nil
			
			if var1(false) ~= var8 then
				var2(var8)
			end
		end
	end,
	reset = function() --[[ line: 51 ]]
		-- upvalues: var5 (write), var4 (ref), var2 (ref)
		var5 = nil
		var4({})
		var2(true)
	end
}