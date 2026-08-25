local signalsModule = require(script:FindFirstAncestor("AppChat").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3 = 0
	local var4 = nil
	
	local function cancelNavigation()
		-- upvalues: var4 (write), var2 (ref)
		var4 = nil
		var2(false)
	end
	
	return {
		getIsNavigationPending = var1,
		beginNavigation = function()
			-- upvalues: var3 (write), var4 (write), var2 (ref)
			var3 += 1
			var4 = var3
			var2(true)
			
			return var3
		end,
		completeNavigation = function(p0)
			-- upvalues: var1 (ref), var4 (write), var2 (ref)
			if var1(false) and p0 == var4 then
				var4 = nil
				var2(false)
			end
		end,
		cancelNavigation = cancelNavigation,
		reset = cancelNavigation
	}
end