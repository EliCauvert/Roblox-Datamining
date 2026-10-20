local CreateSignalModule = require(script.Parent.createSignal)

return function(p1)
	-- upvalues: CreateSignalModule (copy)
	local SignalModule, SignalModule2 = CreateSignalModule()
	local v1 = p1
	
	return {
		subscribe = function(_, p2)
			-- upvalues: SignalModule (copy)
			return SignalModule:subscribe(p2)
		end,
		getValue = function(_)
			-- upvalues: v1 (ref)
			return v1
		end
	}, function(p2)
		-- upvalues: v1 (ref), SignalModule2 (copy)
		v1 = p2
		SignalModule2(p2)
	end
end