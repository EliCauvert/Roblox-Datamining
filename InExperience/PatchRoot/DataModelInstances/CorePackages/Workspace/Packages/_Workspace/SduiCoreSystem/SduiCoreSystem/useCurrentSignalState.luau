local Parent = script:FindFirstAncestor("SduiCoreSystem").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)

return function(Callback)
	-- upvalues: ReactModule (copy), SignalsModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: Callback (copy)
		return Callback(false)
	end)
	local UseRefResult = ReactModule.useRef(Callback)
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), Callback (copy), UseStateResult2 (copy), SignalsModule (upval)
		UseRefResult.current = Callback
		UseStateResult2(Callback(false))
		
		return SignalsModule.createEffect(function(p1)
			-- upvalues: UseStateResult2 (upval), Callback (upval)
			UseStateResult2(Callback(p1))
		end)
	end, { Callback })
	
	return if UseRefResult.current == Callback then UseStateResult else Callback(false)
end