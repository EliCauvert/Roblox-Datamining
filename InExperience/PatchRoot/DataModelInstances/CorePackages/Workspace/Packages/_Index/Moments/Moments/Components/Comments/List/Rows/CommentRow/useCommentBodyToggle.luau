local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)

return function(p1, Callback, Current, p2, p3)
	-- upvalues: ReactModule (copy)
	local ContainsPointFunction = p1.containsPoint
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(p4, p5: number)
		-- upvalues: UseRefResult (copy), Callback (copy), ContainsPointFunction (copy), p3 (copy), p2 (copy), Current (copy)
		UseRefResult.current = nil
		
		if Callback == nil or not ContainsPointFunction(p4) then return end
		local v1 = p5 < 2
		
		if not p3 or v1 and not p2 then
			Callback(Current)
			
			return
		end
		if v1 then
			UseRefResult.current = Current
		end
	end, {
		Callback,
		ContainsPointFunction,
		Current,
		p2,
		p3
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), Callback (copy)
		local Current = UseRefResult.current
		UseRefResult.current = nil
		
		if Current ~= nil and Callback ~= nil then
			Callback(Current)
		end
	end, { Callback })
	local HasCallback = Callback ~= nil
	local IsTruncatable = HasCallback and p1.isTruncatable
	
	return {
		isActive = HasCallback,
		canToggle = IsTruncatable,
		onTap = if IsTruncatable then UseResult else nil,
		onSingleTapConfirmed = if IsTruncatable and p3 then UseResult1 else nil
	}
end