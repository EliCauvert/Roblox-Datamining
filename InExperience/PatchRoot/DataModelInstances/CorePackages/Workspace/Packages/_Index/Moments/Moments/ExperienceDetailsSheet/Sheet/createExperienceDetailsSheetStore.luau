local _ = require(script.Parent.Parent.Types)
local createSignal = require(script:FindFirstAncestor("Moments").Parent.Signals).createSignal

return function() --[[ line: 26 | named "createExperienceDetailsSheetStore" ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(false)
	local var2, var3 = createSignal(nil)
	
	return {
		getIsOpen = var0,
		getContext = var2,
		open = function(p0) --[[ line: 30 ]]
			-- upvalues: var3 (ref), var1 (ref)
			var3(p0)
			var1(true)
		end,
		close = function() --[[ line: 35 ]]
			-- upvalues: var1 (ref)
			var1(false)
		end
	}
end