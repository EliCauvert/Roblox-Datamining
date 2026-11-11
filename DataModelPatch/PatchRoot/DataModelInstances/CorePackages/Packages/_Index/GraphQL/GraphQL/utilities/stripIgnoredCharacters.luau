local Parent = script.Parent.Parent
local Language = Parent.language
local String = require(Parent.Parent.LuauPolyfill).String
local SourceModule = require(Language.source)
local Source = SourceModule.Source
local IsSourceFunction = SourceModule.isSource
local TokenKind = require(Language.tokenKind).TokenKind
local LexerModule = require(Language.lexer)
local Lexer = LexerModule.Lexer
local IsPunctuatorTokenKindFunction = LexerModule.isPunctuatorTokenKind
local BlockStringModule = require(Language.blockString)
local DedentBlockStringValueFunction = BlockStringModule.dedentBlockStringValue
local GetBlockStringIndentationFunction = BlockStringModule.getBlockStringIndentation
local Callback = nil

local function stripIgnoredCharacters(p1): string
	-- upvalues: IsSourceFunction (copy), Source (copy), Lexer (copy), TokenKind (copy), IsPunctuatorTokenKindFunction (copy), String (copy), Callback (ref)
	local NewSource = if IsSourceFunction(p1) then p1 else Source.new(p1)
	local Body = NewSource.body
	local NewLexer = Lexer.new(NewSource)
	local Text = ""
	local v1 = false
	while NewLexer:advance().kind ~= TokenKind.EOF do
		local Token = NewLexer.token
		local Kind = Token.kind
		local Inverted = not IsPunctuatorTokenKindFunction(Token.kind)
		
		if v1 and (Inverted or Token.kind == TokenKind.SPREAD) then
			Text ..= " "
		end
		local SliceResult = String.slice(Body, Token.start, Token._end)
		
		if Kind == TokenKind.BLOCK_STRING then
			Text ..= Callback(SliceResult)
		else
			Text ..= SliceResult
		end
		v1 = Inverted
	end
	return Text
end

Callback = function(SliceResult): string
	-- upvalues: String (copy), DedentBlockStringValueFunction (copy), GetBlockStringIndentationFunction (copy)
	local DedentBlockStringValueResult = DedentBlockStringValueFunction((String.slice(SliceResult, 4, -3)))
	
	if GetBlockStringIndentationFunction(DedentBlockStringValueResult) > 0 then
		DedentBlockStringValueResult = "\n" .. DedentBlockStringValueResult
	end
	local Length = utf8.len(DedentBlockStringValueResult)
	assert(Length ~= nil, "invalid utf8 detected: " .. DedentBlockStringValueResult)
	local SliceResult1 = String.slice(DedentBlockStringValueResult, Length)
	
	if SliceResult1 == "\"" and String.slice(DedentBlockStringValueResult, -4) ~= "\\\"\"\"" or SliceResult1 == "\\" then
		DedentBlockStringValueResult ..= "\n"
	end
	return "\"\"\"" .. DedentBlockStringValueResult .. "\"\"\""
end

return { stripIgnoredCharacters = stripIgnoredCharacters }