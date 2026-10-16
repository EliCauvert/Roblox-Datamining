local ReactModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.React)
local UserInputService = game:GetService("UserInputService")

return function() --[[ Line: 14 ]]
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	ReactModule.useEffect(function() --[[ Line: 19 ]]
		-- upvalues: UserInputService (upval), UseStateResult2 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		local function updateKeyboardState() --[[ Line: 20 ]]
			-- upvalues: UserInputService (upval), UseStateResult2 (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval)
			local OnScreenKeyboardVisible = UserInputService.OnScreenKeyboardVisible
			local Y = UserInputService.OnScreenKeyboardSize.Y
			local Y1 = UserInputService.OnScreenKeyboardPosition.Y
			UseStateResult2(OnScreenKeyboardVisible)
			UseStateResult2_1(if OnScreenKeyboardVisible then Y else 0)
			UseStateResult2_2(if OnScreenKeyboardVisible then Y1 else 0)
		end
		
		local OnScreenKeyboardVisible = UserInputService.OnScreenKeyboardVisible
		local Y = UserInputService.OnScreenKeyboardSize.Y
		local Y1 = UserInputService.OnScreenKeyboardPosition.Y
		UseStateResult2(OnScreenKeyboardVisible)
		UseStateResult2_1(if OnScreenKeyboardVisible then Y else 0)
		UseStateResult2_2(if OnScreenKeyboardVisible then Y1 else 0)
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(updateKeyboardState)
		local Connection1 = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(updateKeyboardState)
		local Connection2 = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(updateKeyboardState)
		
		return function() --[[ Line: 38 ]]
			-- upvalues: Connection (copy), Connection1 (copy), Connection2 (copy)
			if Connection then
				Connection:Disconnect()
			end
			if Connection1 then
				Connection1:Disconnect()
			end
			if Connection2 then
				Connection2:Disconnect()
			end
		end
	end, {})
	
	return {
		isKeyboardShowing = UseStateResult,
		onScreenKeyboardHeight = UseStateResult1,
		keyboardPositionY = UseStateResult3
	}
end