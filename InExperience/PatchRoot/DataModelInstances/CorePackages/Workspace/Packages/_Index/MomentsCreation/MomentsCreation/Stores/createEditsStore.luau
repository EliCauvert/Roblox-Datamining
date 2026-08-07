local createSignal = require(script:FindFirstAncestor("MomentsCreation").Parent.Signals).createSignal

return function() --[[ line: 25 | named "createEditsStore" ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal({})
	
	return {
		getMap = var0,
		setCommitted = function(value, p0) --[[ line: 28 ]]
			-- upvalues: var0 (ref), var1 (ref)
			local cloned = table.clone(var0(false))
			cloned[value] = p0
			var1(cloned)
		end,
		clear = function() --[[ line: 34 ]]
			-- upvalues: var1 (ref)
			var1({})
		end
	}
end