local ReactModule = require(script:FindFirstAncestor("Groups").Parent.React)

return function(Current, Callback)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	ReactModule.useEffect(function()
		-- upvalues: Current (copy), UseRefResult (copy), Callback (copy)
		if Current ~= UseRefResult.current then
			UseRefResult.current = Current
			Callback()
		end
	end, { Current, Callback })
end