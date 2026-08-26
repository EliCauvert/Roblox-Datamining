local _ = require(script.Parent.Parent.Types)
local createSignal = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(false)
	local var3, var4 = createSignal(nil)
	
	return {
		getIsOpen = var1,
		getContext = var3,
		open = function(p1)
			-- upvalues: var4 (ref), var2 (ref)
			var4(p1)
			var2(true)
		end,
		close = function()
			-- upvalues: var2 (ref)
			var2(false)
		end
	}
end