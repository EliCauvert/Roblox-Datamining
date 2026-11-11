local ReactModule = require(script.Parent.Parent.Parent.Parent.Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseRefFunction = ReactModule.useRef

return {
	useAfterFastRefresh = function(Callback)
		-- upvalues: UseRefFunction (copy), UseEffectFunction (copy)
		if _G.__DEV__ then
			local UseRefResult = UseRefFunction(false)
			UseEffectFunction(function()
				-- upvalues: UseRefResult (copy)
				return function()
					-- upvalues: UseRefResult (upval)
					UseRefResult.current = true
				end
			end, {})
			UseEffectFunction(function()
				-- upvalues: UseRefResult (copy), Callback (copy)
				if UseRefResult.current == true then
					UseRefResult.current = false
					Callback()
				end
			end, {})
		end
	end
}