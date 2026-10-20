local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script.Parent.Parent.Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseStateFunction = ReactModule.useState

return function()
	-- upvalues: UseStateFunction (copy), UseEffectFunction (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	UseEffectFunction(function()
		-- upvalues: UserInputService (upval), UseStateResult2 (copy)
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function()
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(UserInputService.OnScreenKeyboardVisible)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end