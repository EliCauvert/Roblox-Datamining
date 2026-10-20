local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function()
	-- upvalues: UserInputService (copy), ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: UserInputService (upval)
		return if UserInputService.OnScreenKeyboardVisible then UserInputService.OnScreenKeyboardSize.Y else 0
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UserInputService (upval)
		local function update()
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(if UserInputService.OnScreenKeyboardVisible then UserInputService.OnScreenKeyboardSize.Y else 0)
		end
		
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(update)
		local Connection1 = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(update)
		UseStateResult2(if UserInputService.OnScreenKeyboardVisible then UserInputService.OnScreenKeyboardSize.Y else 0)
		
		return function()
			-- upvalues: Connection (copy), Connection1 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
		end
	end, {})
	
	return UseStateResult
end