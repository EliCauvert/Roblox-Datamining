local signalsModule = require(script.Parent.Parent.Signals)

local function defaultFilter(...)
	return select(1, ...)
end

return function(value, p0, p1)
	-- upvalues: signalsModule (ref), defaultFilter (ref)
	local var2, var3 = signalsModule.createSignal(p0)
	local var4 = if p1 ~= nil then defaultFilter else p1
	
	return var2, value:Connect(function(...)
		-- upvalues: var3 (ref), var4 (ref)
		var3(var4(...))
	end)
end