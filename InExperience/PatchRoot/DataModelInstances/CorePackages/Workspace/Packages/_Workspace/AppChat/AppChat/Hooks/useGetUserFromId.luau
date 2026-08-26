local useSelector = require(script:FindFirstAncestor("AppChat").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: useSelector (ref)
	return useSelector(function(p2)
		-- upvalues: p1 (ref)
		return if p1 then p2.Users[p1] else nil
	end)
end