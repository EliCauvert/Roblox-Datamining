local createSignal = require(script:FindFirstAncestor("ExpChat").Parent.Signals).createSignal

return function() --[[ line: 16 ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(false)
	local var2, var3 = createSignal(nil)
	
	return {
		getHasEnteredFriendsTab = var0,
		getActiveConversationId = var2,
		markFriendsTabEntered = function() --[[ line: 22 ]]
			-- upvalues: var1 (ref)
			var1(true)
		end,
		setActiveConversationId = function(value) --[[ line: 26 ]]
			-- upvalues: var3 (ref)
			var3(value)
		end
	}
end