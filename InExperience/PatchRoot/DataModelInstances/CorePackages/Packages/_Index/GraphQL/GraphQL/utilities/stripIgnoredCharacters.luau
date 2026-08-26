local parent = script.Parent.Parent
local language = parent.language
local string = require(parent.Parent.LuauPolyfill).String
local sourceModule = require(language.source)
local source = sourceModule.Source
local isSource = sourceModule.isSource
local tokenKind = require(language.tokenKind).TokenKind
local lexerModule = require(language.lexer)
local lexer = lexerModule.Lexer
local isPunctuatorTokenKind = lexerModule.isPunctuatorTokenKind
local blockStringModule = require(language.blockString)
local dedentBlockStringValue = blockStringModule.dedentBlockStringValue
local getBlockStringIndentation = blockStringModule.getBlockStringIndentation
local dedentBlockString = nil

local function stripIgnoredCharacters(p1)
	-- upvalues: isSource (ref), source (ref), lexer (ref), tokenKind (ref), isPunctuatorTokenKind (ref), string (ref), dedentBlockString (write)
	local var1 = if isSource(p1) then p1 else source.new(p1)
	local body = var1.body
	local var2 = lexer.new(var1)
	local var3 = ""
	local var4 = false
	while var2:advance().kind ~= tokenKind.EOF do
		local token = var2.token
		local kind = token.kind
		local var5 = not isPunctuatorTokenKind(token.kind)
		
		if var4 and (var5 or token.kind == tokenKind.SPREAD) then
			var3 ..= " "
		end
		local var6 = string.slice(body, token.start, token._end)
		var3 = if kind == tokenKind.BLOCK_STRING then var3 .. dedentBlockString(var6) else var3 .. var10
		var4 = var5
	end
	return var3
end

dedentBlockString = function(p2)
	-- upvalues: string (ref), dedentBlockStringValue (ref), getBlockStringIndentation (ref)
	local var7 = dedentBlockStringValue(string.slice(p2, 4, -3))
	
	if getBlockStringIndentation(var7) > 0 then
		var7 = "\n" .. var11
	end
	local charCount = utf8.len(var7)
	assert(charCount ~= nil, "invalid utf8 detected: " .. var11)
	local var8 = string.slice(var7, charCount)
	
	if (var8 == "\"" and string.slice(var7, -4) ~= "\\\"\"\"") or var8 == "\\" then
		var7 ..= "\n"
	end
	return "\"\"\"" .. var11 .. "\"\"\""
end

return { stripIgnoredCharacters = stripIgnoredCharacters }