local ReactModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef
local UseStateFunction = ReactModule.useState

return function(p1, p2)
	-- upvalues: UseRefFunction (copy), UseStateFunction (copy), UseCallbackFunction (copy), UseEffectFunction (copy)
	local UseRefResult = UseRefFunction(nil)
	local UseStateResult, UseStateResult2 = UseStateFunction(p1 or true)
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseRefResult (copy), UseStateResult2 (copy), p2 (copy)
		if UseRefResult.current then
			task.cancel(UseRefResult.current)
		end
		UseStateResult2(true)
		UseRefResult.current = task.delay(p2 or 5, function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
	end, { p2, UseStateResult })
	UseEffectFunction(function()
		-- upvalues: UseCallbackResult (copy), UseRefResult (copy)
		UseCallbackResult()
		
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				task.cancel(UseRefResult.current)
				UseRefResult.current = nil
			end
		end
	end, { p2 })
	
	return UseStateResult, UseCallbackResult
end