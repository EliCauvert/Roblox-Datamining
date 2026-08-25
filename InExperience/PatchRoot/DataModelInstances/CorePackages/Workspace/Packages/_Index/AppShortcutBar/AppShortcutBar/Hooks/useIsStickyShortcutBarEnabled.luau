local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("AppShortcutBar").Parent
local responsiveModule = require(parent.Responsive)
local useProperty = require(parent.GuiObjectUtils).useProperty

return function(p0, p1)
	-- upvalues: guiService (ref), userInputService (ref), responsiveModule (ref), useProperty (ref)
	p1 = p1 or userInputService
	
	return (responsiveModule.usePreferredInput() == responsiveModule.Input.Directional or useProperty(p1, "KeyboardEnabled")) and responsiveModule.useOrientation() == responsiveModule.Keys.Landscape and (useProperty(p1, "TouchEnabled") or useProperty(p0 or guiService, "ViewportDisplaySize") ~= Enum.DisplaySize.Large)
end