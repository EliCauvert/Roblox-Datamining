local createSignal = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(true)
	local var3 = nil
	local var4, var5 = createSignal(false)
	
	return {
		getChromeVisible = var1,
		setChromeVisible = function(value)
			-- upvalues: var2 (ref)
			var2(value)
		end,
		revealChrome = function()
			-- upvalues: var3 (write), var2 (ref)
			if var3 == nil then
				var2(true)
				
				return
			end
			var3()
		end,
		setRevealHandler = function(value)
			-- upvalues: var3 (write)
			var3 = value
		end,
		getOverlayCovering = var4,
		setOverlayCovering = function(value)
			-- upvalues: var5 (ref)
			var5(value)
		end
	}
end