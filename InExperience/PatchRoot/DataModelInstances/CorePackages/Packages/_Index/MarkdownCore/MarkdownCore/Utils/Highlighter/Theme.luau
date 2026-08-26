local defaultTokenColorsModule = require(script.defaultTokenColors)
local _ = require(script:FindFirstAncestor("Utils").Parent.Types)
local t = {
	tokenColors = {},
	defaultColors = defaultTokenColorsModule
}

function t.setColors(value)
	-- upvalues: t (ref)
	assert(type(value) == "table", "Theme.updateColors expects a table")
	
	for i, v in value do
		t.tokenColors[i] = v
	end
end

function t.getColoredRichText(p1, p2)
	return "<font color=\"#" .. p0:ToHex() .. "\">" .. p1 .. "</font>"
end

function t.getColor(p1)
	-- upvalues: t (ref)
	return t.tokenColors[p1]
end

t.setColors(defaultTokenColorsModule)

return t