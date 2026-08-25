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
	local var3 = useDeviceOrientation() == deviceOrientationMode.Portrait
	local var4, var5 = reactModule.useState(userInputService.TouchEnabled)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), userInputService (copy)
		var5(userInputService.TouchEnabled)
		local var6 = userInputService:GetPropertyChangedSignal("TouchEnabled"):Connect(function()
			-- upvalues: var5 (copy), userInputService (copy)
			var5(userInputService.TouchEnabled)
		end)
		
		return function()
			-- upvalues: var6 (ref)
			var6:Disconnect()
		end
	end, {})
	
	return if mocksModule.navBarPlacement == nil then if var4 and var3 then placementModule.Bottom else placementModule.Left else mocksModule.navBarPlacement
end