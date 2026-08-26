local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(nil)
	local var3, var4 = createSignal(nil)
	
	return {
		getOpenMessageId = var1,
		getComponentId = var3,
		toggleDropdown = function(p1)
			-- upvalues: var2 (ref)
			var2(function(p2)
				-- upvalues: p1 (ref)
				return if p2 == p1 then nil else p1
			end)
		end,
		setComponentId = var4
	}
end