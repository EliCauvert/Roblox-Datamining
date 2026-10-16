local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(Callback) --[[ Line: 10 ]]
	-- upvalues: ReactModule (copy)
	ReactModule.useEffect(function() --[[ Line: 11 ]]
		-- upvalues: Callback (copy)
		Callback()
	end, {})
end