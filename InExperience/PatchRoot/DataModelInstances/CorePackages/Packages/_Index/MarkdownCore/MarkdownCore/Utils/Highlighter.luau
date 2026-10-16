local _ = require(script:FindFirstAncestor("Utils").Parent.Types)
local UtilityModule = require(script.Utility)
local ThemeModule = require(script.Theme)
local DefaultTokenColorsModule = require(script.Theme.defaultTokenColors)
local HighlighterModule = { defaultLexer = require(script.Lexer) }

function HighlighterModule.highlight(p1, p2): string --[[ Line: 14 ]]
	-- upvalues: ThemeModule (copy), DefaultTokenColorsModule (copy), UtilityModule (copy), HighlighterModule (copy)
	if p2 then
		ThemeModule.setColors(p2)
	else
		ThemeModule.setColors(DefaultTokenColorsModule)
	end
	local IdenColor = ThemeModule.getColor("iden")
	local Text = ""
	
	for i, value in HighlighterModule.defaultLexer.scan((UtilityModule.convertTabsToSpaces(UtilityModule.removeControlChars(p1)))) do
		Text ..= ThemeModule.getColoredRichText(ThemeModule.getColor(i) or IdenColor, UtilityModule.sanitizeRichText(value))
	end
	return Text
end

function HighlighterModule.getTokenColor(p3) --[[ Line: 35 ]]
	-- upvalues: ThemeModule (copy)
	return ThemeModule.getColor(p3)
end

return HighlighterModule