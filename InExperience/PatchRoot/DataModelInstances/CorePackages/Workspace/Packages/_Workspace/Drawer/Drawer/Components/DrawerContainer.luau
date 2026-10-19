local CoreGui = game:GetService("CoreGui")
local Parent = script:FindFirstAncestor("Drawer").Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local DrawerModule = require(script.Parent.Drawer)
local _ = require(script.Parent.Parent.Types)
local FFlagFixOverlayTopInsetForDeviceSafeInsets = require(Parent.SharedFlags).FFlagFixOverlayTopInsetForDeviceSafeInsets

return ReactModule.memo(function(p1) --[[ Line: 11 ]]
	-- upvalues: ReactRobloxModule (copy), ReactModule (copy), FFlagFixOverlayTopInsetForDeviceSafeInsets (copy), DrawerModule (copy), CoreGui (copy)
	return ReactRobloxModule.createPortal({
		Drawer = ReactModule.createElement("ScreenGui", {
			ClipToDeviceSafeArea = false,
			IgnoreGuiInset = true,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			DisplayOrder = p1.displayOrder,
			ScreenInsets = if FFlagFixOverlayTopInsetForDeviceSafeInsets and p1.deviceSafeInsets then Enum.ScreenInsets.DeviceSafeInsets else Enum.ScreenInsets.None
		}, {
			DrawerContent = ReactModule.createElement(DrawerModule, p1)
		})
	}, CoreGui)
end)