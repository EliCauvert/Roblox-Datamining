local CoreGui = game:GetService("CoreGui")
local Parent = script:FindFirstAncestor("Drawer").Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local DrawerModule = require(script.Parent.Drawer)
local _ = require(script.Parent.Parent.Types)

return ReactModule.memo(function(p1)
	-- upvalues: ReactRobloxModule (copy), ReactModule (copy), DrawerModule (copy), CoreGui (copy)
	return ReactRobloxModule.createPortal({
		Drawer = ReactModule.createElement("ScreenGui", {
			ClipToDeviceSafeArea = false,
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			DisplayOrder = p1.displayOrder,
			ScreenInsets = Enum.ScreenInsets.None
		}, {
			DrawerContent = ReactModule.createElement(DrawerModule, p1)
		})
	}, CoreGui)
end)