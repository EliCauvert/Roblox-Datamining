local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(Callback)
	-- upvalues: ReactModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: Callback (copy)
		Callback()
	end, {})
end