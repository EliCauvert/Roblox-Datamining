local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UseDeviceOrientationFunction = require(Parent1.RobloxAppHooks).useDeviceOrientation
local DeviceOrientationMode = require(Parent1.RobloxAppEnums).DeviceOrientationMode
local UserInputService = require(Parent1.MockableProxyServices).UserInputService
local PlacementModule = require(Parent.Enum.Placement)
local MocksModule = require(Parent.Mocks)

return function()
	-- upvalues: UseDeviceOrientationFunction (copy), DeviceOrientationMode (copy), ReactModule (copy), UserInputService (copy), MocksModule (copy), PlacementModule (copy)
	local IsUseDeviceOrientationResultMatch = UseDeviceOrientationFunction() == DeviceOrientationMode.Portrait
	local UseStateResult, UseStateResult2 = ReactModule.useState(UserInputService.TouchEnabled)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UserInputService (upval)
		UseStateResult2(UserInputService.TouchEnabled)
		local Connection = UserInputService:GetPropertyChangedSignal("TouchEnabled"):Connect(function()
			-- upvalues: UseStateResult2 (upval), UserInputService (upval)
			UseStateResult2(UserInputService.TouchEnabled)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return if MocksModule.navBarPlacement == nil then if UseStateResult and IsUseDeviceOrientationResultMatch then PlacementModule.Bottom else PlacementModule.Left else MocksModule.navBarPlacement
end