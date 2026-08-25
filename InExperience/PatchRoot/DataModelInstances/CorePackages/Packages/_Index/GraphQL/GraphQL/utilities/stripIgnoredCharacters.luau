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

local function stripIgnoredCharacters(p0)
	-- upvalues: isSource (ref), source (ref), lexer (ref), tokenKind (ref), isPunctuatorTokenKind (ref), string (ref), dedentBlockString (write)
	local var5 = if isSource(p0) then p0 else source.new(p0)
	local body = var5.body
	local var6 = lexer.new(var5)
	local var7 = ""
	local var8 = false
	while var6:advance().kind ~= tokenKind.EOF do
		local token = var6.token
		local kind = token.kind
		local var9 = not isPunctuatorTokenKind(token.kind)
		
		if var8 and (var9 or token.kind == tokenKind.SPREAD) then
			var7 ..= " "
		end
		local var10 = string.slice(body, token.start, token._end)
		var7 = if kind == tokenKind.BLOCK_STRING then var7 .. dedentBlockString(var10) else var7 .. var10
		var8 = var9
	end
	return var7
end

dedentBlockString = function(p1)
	-- upvalues: string (ref), dedentBlockStringValue (ref), getBlockStringIndentation (ref)
	local var11 = dedentBlockStringValue(string.slice(p1, 4, -3))
	
	if getBlockStringIndentation(var11) > 0 then
		var11 = "\n" .. var11
	end
	local charCount = utf8.len(var11)
	assert(charCount ~= nil, "invalid utf8 detected: " .. var11)
	local var13 = string.slice(var11, charCount)
	
	if (var13 == "\"" and string.slice(var11, -4) ~= "\\\"\"\"") or var13 == "\\" then
		var11 ..= "\n"
	end
	return "\"\"\"" .. var11 .. "\"\"\""
end

return { stripIgnoredCharacters = stripIgnoredCharacters }