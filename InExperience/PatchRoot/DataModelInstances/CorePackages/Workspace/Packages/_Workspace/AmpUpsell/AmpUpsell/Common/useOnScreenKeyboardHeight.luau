local ReactModule = require(script:FindFirstAncestor("AmpUpsell").Parent.React)
local UserInputService = game:GetService("UserInputService")
local UseEffectFunction = ReactModule.useEffect
local UseStateFunction = ReactModule.useState

return function() --[[ Line: 9 ]]
	-- upvalues: UseStateFunction (copy), UseEffectFunction (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(0)
	UseEffectFunction(function() --[[ Line: 12 ]]
		-- upvalues: UserInputService (upval), UseStateResult2 (copy)
		local Connection = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):Connect(function() --[[ Line: 14 ]]
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(UserInputService.OnScreenKeyboardVisible and UserInputService.OnScreenKeyboardSize.Y or 0)
		end)
		
		return function() --[[ Line: 19 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end