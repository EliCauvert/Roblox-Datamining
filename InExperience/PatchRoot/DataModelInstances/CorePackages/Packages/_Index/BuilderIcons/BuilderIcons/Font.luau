local builderIconsFallback = `rbxassetid://{require(script.Parent.BuilderIconsFallback)}`

return {
	Regular = Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json", Enum.FontWeight.Regular),
	Filled = Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json", Enum.FontWeight.Bold),
	Fallback = {
		Regular = Font.new(builderIconsFallback, Enum.FontWeight.Regular),
		Filled = Font.new(builderIconsFallback, Enum.FontWeight.Bold)
	}
}