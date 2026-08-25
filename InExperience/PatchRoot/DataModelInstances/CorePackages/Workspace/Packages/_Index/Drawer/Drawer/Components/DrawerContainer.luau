local coreGuiService = game:GetService("CoreGui")
local parent = script:FindFirstAncestor("Drawer").Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local drawerModule = require(script.Parent.Drawer)
local _ = require(script.Parent.Parent.Types)

return reactModule.memo(function(p0)
	-- upvalues: reactRobloxModule (ref), reactModule (ref), drawerModule (ref), coreGuiService (ref)
	return reactRobloxModule.createPortal({
		Drawer = reactModule.createElement("ScreenGui", {
			ClipToDeviceSafeArea = false,
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			DisplayOrder = p0.displayOrder,
			ScreenInsets = Enum.ScreenInsets.None
		}, {
			DrawerContent = reactModule.createElement(drawerModule, p0)
		})
	}, coreGuiService)
end)