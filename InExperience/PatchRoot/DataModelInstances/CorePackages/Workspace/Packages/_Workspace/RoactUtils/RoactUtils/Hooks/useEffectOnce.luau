local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(Callback, p1) --[[ Line: 9 ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 12 ]]
		-- upvalues: p1 (copy), UseRefResult (copy), Callback (copy)
		if p1 and not UseRefResult.current then
			Callback()
			UseRefResult.current = true
		end
	end, { p1 })
end