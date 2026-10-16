local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function() --[[ Line: 8 | Named "useOnScreenKeyboardHeight" ]]
	-- upvalues: UserInputService (copy), ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function() --[[ Line: 9 | Named "read" ]]
		-- upvalues: UserInputService (upval)
		return if UserInputService.OnScreenKeyboardVisible then UserInputService.OnScreenKeyboardSize.Y else 0
	end)
	ReactModule.useEffect(function() --[[ Line: 18 ]]
		-- upvalues: UseStateResult2 (copy), UserInputService (upval)
		local function update() --[[ Line: 19 ]]
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(if UserInputService.OnScreenKeyboardVisible then UserInputService.OnScreenKeyboardSize.Y else 0)
		end
		
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(update)
		local Connection1 = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(update)
		UseStateResult2(if UserInputService.OnScreenKeyboardVisible then UserInputService.OnScreenKeyboardSize.Y else 0)
		
		return function() --[[ Line: 27 ]]
			-- upvalues: Connection (copy), Connection1 (copy)
			Connection:Disconnect()
			Connection1:Disconnect()
		end
	end, {})
	
	return UseStateResult
end