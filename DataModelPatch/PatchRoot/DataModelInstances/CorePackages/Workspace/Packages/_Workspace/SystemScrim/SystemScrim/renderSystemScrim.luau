local CoreGui = game:GetService("CoreGui")
local SystemScrim = script:FindFirstAncestor("SystemScrim")
local Parent = SystemScrim.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local SystemScrimModule = require(SystemScrim.SystemScrim)
local SystemScrimSignalStoreModule = require(SystemScrim["data-model"].SystemScrimSignalStore)

return function()
	-- upvalues: SystemScrimSignalStoreModule (copy), CoreGui (copy), ReactModule (copy), SystemScrimModule (copy), ReactRobloxModule (copy)
	local SystemScrimSignalStoreModuleResult = SystemScrimSignalStoreModule(false)
	local SystemScrim = Instance.new("ScreenGui")
	SystemScrim.Name = "SystemScrim"
	SystemScrim.DisplayOrder = -2147483648
	SystemScrim.IgnoreGuiInset = true
	SystemScrim.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	SystemScrim.ClipToDeviceSafeArea = false
	SystemScrim.ScreenInsets = Enum.ScreenInsets.None
	SystemScrim.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
	SystemScrim.Parent = CoreGui
	local Root = ReactRobloxModule.createRoot(SystemScrim)
	Root:render((ReactModule.createElement(SystemScrimModule, { store = SystemScrimSignalStoreModuleResult })))
	
	return { root = Root, store = SystemScrimSignalStoreModuleResult }
end