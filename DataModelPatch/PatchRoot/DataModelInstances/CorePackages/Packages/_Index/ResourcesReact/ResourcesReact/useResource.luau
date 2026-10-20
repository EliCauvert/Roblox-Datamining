local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Resources)

return function(Callback)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		return nil
	end)
	ReactModule.useLayoutEffect(function()
		-- upvalues: Callback (copy), UseStateResult2 (copy)
		local CallbackResult, CallbackResult2 = Callback()
		UseStateResult2(CallbackResult2)
		
		return function()
			-- upvalues: UseStateResult2 (upval), CallbackResult (copy)
			UseStateResult2(nil)
			CallbackResult()
		end
	end, { Callback })
	
	return UseStateResult
end