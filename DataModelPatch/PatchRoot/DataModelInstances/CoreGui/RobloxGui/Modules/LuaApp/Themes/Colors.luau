local Color = require(game:GetService("CorePackages").Workspace.Packages.AppCommonLib).Color
local ColorsModule = {
	Obsidian = Color.Color3FromHex(1447705),
	Carbon = Color.Color3FromHex(1645341),
	Slate = Color.Color3FromHex(2303271),
	Flint = Color.Color3FromHex(3750717),
	Graphite = Color.Color3FromHex(6645352),
	Pumice = Color.Color3FromHex(12435134),
	Black = Color3.fromRGB(0, 0, 0),
	White = Color3.fromRGB(255, 255, 255),
	Gray1 = Color.Color3FromHex(1644825),
	Gray2 = Color.Color3FromHex(7697781),
	Gray3 = Color.Color3FromHex(12105912),
	Gray4 = Color.Color3FromHex(14935011),
	Gray5 = Color.Color3FromHex(15921906),
	Gray6 = Color.Color3FromHex(16119285),
	Alabaster = Color.Color3FromHex(15725301),
	Smoke = Color.Color3FromHex(8092797),
	Ash = Color.Color3FromHex(14935528),
	BluePrimary = Color.Color3FromHex(41727),
	BlueHover = Color.Color3FromHex(3323391),
	BluePressed = Color.Color3FromHex(29885),
	BlueDisabled = Color.Color3FromHex(10083071),
	Green = Color.Color3FromHex(45167),
	Red = Color.Color3FromHex(16206674),
	Green2 = Color3.fromRGB(2, 183, 87),
	Orange = Color3.fromRGB(246, 136, 2),
	BrownWarning = Color3.fromRGB(162, 89, 1),
	ChatTopBarBluePressed = Color.Color3FromHex(29886),
	ChatTopBarWhite = Color.Color3FromHex(16777214),
	ChatTopBarSlate = Color.Color3FromHex(2303272)
}
setmetatable(ColorsModule, {
	__newindex = function(_, _, _) end,
	__index = function(_, p1)
		error("Colors table has no value: " .. tostring(p1))
	end
})

return ColorsModule