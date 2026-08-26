local createSignal = require(script:FindFirstAncestor("MomentsCreation").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal({})
	
	return {
		getMap = var1,
		setCommitted = function(value, p1)
			-- upvalues: var1 (ref), var2 (ref)
			local cloned = table.clone(var1(false))
			cloned[value] = p1
			var2(cloned)
		end,
		clear = function()
			-- upvalues: var2 (ref)
			var2({})
		end
	}
end