local _ = require(script:FindFirstAncestor("Utils").Parent.Types)
local utilityModule = require(script.Utility)
local themeModule = require(script.Theme)
local defaultTokenColorsModule = require(script.Theme.defaultTokenColors)
local t = { defaultLexer = require(script.Lexer) }

function t.highlight(p1, p2)
	-- upvalues: themeModule (ref), defaultTokenColorsModule (ref), utilityModule (ref), t (ref)
	if p2 then
		themeModule.setColors(p2)
	else
		themeModule.setColors(defaultTokenColorsModule)
	end
	local var1 = utilityModule.convertTabsToSpaces(utilityModule.removeControlChars(p1))
	local defaultLexer = t.defaultLexer
	local iden = themeModule.getColor("iden")
	local var2 = ""
	
	for i, v in defaultLexer.scan(var1) do
		var2 ..= themeModule.getColoredRichText(themeModule.getColor(i) or iden, utilityModule.sanitizeRichText(v))
	end
	return var2
end

function t.getTokenColor(p3)
	-- upvalues: themeModule (ref)
	return themeModule.getColor(p3)
end

return t