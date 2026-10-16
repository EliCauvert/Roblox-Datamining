local ReactModule = require(script:FindFirstAncestor("MomentsCreation").Parent.React)
local UserInputService = game:GetService("UserInputService")

return function() --[[ Line: 15 | Named "useOnScreenKeyboardHeight" ]]
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	ReactModule.useEffect(function() --[[ Line: 18 ]]
		-- upvalues: UserInputService (upval), UseStateResult2 (copy)
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 19 ]]
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(if UserInputService.OnScreenKeyboardVisible then UserInputService.OnScreenKeyboardSize.Y else 0)
		end)
		
		return function() --[[ Line: 25 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end