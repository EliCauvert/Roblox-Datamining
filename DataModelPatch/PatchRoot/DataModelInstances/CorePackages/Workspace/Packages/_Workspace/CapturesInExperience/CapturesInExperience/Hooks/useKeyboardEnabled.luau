local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script.Parent.Parent.Parent.React)
local UseEffectFunction = ReactModule.useEffect
local UseStateFunction = ReactModule.useState

return function()
	-- upvalues: UseStateFunction (copy), UserInputService (copy), UseEffectFunction (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(UserInputService.KeyboardEnabled)
	UseEffectFunction(function()
		-- upvalues: UserInputService (upval), UseStateResult2 (copy)
		local Connection = UserInputService:GetPropertyChangedSignal("KeyboardEnabled"):Connect(function()
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(UserInputService.KeyboardEnabled)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end