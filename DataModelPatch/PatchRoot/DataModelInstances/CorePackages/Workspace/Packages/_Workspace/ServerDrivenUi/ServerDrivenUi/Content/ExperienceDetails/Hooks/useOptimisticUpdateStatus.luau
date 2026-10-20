local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)

return function(Callback, Callback1)
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				UseRefResult.current()
			end
		end
	end, {})
	
	return ReactModule.useCallback(function(...)
		-- upvalues: UseRefResult (copy), Callback (copy), SignalsModule (upval), Callback1 (copy)
		if UseRefResult.current then
			UseRefResult.current()
			UseRefResult.current = nil
		end
		local CallbackResult = Callback(...)
		
		if CallbackResult then
			UseRefResult.current = SignalsModule.createEffect(function(p1)
				-- upvalues: CallbackResult (copy), Callback1 (upval)
				local CallbackResultResult = CallbackResult(p1)
				
				if CallbackResultResult ~= nil then
					Callback1(CallbackResultResult)
				end
			end)
		end
	end, { Callback, Callback1 })
end