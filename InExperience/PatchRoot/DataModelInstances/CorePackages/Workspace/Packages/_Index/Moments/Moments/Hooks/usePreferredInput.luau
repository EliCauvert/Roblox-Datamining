local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)

return function() --[[ Line: 18 ]]
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UserInputService.PreferredInput)
	ReactModule.useEffect(function() --[[ Line: 21 ]]
		-- upvalues: UserInputService (upval), UseStateResult2 (copy)
		local Connection = UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 24 ]]
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(UserInputService.PreferredInput)
		end)
		
		return function() --[[ Line: 28 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end