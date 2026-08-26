local coreGuiService = game:GetService("CoreGui")
local systemScrim = script:FindFirstAncestor("SystemScrim")
local parent = systemScrim.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local systemScrimModule = require(systemScrim.SystemScrim)
local systemScrimSignalStoreModule = require(systemScrim["data-model"].SystemScrimSignalStore)

return function()
	-- upvalues: systemScrimSignalStoreModule (ref), coreGuiService (ref), reactModule (ref), systemScrimModule (ref), reactRobloxModule (ref)
	local var1 = systemScrimSignalStoreModule(false)
	local systemScrim = Instance.new("ScreenGui")
	systemScrim.Name = "SystemScrim"
	systemScrim.DisplayOrder = -2147483648
	systemScrim.IgnoreGuiInset = true
	systemScrim.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	systemScrim.ClipToDeviceSafeArea = false
	systemScrim.ScreenInsets = Enum.ScreenInsets.None
	systemScrim.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
	systemScrim.Parent = coreGuiService
	local var2 = reactRobloxModule.createRoot(systemScrim)
	var2:render(reactModule.createElement(systemScrimModule, { store = var1 }))
	
	return { root = var2, store = var1 }
end