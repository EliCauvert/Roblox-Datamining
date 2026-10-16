local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local CreateEffectFunction = require(Parent.Signals).createEffect

return function(Callback) --[[ Line: 9 | Named "useSignalBinding" ]]
	-- upvalues: ReactModule (copy), CreateEffectFunction (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Callback(false))
	ReactModule.useLayoutEffect(function() --[[ Line: 12 ]]
		-- upvalues: UseBindingResult2 (copy), Callback (copy), CreateEffectFunction (upval)
		UseBindingResult2(Callback(false))
		
		return CreateEffectFunction(function(p1) --[[ Line: 14 ]]
			-- upvalues: UseBindingResult2 (upval), Callback (upval)
			UseBindingResult2(Callback(p1))
		end)
	end, { Callback })
	
	return UseBindingResult
end