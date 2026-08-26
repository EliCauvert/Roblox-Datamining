local useSelector = require(script:FindFirstAncestor("AppChat").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: useSelector (ref)
	return useSelector(function(p1)
		return p1.Users
	end)
end