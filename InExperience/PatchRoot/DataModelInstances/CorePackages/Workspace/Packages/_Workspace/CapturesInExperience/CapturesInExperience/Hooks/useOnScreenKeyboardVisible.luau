local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script.Parent.Parent.Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseStateFunction = ReactModule.useState

return function() --[[ Line: 11 ]]
	-- upvalues: UseStateFunction (copy), UseEffectFunction (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	UseEffectFunction(function() --[[ Line: 14 ]]
		-- upvalues: UserInputService (upval), UseStateResult2 (copy)
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 16 ]]
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(UserInputService.OnScreenKeyboardVisible)
		end)
		
		return function() --[[ Line: 19 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end