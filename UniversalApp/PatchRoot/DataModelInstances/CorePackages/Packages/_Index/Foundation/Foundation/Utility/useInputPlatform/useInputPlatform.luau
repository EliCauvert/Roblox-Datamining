local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local userInputService = require(foundation.Utility.Wrappers.Services).UserInputService
local _ = require(foundation.Enums.InputPlatform)
local detectInputPlatformModule = require(script.Parent.detectInputPlatform)

return function()
	-- upvalues: reactModule (ref), detectInputPlatformModule (ref), userInputService (ref)
	local var1, var2 = reactModule.useState(detectInputPlatformModule)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), detectInputPlatformModule (copy), userInputService (copy)
		local function refresh()
			-- upvalues: var2 (copy), detectInputPlatformModule (copy)
			var2(detectInputPlatformModule())
		end
		
		local gamepadConnectedConnection = userInputService.GamepadConnected:Connect(refresh)
		local gamepadDisconnectedConnection = userInputService.GamepadDisconnected:Connect(refresh)
		var2(detectInputPlatformModule())
		
		return function()
			-- upvalues: gamepadConnectedConnection (ref), gamepadDisconnectedConnection (ref)
			gamepadConnectedConnection:Disconnect()
			gamepadDisconnectedConnection:Disconnect()
		end
	end, {})
	
	return var1
end