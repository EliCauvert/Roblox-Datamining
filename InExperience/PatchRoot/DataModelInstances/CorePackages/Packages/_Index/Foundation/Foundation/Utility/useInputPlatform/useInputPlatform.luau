local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local UserInputService = require(Foundation.Utility.Wrappers.Services).UserInputService
local _ = require(Foundation.Enums.InputPlatform)
local DetectInputPlatformModule = require(script.Parent.detectInputPlatform)

return function()
	-- upvalues: ReactModule (copy), DetectInputPlatformModule (copy), UserInputService (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(DetectInputPlatformModule)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), DetectInputPlatformModule (upval), UserInputService (upval)
		local function refresh()
			-- upvalues: UseStateResult2 (upval), DetectInputPlatformModule (upval)
			UseStateResult2(DetectInputPlatformModule())
		end
		
		local GamepadConnectedConnection = UserInputService.GamepadConnected:Connect(refresh)
		local GamepadDisconnectedConnection = UserInputService.GamepadDisconnected:Connect(refresh)
		UseStateResult2(DetectInputPlatformModule())
		
		return function()
			-- upvalues: GamepadConnectedConnection (copy), GamepadDisconnectedConnection (copy)
			GamepadConnectedConnection:Disconnect()
			GamepadDisconnectedConnection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end