local CreateSignalFunction = require(script.Parent.Parent.Signals).createSignal

local function defaultFilter(...)
	return select(1, ...)
end

return function(Signal, p1, p2)
	-- upvalues: CreateSignalFunction (copy), defaultFilter (copy)
	local Signal1, Signal2 = CreateSignalFunction(p1)
	local DefaultFilter = if p2 == nil then defaultFilter else p2
	
	return Signal1, (Signal:Connect(function(...)
		-- upvalues: Signal2 (copy), DefaultFilter (copy)
		Signal2(DefaultFilter(...))
	end))
end