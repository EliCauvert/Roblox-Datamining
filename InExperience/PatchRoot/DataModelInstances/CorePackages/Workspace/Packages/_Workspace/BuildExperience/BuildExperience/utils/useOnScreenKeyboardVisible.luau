local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)

return function() --[[ Line: 5 | Named "useOnScreenKeyboardVisible" ]]
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UserInputService.OnScreenKeyboardVisible)
	ReactModule.useEffect(function() --[[ Line: 8 ]]
		-- upvalues: UserInputService (upval), UseStateResult2 (copy)
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 9 ]]
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(UserInputService.OnScreenKeyboardVisible)
		end)
		
		return function() --[[ Line: 13 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end