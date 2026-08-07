local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function() --[[ line: 16 ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(nil)
	local var2, var3 = createSignal(nil)
	
	return {
		getOpenMessageId = var0,
		getComponentId = var2,
		toggleDropdown = function(p0) --[[ line: 20 ]]
			-- upvalues: var1 (ref)
			var1(function(p1) --[[ line: 21 ]]
				-- upvalues: p0 (ref)
				return if p1 == p0 then nil else p0
			end)
		end,
		setComponentId = var3
	}
end