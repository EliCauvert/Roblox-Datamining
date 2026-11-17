local FoundationModule = require(script:FindFirstAncestor("Style").Parent.Foundation)
local ColorMode = FoundationModule.Enums.ColorMode
local ThemeName = FoundationModule.Enums.ThemeName
local config = {
	["Color.ActionEmphasis.Background.Color3"] = Color3.fromHex("#137F1F"),
	["Color.ActionSoftEmphasis.Background.Color3"] = Color3.fromHex("#137F1F"),
	["Color.ActionSoftEmphasis.Foreground.Color3"] = Color3.fromHex("#E2F8E3")
}
local config1 = {
	["Color.ActionEmphasis.Background.Color3"] = Color3.fromHex("#12891D"),
	["Color.ActionEmphasis.Foreground.Color3"] = Color3.fromHex("#FFFFFF"),
	["Color.ActionSoftEmphasis.Background.Color3"] = Color3.fromHex("#12891D"),
	["Color.ActionSoftEmphasis.Foreground.Color3"] = Color3.fromHex("#022708")
}

return function(Classic, Light)
	-- upvalues: ThemeName (copy), ColorMode (copy), config1 (copy), config (copy)
	return if Classic == ThemeName.Classic then if Light == ColorMode.Light then config1 else config else nil
end