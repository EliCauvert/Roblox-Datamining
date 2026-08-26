local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(false)
	
	return {
		getChatInputBarFocused = var1,
		focusChatInputBar = function()
			-- upvalues: var2 (ref)
			var2(true)
		end,
		unfocusChatInputBar = function()
			-- upvalues: var2 (ref)
			var2(false)
		end
	}
end