local DefaultTokenColorsModule = require(script.defaultTokenColors)
local _ = require(script:FindFirstAncestor("Utils").Parent.Types)
local ThemeModule = {
	tokenColors = {},
	defaultColors = DefaultTokenColorsModule
}

function ThemeModule.setColors(DefaultTokenColorsModule)
	-- upvalues: ThemeModule (copy)
	assert(type(DefaultTokenColorsModule) == "table", "Theme.updateColors expects a table")
	
	for i, value in DefaultTokenColorsModule do
		ThemeModule.tokenColors[i] = value
	end
end

function ThemeModule.getColoredRichText(p1, Text): string
	return "<font color=\"#" .. p1:ToHex() .. "\">" .. Text .. "</font>"
end

function ThemeModule.getColor(p1)
	-- upvalues: ThemeModule (copy)
	return ThemeModule.tokenColors[p1]
end

ThemeModule.setColors(DefaultTokenColorsModule)

return ThemeModule