local _ = require(script:FindFirstAncestor("Utils").Parent.Types)
local utilityModule = require(script.Utility)
local themeModule = require(script.Theme)
local defaultTokenColorsModule = require(script.Theme.defaultTokenColors)
local t = { defaultLexer = require(script.Lexer) }

function t.highlight(p0, p1) --[[ line: 14 ]]
	-- upvalues: themeModule (ref), defaultTokenColorsModule (ref), utilityModule (ref), t (ref)
	if p1 then
		themeModule.setColors(p1)
	else
		themeModule.setColors(defaultTokenColorsModule)
	end
	local var4 = utilityModule.convertTabsToSpaces(utilityModule.removeControlChars(p0))
	local defaultLexer = t.defaultLexer
	local iden = themeModule.getColor("iden")
	local var6 = ""
	
	for i, v in defaultLexer.scan(var4) do
		var6 ..= themeModule.getColoredRichText(themeModule.getColor(i) or iden, utilityModule.sanitizeRichText(v))
	end
	return var6
end

function t.getTokenColor(p2) --[[ line: 35 ]]
	-- upvalues: themeModule (ref)
	return themeModule.getColor(p2)
end

return t