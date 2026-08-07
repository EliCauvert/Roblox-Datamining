local signalsModule = require(script.Parent.Parent.Signals)

local function defaultFilter(...) --[[ line: 5 ]]
	return select(1, ...)
end

return function(value, p0, p1) --[[ line: 9 | named "createRBXEventSignal" ]]
	-- upvalues: signalsModule (ref), defaultFilter (ref)
	local var2, var3 = signalsModule.createSignal(p0)
	local var4 = if p1 ~= nil then defaultFilter else p1
	
	return var2, value:Connect(function(...) --[[ line: 18 ]]
		-- upvalues: var3 (ref), var4 (ref)
		var3(var4(...))
	end)
end