local useSelector = require(script:FindFirstAncestor("AppChat").Parent.RoactUtils).Hooks.RoactRodux.useSelector

return function()
	-- upvalues: useSelector (ref)
	return useSelector(function(p0)
		return p0.Users
	end)
end