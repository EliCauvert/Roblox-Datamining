local ReactModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.React)

return function(Callback, p1) --[[ Line: 6 ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 9 ]]
		-- upvalues: p1 (copy), UseRefResult (copy), Callback (copy)
		if p1 and not UseRefResult.current then
			Callback()
			UseRefResult.current = true
		end
	end, { p1 })
end