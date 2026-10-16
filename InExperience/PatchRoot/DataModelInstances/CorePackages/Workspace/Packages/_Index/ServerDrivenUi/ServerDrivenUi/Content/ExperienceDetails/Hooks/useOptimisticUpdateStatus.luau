local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)

return function(Callback, Callback1) --[[ Line: 11 | Named "useOptimisticUpdateStatus" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 18 ]]
		-- upvalues: UseRefResult (copy)
		return function() --[[ Line: 19 ]]
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				UseRefResult.current()
			end
		end
	end, {})
	
	return ReactModule.useCallback(function(...) --[[ Line: 27 ]]
		-- upvalues: UseRefResult (copy), Callback (copy), SignalsModule (upval), Callback1 (copy)
		if UseRefResult.current then
			UseRefResult.current()
			UseRefResult.current = nil
		end
		local CallbackResult = Callback(...)
		
		if CallbackResult then
			UseRefResult.current = SignalsModule.createEffect(function(p1) --[[ Line: 39 ]]
				-- upvalues: CallbackResult (copy), Callback1 (upval)
				local CallbackResultResult = CallbackResult(p1)
				
				if CallbackResultResult ~= nil then
					Callback1(CallbackResultResult)
				end
			end)
		end
	end, { Callback, Callback1 })
end