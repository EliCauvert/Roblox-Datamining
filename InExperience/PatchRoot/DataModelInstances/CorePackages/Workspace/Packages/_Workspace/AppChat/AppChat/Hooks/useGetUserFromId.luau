local useSelector = require(script:FindFirstAncestor("AppChat").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function(p0)
	-- upvalues: useSelector (ref)
	return useSelector(function(p1)
		-- upvalues: p0 (ref)
		return if p0 then p1.Users[p0] else nil
	end)
end