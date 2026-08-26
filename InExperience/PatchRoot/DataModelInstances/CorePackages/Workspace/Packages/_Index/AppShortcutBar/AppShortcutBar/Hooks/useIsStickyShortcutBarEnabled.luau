local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AppShortcutBar").Parent
local responsiveModule = require(parent.Responsive)
local useProperty = require(parent.GuiObjectUtils).useProperty

return function(p1, p2)
	-- upvalues: guiService (ref), userInputService (ref), responsiveModule (ref), useProperty (ref)
	p2 = p2 or userInputService
	
	return (responsiveModule.usePreferredInput() == responsiveModule.Input.Directional or useProperty(p2, "KeyboardEnabled")) and responsiveModule.useOrientation() == responsiveModule.Keys.Landscape and (useProperty(p2, "TouchEnabled") or useProperty(p1 or guiService, "ViewportDisplaySize") ~= Enum.DisplaySize.Large)
end