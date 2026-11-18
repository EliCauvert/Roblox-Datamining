local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)

return function()
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local function _(UserInputType): boolean
		return UserInputType == Enum.UserInputType.MouseWheel or (UserInputType == Enum.UserInputType.MouseButton1 or (UserInputType == Enum.UserInputType.MouseMovement or UserInputType == Enum.UserInputType.Keyboard))
	end
	
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): boolean
		-- upvalues: UserInputService (upval)
		local LastInputType = UserInputService:GetLastInputType()
		
		return not (LastInputType == Enum.UserInputType.MouseWheel or (LastInputType == Enum.UserInputType.MouseButton1 or (LastInputType == Enum.UserInputType.MouseMovement or LastInputType == Enum.UserInputType.Keyboard)))
	end)
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), UseStateResult2 (copy)
		local LastInputTypeChangedConnection = UserInputService.LastInputTypeChanged:Connect(function(UserInputType)
			-- upvalues: UseStateResult2 (upval)
			if UserInputType == Enum.UserInputType.Touch then
				UseStateResult2(true)
				
				return
			end
			if UserInputType == Enum.UserInputType.MouseWheel or (UserInputType == Enum.UserInputType.MouseButton1 or (UserInputType == Enum.UserInputType.MouseMovement or UserInputType == Enum.UserInputType.Keyboard)) then
				UseStateResult2(false)
			end
		end)
		
		return function()
			-- upvalues: LastInputTypeChangedConnection (copy)
			LastInputTypeChangedConnection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end