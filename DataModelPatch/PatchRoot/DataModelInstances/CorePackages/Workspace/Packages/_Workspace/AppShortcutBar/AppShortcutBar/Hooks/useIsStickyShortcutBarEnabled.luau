local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("AppShortcutBar").Parent
local ResponsiveModule = require(Parent.Responsive)
local UsePropertyFunction = require(Parent.GuiObjectUtils).useProperty

return function(p1, p2): boolean
	-- upvalues: GuiService (copy), UserInputService (copy), ResponsiveModule (copy), UsePropertyFunction (copy)
	local P0 = p1 or GuiService
	local P1 = p2 or UserInputService
	local UsePreferredInputResult = ResponsiveModule.usePreferredInput()
	local UseOrientationResult = ResponsiveModule.useOrientation()
	local TouchEnabled = UsePropertyFunction(P1, "TouchEnabled")
	local KeyboardEnabled = UsePropertyFunction(P1, "KeyboardEnabled")
	local ViewportDisplaySize = UsePropertyFunction(P0, "ViewportDisplaySize")
	
	if (UsePreferredInputResult == ResponsiveModule.Input.Directional or KeyboardEnabled) and (UseOrientationResult == ResponsiveModule.Keys.Landscape and (TouchEnabled or ViewportDisplaySize ~= Enum.DisplaySize.Large)) then
		return true
	else
		return false
	end
end