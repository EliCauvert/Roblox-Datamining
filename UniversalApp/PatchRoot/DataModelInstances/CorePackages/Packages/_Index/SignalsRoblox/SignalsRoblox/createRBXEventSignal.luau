local createSignal = require(script.Parent.Parent.Signals).createSignal

local function defaultFilter(...) --[[ line: 10 ]]
	return select(1, ...)
end

return function(value, p0, p1) --[[ line: 14 | named "createRBXEventSignal" ]]
	-- upvalues: createSignal (ref), defaultFilter (ref)
	local var1, var2 = createSignal(p0)
	local var3 = if p1 ~= nil then defaultFilter else p1
	
	return var1, value:Connect(function(...) --[[ line: 23 ]]
		-- upvalues: var2 (ref), var3 (ref)
		var2(var3(...))
	end)
end