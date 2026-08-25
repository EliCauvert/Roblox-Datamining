local coreGuiService = game:GetService("CoreGui")
local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useIsSpatial = require(parent.Responsive).useIsSpatial
local fFlagProfileFixMenuNavigation = require(parent.SharedFlags).FFlagProfileFixMenuNavigation
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local inputSize = foundationModule.Enums.InputSize
local menu = foundationModule.Menu
local overlayProvider = foundationModule.OverlayProvider

local function _()
	-- upvalues: fFlagProfileFixMenuNavigation (ref), coreGuiService (ref)
	if not fFlagProfileFixMenuNavigation then
		return nil
	end
	local luaAppScreenGui = coreGuiService:FindFirstChild("LuaAppScreenGui")
	
	return if luaAppScreenGui then luaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
end

return function(p0)
	-- upvalues: fFlagProfileFixMenuNavigation (ref), useIsSpatial (ref), coreGuiService (ref), popoverSide (ref), reactModule (ref), overlayProvider (ref), menu (ref), popoverAlign (ref), inputSize (ref)
	local var4
	if not fFlagProfileFixMenuNavigation or not useIsSpatial() then
		var4 = nil
	elseif fFlagProfileFixMenuNavigation then
		local luaAppScreenGui = coreGuiService:FindFirstChild("LuaAppScreenGui")
		var4 = if luaAppScreenGui then luaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
	else
		var4 = nil
	end
	local var6 = if p0.screenSize.Y / 2 < p0.rootElementPosition.Y then popoverSide.Top else popoverSide.Bottom
	local _ = nil
	
	if var6 == popoverSide.Top then
		local var7 = p0.screenSize.X / p0.screenSize.Y
		local var8 = -(p0.screenSize.Y - p0.rootElementPosition.Y) + -20
		
		if p0.screenSize.Y > 700 and not (var7 >= 1.3 and var7 < 1.7) then
			var8 += p0.screenSize.Y * 0.05
		end
	else
		local _ = p0.rootElementPosition.Y + 60
	end
	return if fFlagProfileFixMenuNavigation then reactModule.createElement(overlayProvider, { gui = var4 }, {
		Menu = reactModule.createElement(menu, {
			align = popoverAlign.End,
			anchorRef = p0.rootElementRef,
			isOpen = p0.isOpen ~= nil or p0.isOpen,
			items = p0.buttonProps,
			onPressedOutside = p0.onDismiss,
			side = var6,
			size = inputSize.Medium,
			ref = if fFlagProfileFixMenuNavigation then p0.menuRef else nil
		})
	}) else reactModule.createElement(menu, {
		align = popoverAlign.End,
		anchorRef = p0.rootElementRef,
		isOpen = p0.isOpen ~= nil or p0.isOpen,
		items = p0.buttonProps,
		onPressedOutside = p0.onDismiss,
		side = var6,
		size = inputSize.Medium,
		ref = if fFlagProfileFixMenuNavigation then p0.menuRef else nil
	})
end