local SignalsModule = require(script.Parent.Parent.Signals)

local function defaultFilter(...) --[[ Line: 5 ]]
	return select(1, ...)
end

return function(Signal, p1, p2) --[[ Line: 9 | Named "createRBXEventSignal" ]]
	-- upvalues: SignalsModule (copy), defaultFilter (copy)
	local Signal1, Signal2 = SignalsModule.createSignal(p1)
	local DefaultFilter = if p2 == nil then defaultFilter else p2
	
	return Signal1, (Signal:Connect(function(...) --[[ Line: 18 ]]
		-- upvalues: Signal2 (copy), DefaultFilter (copy)
		Signal2(DefaultFilter(...))
	end))
end