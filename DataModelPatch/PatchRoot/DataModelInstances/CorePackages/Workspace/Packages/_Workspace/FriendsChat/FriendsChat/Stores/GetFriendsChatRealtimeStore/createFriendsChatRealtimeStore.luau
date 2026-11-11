local CreateSignalFunction = require(script:FindFirstAncestor("FriendsChat").Parent.Signals).createSignal

return function()
	-- upvalues: CreateSignalFunction (copy)
	local Signal, Signal2 = CreateSignalFunction(false)
	local Signal1, Signal2_1 = CreateSignalFunction(nil)
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	
	return {
		getHasEnteredFriendsTab = Signal,
		getActiveConversationId = Signal1,
		getHasLocalUnread = Signal3,
		markFriendsTabEntered = function()
			-- upvalues: Signal2 (copy)
			Signal2(true)
		end,
		setActiveConversationId = function(p1)
			-- upvalues: Signal2_1 (copy)
			Signal2_1(p1)
		end,
		setHasLocalUnread = function(p1)
			-- upvalues: Signal2_2 (copy)
			Signal2_2(p1)
		end
	}
end