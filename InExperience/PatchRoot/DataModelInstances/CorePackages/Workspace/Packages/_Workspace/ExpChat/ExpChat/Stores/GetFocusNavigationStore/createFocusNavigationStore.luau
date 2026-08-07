local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function() --[[ line: 15 ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(false)
	
	return {
		getChatInputBarFocused = var0,
		focusChatInputBar = function() --[[ line: 18 ]]
			-- upvalues: var1 (ref)
			var1(true)
		end,
		unfocusChatInputBar = function() --[[ line: 21 ]]
			-- upvalues: var1 (ref)
			var1(false)
		end
	}
end