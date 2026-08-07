local createSignal = require(script:FindFirstAncestor("FriendsChat").Parent.Signals).createSignal

return function() --[[ line: 19 ]]
	-- upvalues: createSignal (ref)
	local var0, var1 = createSignal(false)
	local var2, var3 = createSignal(nil)
	local var4, var5 = createSignal({})
	
	return {
		getHasEnteredFriendsTab = var0,
		getActiveConversationId = var2,
		getLocalUnreadConversationIds = var4,
		markFriendsTabEntered = function() --[[ line: 31 ]]
			-- upvalues: var1 (ref)
			var1(true)
		end,
		setActiveConversationId = function(value) --[[ line: 35 ]]
			-- upvalues: var3 (ref)
			var3(value)
		end,
		addLocalUnread = function(p0) --[[ line: 39 ]]
			-- upvalues: var5 (ref)
			var5(function(p1) --[[ line: 40 ]]
				-- upvalues: p0 (ref)
				if p1[p0] then
					return p1
				end
				local cloned = table.clone(p1)
				cloned[p0] = true
				
				return cloned
			end)
		end,
		clearLocalUnread = function() --[[ line: 50 ]]
			-- upvalues: var5 (ref)
			var5(function(p2) --[[ line: 51 ]]
				return if next(p2) == nil then p2 else {}
			end)
		end
	}
end