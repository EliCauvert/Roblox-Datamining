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

return function(p1)
	-- upvalues: fFlagProfileFixMenuNavigation (ref), useIsSpatial (ref), coreGuiService (ref), popoverSide (ref), reactModule (ref), overlayProvider (ref), menu (ref), popoverAlign (ref), inputSize (ref)
	local var1
	if not fFlagProfileFixMenuNavigation or not useIsSpatial() then
		var1 = nil
	elseif fFlagProfileFixMenuNavigation then
		local luaAppScreenGui = coreGuiService:FindFirstChild("LuaAppScreenGui")
		var1 = if luaAppScreenGui then luaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
	else
		var1 = nil
	end
	local var2 = if p1.screenSize.Y / 2 < p1.rootElementPosition.Y then popoverSide.Top else popoverSide.Bottom
	local _ = nil
	
	if var2 == popoverSide.Top then
		local var3 = p1.screenSize.X / p1.screenSize.Y
		local var4 = -(p1.screenSize.Y - p1.rootElementPosition.Y) + -20
		
		if p1.screenSize.Y > 700 and not (var3 >= 1.3 and var3 < 1.7) then
			var4 += p1.screenSize.Y * 0.05
		end
	else
		local _ = p1.rootElementPosition.Y + 60
	end
	return if fFlagProfileFixMenuNavigation then reactModule.createElement(overlayProvider, { gui = var1 }, {
		Menu = reactModule.createElement(menu, {
			align = popoverAlign.End,
			anchorRef = p1.rootElementRef,
			isOpen = p1.isOpen ~= nil or p1.isOpen,
			items = p1.buttonProps,
			onPressedOutside = p1.onDismiss,
			side = var2,
			size = inputSize.Medium,
			ref = if fFlagProfileFixMenuNavigation then p1.menuRef else nil
		})
	}) else reactModule.createElement(menu, {
		align = popoverAlign.End,
		anchorRef = p1.rootElementRef,
		isOpen = p1.isOpen ~= nil or p1.isOpen,
		items = p1.buttonProps,
		onPressedOutside = p1.onDismiss,
		side = var2,
		size = inputSize.Medium,
		ref = if fFlagProfileFixMenuNavigation then p1.menuRef else nil
	})
end