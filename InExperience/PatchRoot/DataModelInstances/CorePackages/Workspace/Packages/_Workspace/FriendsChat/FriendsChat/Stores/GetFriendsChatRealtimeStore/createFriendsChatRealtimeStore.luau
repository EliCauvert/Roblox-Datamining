local createSignal = require(script:FindFirstAncestor("FriendsChat").Parent.Signals).createSignal

return function()
	-- upvalues: createSignal (ref)
	local var1, var2 = createSignal(false)
	local var3, var4 = createSignal(nil)
	local var5, var6 = createSignal({})
	
	return {
		getHasEnteredFriendsTab = var1,
		getActiveConversationId = var3,
		getLocalUnreadConversationIds = var5,
		markFriendsTabEntered = function()
			-- upvalues: var2 (ref)
			var2(true)
		end,
		setActiveConversationId = function(value)
			-- upvalues: var4 (ref)
			var4(value)
		end,
		addLocalUnread = function(p1)
			-- upvalues: var6 (ref)
			var6(function(p2)
				-- upvalues: p1 (ref)
				if p2[p1] then
					return p2
				end
				local cloned = table.clone(p2)
				cloned[p1] = true
				
				return cloned
			end)
		end,
		clearLocalUnread = function()
			-- upvalues: var6 (ref)
			var6(function(p1)
				return if next(p1) == nil then p1 else {}
			end)
		end
	}
end