local coreGuiService = game:GetService("CoreGui")
local systemScrim = script:FindFirstAncestor("SystemScrim")
local parent = systemScrim.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local systemScrimModule = require(systemScrim.SystemScrim)
local systemScrimSignalStoreModule = require(systemScrim["data-model"].SystemScrimSignalStore)

return function() --[[ line: 13 | named "renderSystemScrim" ]]
	-- upvalues: systemScrimSignalStoreModule (ref), coreGuiService (ref), reactModule (ref), systemScrimModule (ref), reactRobloxModule (ref)
	local var6 = systemScrimSignalStoreModule(false)
	local systemScrim = Instance.new("ScreenGui")
	systemScrim.Name = "SystemScrim"
	systemScrim.DisplayOrder = -2147483648
	systemScrim.IgnoreGuiInset = true
	systemScrim.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	systemScrim.ClipToDeviceSafeArea = false
	systemScrim.ScreenInsets = Enum.ScreenInsets.None
	systemScrim.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None
	systemScrim.Parent = coreGuiService
	local var8 = reactRobloxModule.createRoot(systemScrim)
	var8:render(reactModule.createElement(systemScrimModule, { store = var6 }))
	
	return { root = var8, store = var6 }
end