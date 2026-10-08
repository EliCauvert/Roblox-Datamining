local useSelector = require(script:FindFirstAncestor("UserSearch").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: useSelector (ref)
	return useSelector(function(p2)
		-- upvalues: p1 (ref)
		local playerContextualMenu = p2.PlayerContextualMenu
		
		if not playerContextualMenu then
			return false
		end
		local userBlocking = playerContextualMenu.UserBlocking
		local var1 = if userBlocking then userBlocking.isBlockedByMe else playerContextualMenu.IsBlockedByMe
		
		return if var1 then var1[p1] == true else false
	end)
end