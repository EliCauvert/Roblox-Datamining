local signalsModule = require(script:FindFirstAncestor("Moments").Parent.Signals)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(false)
	local var3, var4 = signalsModule.createSignal(nil)
	
	return {
		getIsOpen = var1,
		getFeedItemId = var3,
		open = function(p1)
			-- upvalues: var4 (ref), var2 (ref)
			var4(p1)
			var2(true)
		end,
		close = function()
			-- upvalues: var2 (ref)
			var2(false)
		end,
		reset = function()
			-- upvalues: var2 (ref), var4 (ref)
			var2(false)
			var4(nil)
		end
	}
end