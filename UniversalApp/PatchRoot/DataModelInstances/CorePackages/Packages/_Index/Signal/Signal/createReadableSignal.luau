local createSignalModule = require(script.Parent.createSignal)

return function(value) --[[ line: 30 | named "createReadableSignal" ]]
	-- upvalues: createSignalModule (ref)
	local var1, var2 = createSignalModule()
	local var3 = value
	
	return {
		subscribe = function(_, p0) --[[ line: 35 ]]
			-- upvalues: var1 (ref)
			return var1:subscribe(p0)
		end,
		getValue = function(_) --[[ line: 39 ]]
			-- upvalues: var3 (write)
			return var3
		end
	}, function(p1) --[[ line: 43 | named "fire" ]]
		-- upvalues: var3 (write), var2 (ref)
		var3 = p1
		var2(p1)
	end
end