local CoreGui = game:GetService("CoreGui")
local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseIsSpatialFunction = require(Parent.Responsive).useIsSpatial
local FFlagProfileFixMenuNavigation = require(Parent.SharedFlags).FFlagProfileFixMenuNavigation
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local InputSize = FoundationModule.Enums.InputSize
local Menu = FoundationModule.Menu
local OverlayProvider = FoundationModule.OverlayProvider

local function _()
	-- upvalues: FFlagProfileFixMenuNavigation (copy), CoreGui (copy)
	if FFlagProfileFixMenuNavigation then
		local LuaAppScreenGui = CoreGui:FindFirstChild("LuaAppScreenGui")
		
		return if LuaAppScreenGui then LuaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
	else
		return nil
	end
end

return function(p1)
	-- upvalues: FFlagProfileFixMenuNavigation (copy), UseIsSpatialFunction (copy), CoreGui (copy), PopoverSide (copy), ReactModule (copy), OverlayProvider (copy), Menu (copy), PopoverAlign (copy), InputSize (copy)
	local MainAppScreenSurfaceGui = nil
	if FFlagProfileFixMenuNavigation and UseIsSpatialFunction() then
		if FFlagProfileFixMenuNavigation then
			local LuaAppScreenGui = CoreGui:FindFirstChild("LuaAppScreenGui")
			MainAppScreenSurfaceGui = if LuaAppScreenGui then LuaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
		else
			MainAppScreenSurfaceGui = nil
		end
	else
		MainAppScreenSurfaceGui = nil
	end
	local Top = if p1.screenSize.Y / 2 < p1.rootElementPosition.Y then PopoverSide.Top else PopoverSide.Bottom
	
	if Top == PopoverSide.Top then
		local XRatio = p1.screenSize.X / p1.screenSize.Y
		local v1 = -(p1.screenSize.Y - p1.rootElementPosition.Y) + -20
		
		if p1.screenSize.Y > 700 and not (XRatio >= 1.3 and XRatio < 1.7) then
			local _ = v1 + p1.screenSize.Y * 0.05
		end
	else
		local _ = p1.rootElementPosition.Y + 60
	end
	return if FFlagProfileFixMenuNavigation then ReactModule.createElement(OverlayProvider, { gui = MainAppScreenSurfaceGui }, {
		Menu = ReactModule.createElement(Menu, {
			align = PopoverAlign.End,
			anchorRef = p1.rootElementRef,
			isOpen = p1.isOpen == nil or p1.isOpen,
			items = p1.buttonProps,
			onPressedOutside = p1.onDismiss,
			side = Top,
			size = InputSize.Medium,
			ref = if FFlagProfileFixMenuNavigation then p1.menuRef else nil
		})
	}) else ReactModule.createElement(Menu, {
		align = PopoverAlign.End,
		anchorRef = p1.rootElementRef,
		isOpen = p1.isOpen == nil or p1.isOpen,
		items = p1.buttonProps,
		onPressedOutside = p1.onDismiss,
		side = Top,
		size = InputSize.Medium,
		ref = if FFlagProfileFixMenuNavigation then p1.menuRef else nil
	})
end