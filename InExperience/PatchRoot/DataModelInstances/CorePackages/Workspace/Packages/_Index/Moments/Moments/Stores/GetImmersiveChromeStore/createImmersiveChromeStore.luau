local createSignal = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function() --[[ line: 37 | named "createImmersiveChromeStore" ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(true)
	local var2 = nil
	local var3, var4 = createSignal(false)
	
	return {
		getChromeVisible = var0,
		setChromeVisible = function(value) --[[ line: 45 ]]
			-- upvalues: var1 (ref)
			var1(value)
		end,
		revealChrome = function() --[[ line: 57 ]]
			-- upvalues: var2 (write), var1 (ref)
			if var2 == nil then
				var1(true)
				
				return
			end
			var2()
		end,
		setRevealHandler = function(value) --[[ line: 53 ]]
			-- upvalues: var2 (write)
			var2 = value
		end,
		getOverlayCovering = var3,
		setOverlayCovering = function(value) --[[ line: 49 ]]
			-- upvalues: var4 (ref)
			var4(value)
		end
	}
end