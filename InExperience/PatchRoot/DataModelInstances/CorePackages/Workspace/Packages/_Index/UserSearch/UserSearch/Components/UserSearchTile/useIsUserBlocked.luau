local UseSelectorFunction = require(script:FindFirstAncestor("UserSearch").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: UseSelectorFunction (copy)
	return UseSelectorFunction(function(p2): boolean
		-- upvalues: p1 (copy)
		local PlayerContextualMenu = p2.PlayerContextualMenu
		
		if PlayerContextualMenu then
			local UserBlocking = PlayerContextualMenu.UserBlocking
			local IsBlockedByMe = if UserBlocking then UserBlocking.isBlockedByMe else PlayerContextualMenu.IsBlockedByMe
			
			return if IsBlockedByMe then IsBlockedByMe[p1] == true else false
		else
			return false
		end
	end)
end