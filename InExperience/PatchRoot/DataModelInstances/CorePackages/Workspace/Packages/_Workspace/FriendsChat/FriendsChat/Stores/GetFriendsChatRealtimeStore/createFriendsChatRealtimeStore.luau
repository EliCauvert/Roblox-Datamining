local CreateSignalFunction = require(script:FindFirstAncestor("FriendsChat").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	local Signal3, Signal2_2 = CreateSignalFunction({})
	
	return {
		getHasEnteredFriendsTab = Signal,
		getActiveConversationId = Signal1,
		getLocalUnreadConversationIds = Signal3,
		markFriendsTabEntered = function()
			-- upvalues: Signal2 (copy)
			Signal2(true)
		end,
		setActiveConversationId = function(p1)
			-- upvalues: Signal2_1 (copy)
			Signal2_1(p1)
		end,
		addLocalUnread = function(p1)
			-- upvalues: Signal2_2 (copy)
			Signal2_2(function(Tbl)
				-- upvalues: p1 (copy)
				if Tbl[p1] then
					return Tbl
				else
					local Copy = table.clone(Tbl)
					Copy[p1] = true
					
					return Copy
				end
			end)
		end,
		clearLocalUnread = function()
			-- upvalues: Signal2_2 (copy)
			Signal2_2(function(p1)
				return if next(p1) == nil then p1 else {}
			end)
		end
	}
end