-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:54 2026 Pacific Standard Time.

local builderIconsFallback = `rbxassetid://{require(script.Parent.BuilderIconsFallback)}`

return {
	Regular = Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json", Enum.FontWeight.Regular),
	Filled = Font.new("rbxasset://LuaPackages/Packages/_Index/BuilderIcons/BuilderIcons/BuilderIcons.json", Enum.FontWeight.Bold),
	Fallback = {
		Regular = Font.new(builderIconsFallback, Enum.FontWeight.Regular),
		Filled = Font.new(builderIconsFallback, Enum.FontWeight.Bold)
	}
}