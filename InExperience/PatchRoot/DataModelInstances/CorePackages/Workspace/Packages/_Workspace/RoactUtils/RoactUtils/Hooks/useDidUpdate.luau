local ReactModule = require(script:FindFirstAncestor("RoactUtils").Parent.React)

return function(Callback) --[[ Line: 10 ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 14 ]]
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), Callback (copy)
		if not UseRefResult.current then
			UseRefResult.current = true
			
			return
		end
		if not UseRefResult1.current then
			UseRefResult1.current = true
		end
		if Callback then
			Callback()
		end
	end)
	
	return UseRefResult1
end