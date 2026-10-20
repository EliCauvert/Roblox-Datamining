local ReactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p1, Callback)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), Callback (copy)
		if UseRefResult1.current then
			UseRefResult1.current()
			UseRefResult1.current = nil
		end
		if Current then
			UseRefResult.current = Current
			UseRefResult1.current = Callback(Current)
		end
	end, { Callback })
	ReactModule.useImperativeHandle(p1, function()
		-- upvalues: UseRefResult (copy)
		return UseRefResult.current
	end)
	
	return UseResult
end