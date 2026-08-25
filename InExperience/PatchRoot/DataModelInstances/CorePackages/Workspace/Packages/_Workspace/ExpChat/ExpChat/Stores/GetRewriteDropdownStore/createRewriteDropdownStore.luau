local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(nil)
	local var2, var3 = createSignal(nil)
	
	return {
		getOpenMessageId = var0,
		getComponentId = var2,
		toggleDropdown = function(p0)
			-- upvalues: var1 (ref)
			var1(function(p1)
				-- upvalues: p0 (ref)
				return if p1 == p0 then nil else p0
			end)
		end,
		setComponentId = var3
	}
end