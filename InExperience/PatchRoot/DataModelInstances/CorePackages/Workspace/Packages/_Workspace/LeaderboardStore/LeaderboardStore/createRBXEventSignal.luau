local signalsModule = require(script.Parent.Parent.Signals)

local function defaultFilter(...)
	return select(1, ...)
end

return function(value, p1, p2)
	-- upvalues: signalsModule (ref), defaultFilter (ref)
	local var1, var2 = signalsModule.createSignal(p1)
	local var3 = if p2 ~= nil then defaultFilter else p2
	
	return var1, value:Connect(function(...)
		-- upvalues: var2 (ref), var3 (ref)
		var2(var3(...))
	end)
end