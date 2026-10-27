local ReactModule = require(script:FindFirstAncestor("MomentsCreation").Parent.React)
local UserInputService = game:GetService("UserInputService")

local function readKeyboardTop()
	-- upvalues: UserInputService (copy)
	return if UserInputService.OnScreenKeyboardVisible then UserInputService.OnScreenKeyboardPosition.Y else nil
end

return function()
	-- upvalues: ReactModule (copy), readKeyboardTop (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(readKeyboardTop)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UserInputService (upval)
		local function update()
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(if UserInputService.OnScreenKeyboardVisible then UserInputService.OnScreenKeyboardPosition.Y else nil)
		end
		
		local Connections = {
			UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(update),
			UserInputService:GetPropertyChangedSignal("OnScreenKeyboardPosition"):Connect(update),
			UserInputService:GetPropertyChangedSignal("OnScreenKeyboardSize"):Connect(update)
		}
		UseStateResult2(if UserInputService.OnScreenKeyboardVisible then UserInputService.OnScreenKeyboardPosition.Y else nil)
		
		return function()
			-- upvalues: Connections (copy)
			for _, connection in Connections do
				connection:Disconnect()
			end
		end
	end, {})
	
	return UseStateResult
end