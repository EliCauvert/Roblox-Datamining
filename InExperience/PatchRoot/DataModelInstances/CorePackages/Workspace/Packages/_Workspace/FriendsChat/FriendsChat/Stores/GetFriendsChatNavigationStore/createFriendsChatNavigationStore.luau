local createSignal = require(script:FindFirstAncestor("FriendsChat").Parent.Signals).createSignal

return function() --[[ line: 25 ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(nil)
	local var2, var3 = createSignal(nil)
	local var4, var5 = createSignal(false)
	
	return {
		getSelectedConversationId = var0,
		setSelectedConversationId = var1,
		getFocusInputBarRequestTime = var2,
		requestFocusInputBar = function(p0) --[[ line: 36 ]]
			-- upvalues: var3 (ref)
			var3(p0 or os.clock())
		end,
		clearFocusInputBarRequest = function() --[[ line: 39 ]]
			-- upvalues: var3 (ref)
			var3(nil)
		end,
		getIsInputBarFocused = var4,
		setInputBarFocused = var5
	}
end