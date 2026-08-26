local createSignalModule = require(script.Parent.createSignal)

return function(value)
	-- upvalues: createSignalModule (ref)
	local var1, var2 = createSignalModule()
	local var3 = value
	
	return {
		subscribe = function(_, p1)
			-- upvalues: var1 (ref)
			return var1:subscribe(p1)
		end,
		getValue = function(_)
			-- upvalues: var3 (write)
			return var3
		end
	}, function(p1)
		-- upvalues: var3 (write), var2 (ref)
		var3 = p1
		var2(p1)
	end
end