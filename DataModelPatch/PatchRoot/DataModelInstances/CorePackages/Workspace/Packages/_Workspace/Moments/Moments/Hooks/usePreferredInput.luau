local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)

return function()
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UserInputService.PreferredInput)
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), UseStateResult2 (copy)
		local Connection = UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function()
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(UserInputService.PreferredInput)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end