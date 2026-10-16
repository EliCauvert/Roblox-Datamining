local ReactModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.React)
local UserInputService = game:GetService("UserInputService")
local UseEffectFunction = ReactModule.useEffect
local UseStateFunction = ReactModule.useState

return function() --[[ Line: 10 ]]
	-- upvalues: UseStateFunction (copy), UseEffectFunction (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(0)
	UseEffectFunction(function() --[[ Line: 13 ]]
		-- upvalues: UserInputService (upval), UseStateResult2 (copy)
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 15 ]]
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(UserInputService.OnScreenKeyboardVisible and UserInputService.OnScreenKeyboardSize.Y or 0)
		end)
		
		return function() --[[ Line: 20 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end