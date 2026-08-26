local parent = script.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local useDeviceOrientation = require(parent_1.RobloxAppHooks).useDeviceOrientation
local deviceOrientationMode = require(parent_1.RobloxAppEnums).DeviceOrientationMode
local userInputService = require(parent_1.MockableProxyServices).UserInputService
local placementModule = require(parent.Enum.Placement)
local mocksModule = require(parent.Mocks)

return function()
	-- upvalues: useDeviceOrientation (ref), deviceOrientationMode (ref), reactModule (ref), userInputService (ref), mocksModule (ref), placementModule (ref)
	local var1 = useDeviceOrientation() == deviceOrientationMode.Portrait
	local var2, var3 = reactModule.useState(userInputService.TouchEnabled)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), userInputService (copy)
		var3(userInputService.TouchEnabled)
		local var4 = userInputService:GetPropertyChangedSignal("TouchEnabled"):Connect(function()
			-- upvalues: var3 (copy), userInputService (copy)
			var3(userInputService.TouchEnabled)
		end)
		
		return function()
			-- upvalues: var4 (ref)
			var4:Disconnect()
		end
	end, {})
	
	return if mocksModule.navBarPlacement == nil then if var2 and var1 then placementModule.Bottom else placementModule.Left else mocksModule.navBarPlacement
end