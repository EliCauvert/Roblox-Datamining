local ReactModule = require(script:FindFirstAncestor("SocialCarousel").Parent.React)

return function(p1, Vector, p2, p3) --[[ Line: 7 | Named "useColdStartLayoutReady" ]]
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(not p1)
	local UseStateResult, UseStateResult2 = ReactModule.useState(not UseRefResult.current)
	ReactModule.useEffect(function() --[[ Line: 16 ]]
		-- upvalues: UseStateResult (copy), UseRefResult (copy), p1 (copy), Vector (copy), p2 (copy), UseStateResult2 (copy)
		if UseStateResult or not UseRefResult.current then return end
		if not p1 or Vector.X <= 1 or Vector.Y <= 1 or p2 <= 1 or Vector.X < p2 then return end
		local DelayedThread = task.delay(0.5, function() --[[ Line: 30 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end)
		
		return function() --[[ Line: 33 ]]
			-- upvalues: DelayedThread (copy)
			pcall(task.cancel, DelayedThread)
		end
	end, {
		UseStateResult, p1, Vector.X, Vector.Y, p2, p3
	})
	
	return UseStateResult
end