local color = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Color
local t = {
	Obsidian = color.Color3FromHex(1579291),
	Carbon = color.Color3FromHex(2040099),
	Slate = color.Color3FromHex(2303271),
	Flint = color.Color3FromHex(3750717),
	Graphite = color.Color3FromHex(6645352),
	Pumice = color.Color3FromHex(12435134),
	Black = Color3.fromRGB(0, 0, 0),
	White = Color3.fromRGB(255, 255, 255),
	Gray1 = color.Color3FromHex(1644825),
	Gray2 = color.Color3FromHex(7697781),
	Gray4 = color.Color3FromHex(14935011),
	GrayBackground = color.Color3FromHex(14211288),
	Green = color.Color3FromHex(45167),
	DisabledGreen = color.Color3FromHex(10273956)
}
setmetatable(t, {
	__newindex = function(_, _, _) end,
	__index = function(_, p1)
		error("Colors table has no value: " .. tostring(p1))
	end
})

return t