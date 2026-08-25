local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(false)
	
	return {
		getChatInputBarFocused = var0,
		focusChatInputBar = function()
			-- upvalues: var1 (ref)
			var1(true)
		end,
		unfocusChatInputBar = function()
			-- upvalues: var1 (ref)
			var1(false)
		end
	}
end