local Parent = script.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.Parent.LuauPolyfill)
local String1 = LuauPolyfillModule.String
local IsNaNFunction = LuauPolyfillModule.Number.isNaN
local HttpService = game:GetService("HttpService")
local SyntaxErrorFunction = require(Parent1.error.syntaxError).syntaxError
local _ = require(script.Parent.source)
local Token = require(Parent.ast).Token
local TokenKind = require(Parent.tokenKind).TokenKind
local ToUnicodeStringModule = require(Parent1.luaUtils.toUnicodeString)
local DedentBlockStringValueFunction = require(Parent.blockString).dedentBlockStringValue
local Callback1 = nil
local Callback2 = nil
local uniCharCode = nil
local Callback = nil

uniCharCode = function(CharCodeAtResult, CharCodeAtResult1, CharCodeAtResult2, CharCodeAtResult3): number --[[ Line: 88 | Named "uniCharCode" ]]
	-- upvalues: Callback (ref)
	local CallbackResult: number = Callback(CharCodeAtResult)
	local CallbackResult1: number = Callback(CharCodeAtResult1)
	local CallbackResult2: number = Callback(CharCodeAtResult2)
	local CallbackResult3: number = Callback(CharCodeAtResult3)
	
	return if CallbackResult < 0 or CallbackResult1 < 0 or CallbackResult2 < 0 or CallbackResult3 < 0 then -1 else bit32.bor(bit32.lshift(CallbackResult, 12), bit32.lshift(CallbackResult1, 8), bit32.lshift(CallbackResult2, 4), CallbackResult3)
end

Callback = function(p1: number): number --[[ Line: 108 | Named "char2hex" ]]
	return if p1 >= 48 and p1 <= 57 then p1 - 48 elseif p1 >= 65 and p1 <= 70 then p1 - 55 elseif p1 >= 97 and p1 <= 102 then p1 - 87 else -1
end

local function readName(Source, End: number, Line, p1, p2) --[[ Line: 126 ]]
	-- upvalues: String1 (copy), IsNaNFunction (copy), Token (copy), TokenKind (copy)
	local Body: string = Source.body
	local Length = string.len(Body)
	local NewEnd = End + 1
	local CharCodeAtResult = 0
	
	local function _(): boolean --[[ Line: 132 ]]
		-- upvalues: NewEnd (ref), Length (copy)
		return NewEnd ~= Length + 1
	end
	
	local _ = function(): boolean --[[ Line: 135 ]]
		-- upvalues: CharCodeAtResult (ref), String1 (upval), Body (copy), NewEnd (ref), IsNaNFunction (upval)
		CharCodeAtResult = String1.charCodeAt(Body, NewEnd)
		
		return not IsNaNFunction(CharCodeAtResult)
	end
	
	local _ = function(): boolean --[[ Line: 139 ]]
		-- upvalues: CharCodeAtResult (ref)
		return CharCodeAtResult == 95
	end
	
	local _ = function(): boolean --[[ Line: 142 ]]
		-- upvalues: CharCodeAtResult (ref)
		return CharCodeAtResult >= 48 and CharCodeAtResult <= 57
	end
	
	local _ = function(): boolean --[[ Line: 145 ]]
		-- upvalues: CharCodeAtResult (ref)
		return CharCodeAtResult >= 65 and CharCodeAtResult <= 90
	end
	
	local _ = function(): boolean --[[ Line: 148 ]]
		-- upvalues: CharCodeAtResult (ref)
		return CharCodeAtResult >= 97 and CharCodeAtResult <= 122
	end
	
	local _ = function(): boolean --[[ Line: 151 ]]
		-- upvalues: CharCodeAtResult (ref)
		return CharCodeAtResult == 95 or (CharCodeAtResult >= 48 and CharCodeAtResult <= 57 or (CharCodeAtResult >= 65 and CharCodeAtResult <= 90 or CharCodeAtResult >= 97 and CharCodeAtResult <= 122))
	end
	while NewEnd ~= Length + 1 do
		CharCodeAtResult = String1.charCodeAt(Body, NewEnd)
		
		if IsNaNFunction(CharCodeAtResult) or CharCodeAtResult ~= 95 and ((CharCodeAtResult < 48 or CharCodeAtResult > 57) and ((CharCodeAtResult < 65 or CharCodeAtResult > 90) and (CharCodeAtResult < 97 or CharCodeAtResult > 122))) then break end
		NewEnd += 1
	end
	return Token.new(TokenKind.NAME, End, NewEnd, Line, p1, p2, String1.slice(Body, End, NewEnd))
end

local function readComment(Source, End: number, Line, p3, p4) --[[ Line: 179 ]]
	-- upvalues: String1 (copy), IsNaNFunction (copy), Token (copy), TokenKind (copy)
	local Body = Source.body
	local Count: number = End
	repeat
		Count += 1
		local CharCodeAtResult = String1.charCodeAt(Body, Count)
	until IsNaNFunction(CharCodeAtResult) or CharCodeAtResult <= 31 and CharCodeAtResult ~= 9
	return Token.new(TokenKind.COMMENT, End, Count, Line, p3, p4, String1.slice(Body, End + 1, Count))
end

function printCharCode(p3: number) --[[ Line: 201 ]]
	-- upvalues: IsNaNFunction (copy), TokenKind (copy), HttpService (copy), ToUnicodeStringModule (copy)
	return if IsNaNFunction(p3) then TokenKind.EOF elseif p3 < 127 then HttpService:JSONEncode((string.char(p3))) else ToUnicodeStringModule(p3)
end

function readDigits(p3, Count, CharCodeAtResult): number? --[[ Line: 220 ]]
	-- upvalues: String1 (copy), SyntaxErrorFunction (copy)
	local Body = p3.body
	local Count1: number = Count
	local CharCodeAtResult1 = CharCodeAtResult
	
	if CharCodeAtResult1 < 48 or CharCodeAtResult1 > 57 then
		error(SyntaxErrorFunction(p3, Count1, "Invalid number, expected digit but got: " .. printCharCode(CharCodeAtResult1) .. "."))
		
		return
	end
	repeat
		Count1 += 1
		CharCodeAtResult1 = String1.charCodeAt(Body, Count1)
	until CharCodeAtResult1 < 48 or CharCodeAtResult1 > 57
	return Count1
end

function unexpectedCharacterMessage(p3: number): string --[[ Line: 245 ]]
	return if p3 < 32 and p3 ~= 9 and p3 ~= 10 and p3 ~= 13 then "Cannot contain the invalid character " .. printCharCode(p3) .. "." elseif p3 == 39 then "Unexpected single quote character ('), did you mean to use a double quote (\")?" else "Cannot parse the unexpected character " .. printCharCode(p3) .. "."
end

function isNameStart(p3: number): boolean --[[ Line: 259 ]]
	return p3 == 95 or (p3 >= 65 and p3 <= 90 or p3 >= 97 and p3 <= 122)
end

function readNumber(p3, Count, CharCodeAtResult, p4, p5, p6) --[[ Line: 274 ]]
	-- upvalues: String1 (copy), SyntaxErrorFunction (copy), Token (copy), TokenKind (copy)
	local Body = p3.body
	local CharCodeAtResult1 = CharCodeAtResult
	local Count1: number = Count
	local Flag = false
	
	if CharCodeAtResult1 == 45 then
		Count1 += 1
		CharCodeAtResult1 = String1.charCodeAt(Body, Count1)
	end
	local NewCount = nil
	local CharCodeAtResult2 = nil
	if CharCodeAtResult1 == 48 then
		NewCount = Count1 + 1
		CharCodeAtResult2 = String1.charCodeAt(Body, NewCount)
		
		if CharCodeAtResult2 >= 48 and CharCodeAtResult2 <= 57 then
			error(SyntaxErrorFunction(p3, NewCount, "Invalid number, unexpected digit after 0: " .. printCharCode(CharCodeAtResult2) .. "."))
		end
	else
		NewCount = readDigits(p3, Count1, CharCodeAtResult1)
		CharCodeAtResult2 = String1.charCodeAt(Body, NewCount)
	end
	if CharCodeAtResult2 == 46 then
		Flag = true
		local NewNewCount = NewCount + 1
		NewCount = readDigits(p3, NewNewCount, (String1.charCodeAt(Body, NewNewCount)))
		CharCodeAtResult2 = String1.charCodeAt(Body, NewCount)
	end
	if CharCodeAtResult2 == 69 or CharCodeAtResult2 == 101 then
		Flag = true
		local NewNewCount = NewCount + 1
		local CharCodeAtResult3 = String1.charCodeAt(Body, NewNewCount)
		
		if CharCodeAtResult3 == 43 or CharCodeAtResult3 == 45 then
			NewNewCount += 1
			CharCodeAtResult3 = String1.charCodeAt(Body, NewNewCount)
		end
		NewCount = readDigits(p3, NewNewCount, CharCodeAtResult3)
		CharCodeAtResult2 = String1.charCodeAt(Body, NewCount)
	end
	if CharCodeAtResult2 == 46 or isNameStart(CharCodeAtResult2) then
		error(SyntaxErrorFunction(p3, NewCount, "Invalid number, expected digit but got: " .. printCharCode(CharCodeAtResult2) .. "."))
	end
	return Token.new(Flag and TokenKind.FLOAT or TokenKind.INT, Count, NewCount, p4, p5, p6, String1.slice(Body, Count, NewCount))
end

local function readToken(p3, Token1) --[[ Line: 359 ]]
	-- upvalues: String1 (copy), Token (copy), TokenKind (copy), readComment (copy), Callback1 (ref), Callback2 (ref), readName (copy), SyntaxErrorFunction (copy)
	local Source = p3.source
	local Body = Source.body
	local Length = utf8.len(Body)
	assert(Length ~= nil, "invalid utf8 supplied for token")
	local End = Token1._end
	local CharCodeAtResult = nil
	local Line = nil
	local EndDelta = nil
	while End <= Length do
		CharCodeAtResult = String1.charCodeAt(Body, End)
		Line = p3.line
		EndDelta = End - p3.lineStart
		
		if CharCodeAtResult == 65279 or CharCodeAtResult == 9 or CharCodeAtResult == 32 or CharCodeAtResult == 44 then
			End += 1
		elseif CharCodeAtResult == 10 then
			End += 1
			p3.line += 1
			p3.lineStart = End - 1
		elseif CharCodeAtResult == 13 then
			if String1.charCodeAt(Body, End + 1) == 10 then
				End += 2
			else
				End += 1
			end
			p3.line += 1
			p3.lineStart = End - 1
		else
			if CharCodeAtResult == 33 then
				return Token.new(TokenKind.BANG, End, End + 1, Line, EndDelta, Token1)
			end
			if CharCodeAtResult == 35 then
				return readComment(Source, End, Line, EndDelta, Token1)
			end
			if CharCodeAtResult == 36 then
				return Token.new(TokenKind.DOLLAR, End, End + 1, Line, EndDelta, Token1)
			end
			if CharCodeAtResult == 38 then
				return Token.new(TokenKind.AMP, End, End + 1, Line, EndDelta, Token1)
			end
			if CharCodeAtResult == 40 then
				return Token.new(TokenKind.PAREN_L, End, End + 1, Line, EndDelta, Token1)
			end
			if CharCodeAtResult == 41 then
				return Token.new(TokenKind.PAREN_R, End, End + 1, Line, EndDelta, Token1)
			end
			if CharCodeAtResult == 46 then
				if String1.charCodeAt(Body, End + 1) == 46 and String1.charCodeAt(Body, End + 2) == 46 then
					return Token.new(TokenKind.SPREAD, End, End + 3, Line, EndDelta, Token1)
				end
			else
				if CharCodeAtResult == 58 then
					return Token.new(TokenKind.COLON, End, End + 1, Line, EndDelta, Token1)
				end
				if CharCodeAtResult == 61 then
					return Token.new(TokenKind.EQUALS, End, End + 1, Line, EndDelta, Token1)
				end
				if CharCodeAtResult == 64 then
					return Token.new(TokenKind.AT, End, End + 1, Line, EndDelta, Token1)
				end
				if CharCodeAtResult == 91 then
					return Token.new(TokenKind.BRACKET_L, End, End + 1, Line, EndDelta, Token1)
				end
				if CharCodeAtResult == 93 then
					return Token.new(TokenKind.BRACKET_R, End, End + 1, Line, EndDelta, Token1)
				end
				if CharCodeAtResult == 123 then
					return Token.new(TokenKind.BRACE_L, End, End + 1, Line, EndDelta, Token1)
				end
				if CharCodeAtResult == 124 then
					return Token.new(TokenKind.PIPE, End, End + 1, Line, EndDelta, Token1)
				end
				if CharCodeAtResult == 125 then
					return Token.new(TokenKind.BRACE_R, End, End + 1, Line, EndDelta, Token1)
				end
				if CharCodeAtResult == 34 then
					return if String1.charCodeAt(Body, End + 1) == 34 and String1.charCodeAt(Body, End + 2) == 34 then Callback1(Source, End, Line, EndDelta, Token1, p3) else Callback2(Source, End, Line, EndDelta, Token1)
				end
				if CharCodeAtResult == 45 or CharCodeAtResult == 48 or CharCodeAtResult == 49 or CharCodeAtResult == 50 or CharCodeAtResult == 51 or CharCodeAtResult == 52 or CharCodeAtResult == 53 or CharCodeAtResult == 54 or CharCodeAtResult == 55 or CharCodeAtResult == 56 or CharCodeAtResult == 57 then
					return readNumber(Source, End, CharCodeAtResult, Line, EndDelta, Token1)
				end
				if CharCodeAtResult == 65 or CharCodeAtResult == 66 or CharCodeAtResult == 67 or CharCodeAtResult == 68 or CharCodeAtResult == 69 or CharCodeAtResult == 70 or CharCodeAtResult == 71 or CharCodeAtResult == 72 or CharCodeAtResult == 73 or CharCodeAtResult == 74 or CharCodeAtResult == 75 or CharCodeAtResult == 76 or CharCodeAtResult == 77 or CharCodeAtResult == 78 or CharCodeAtResult == 79 or CharCodeAtResult == 80 or CharCodeAtResult == 81 or CharCodeAtResult == 82 or CharCodeAtResult == 83 or CharCodeAtResult == 84 or CharCodeAtResult == 85 or CharCodeAtResult == 86 or CharCodeAtResult == 87 or CharCodeAtResult == 88 or CharCodeAtResult == 89 or CharCodeAtResult == 90 or CharCodeAtResult == 95 or CharCodeAtResult == 97 or CharCodeAtResult == 98 or CharCodeAtResult == 99 or CharCodeAtResult == 100 or CharCodeAtResult == 101 or CharCodeAtResult == 102 or CharCodeAtResult == 103 or CharCodeAtResult == 104 or CharCodeAtResult == 105 or CharCodeAtResult == 106 or CharCodeAtResult == 107 or CharCodeAtResult == 108 or CharCodeAtResult == 109 or CharCodeAtResult == 110 or CharCodeAtResult == 111 or CharCodeAtResult == 112 or CharCodeAtResult == 113 or CharCodeAtResult == 114 or CharCodeAtResult == 115 or CharCodeAtResult == 116 or CharCodeAtResult == 117 or CharCodeAtResult == 118 or CharCodeAtResult == 119 or CharCodeAtResult == 120 or CharCodeAtResult == 121 or CharCodeAtResult == 122 then
					return readName(Source, End, Line, EndDelta, Token1)
				end
			end
			error(SyntaxErrorFunction(Source, End, unexpectedCharacterMessage(CharCodeAtResult)))
		end
	end
	return Token.new(TokenKind.EOF, Length + 1, Length + 1, p3.line, End - p3.lineStart, Token1)
end

local Module = {}
Module.__index = Module

function Module.new(Source) --[[ Line: 558 ]]
	-- upvalues: Token (copy), TokenKind (copy), Module (copy)
	local NewToken = Token.new(TokenKind.SOF, 1, 1, 0, 0, nil)
	
	return (setmetatable({
		source = Source,
		lastToken = NewToken,
		token = NewToken,
		line = 1,
		lineStart = 0
	}, Module))
end

function Module:advance() --[[ Line: 571 ]]
	self.lastToken = self.token
	self.token = self:lookahead()
	
	return self.token
end

function Module:lookahead() --[[ Line: 577 ]]
	-- upvalues: TokenKind (copy), readToken (copy)
	local Token = self.token
	
	if Token.kind ~= TokenKind.EOF then
		repeat
			if Token.next then
				Token = Token.next
			else
				local Token1 = readToken(self, Token)
				Token.next = Token1
				Token1.prev = Token
				Token = Token1
			end
		until Token.kind ~= TokenKind.COMMENT
	end
	return Token
end

Callback1 = function(Source, End: number, Line, p4, p5, p6) --[[ Line: 623 | Named "readBlockString" ]]
	-- upvalues: IsNaNFunction (copy), String1 (copy), Token (copy), TokenKind (copy), DedentBlockStringValueFunction (copy), SyntaxErrorFunction (copy)
	local Body = Source.body
	local NewEnd = End + 3
	local Count: number = NewEnd
	local Text = ""
	while NewEnd <= string.len(Body) and not IsNaNFunction(String1.charCodeAt(Body, NewEnd)) do
		local CharCodeAtResult: number = String1.charCodeAt(Body, NewEnd)
		
		if CharCodeAtResult == 34 and String1.charCodeAt(Body, NewEnd + 1) == 34 and String1.charCodeAt(Body, NewEnd + 2) == 34 then
			Text ..= String1.slice(Body, Count, NewEnd)
			
			return Token.new(TokenKind.BLOCK_STRING, End, NewEnd + 3, Line, p4, p5, DedentBlockStringValueFunction(Text))
		end
		if CharCodeAtResult < 32 and CharCodeAtResult ~= 9 and CharCodeAtResult ~= 10 and CharCodeAtResult ~= 13 then
			error(SyntaxErrorFunction(Source, NewEnd, "Invalid character within String: " .. printCharCode(CharCodeAtResult) .. "."))
		end
		if CharCodeAtResult == 10 then
			NewEnd += 1
			p6.line += 1
			p6.lineStart = NewEnd - 1
		elseif CharCodeAtResult == 13 then
			if String1.charCodeAt(Body, NewEnd + 1) == 10 then
				NewEnd += 2
			else
				NewEnd += 1
			end
			p6.line += 1
			p6.lineStart = NewEnd - 1
		elseif CharCodeAtResult == 92 and String1.charCodeAt(Body, NewEnd + 1) == 34 and String1.charCodeAt(Body, NewEnd + 2) == 34 and String1.charCodeAt(Body, NewEnd + 3) == 34 then
			Text ..= String1.slice(Body, Count, NewEnd) .. "\"\"\""
			NewEnd += 4
			Count = NewEnd
		else
			NewEnd += 1
		end
	end
	error(SyntaxErrorFunction(Source, NewEnd, "Unterminated string."))
end

Callback2 = function(Source, End: number, Line, p7, p8) --[[ Line: 697 | Named "readString" ]]
	-- upvalues: String1 (copy), IsNaNFunction (copy), Token (copy), TokenKind (copy), SyntaxErrorFunction (copy), uniCharCode (ref)
	local Body = Source.body
	local Length = utf8.len(Body)
	assert(Length ~= nil, "invalid utf8 sequence detected")
	local NewEnd = End + 1
	local Count: number = NewEnd
	local Text = ""
	while NewEnd <= Length do
		local CharCodeAtResult: number = String1.charCodeAt(Body, NewEnd)
		
		if IsNaNFunction(CharCodeAtResult) then break end
		if CharCodeAtResult == 34 then
			Text ..= String1.slice(Body, Count, NewEnd)
			
			return Token.new(TokenKind.STRING, End, NewEnd + 1, Line, p7, p8, Text)
		end
		if CharCodeAtResult == 10 or CharCodeAtResult == 13 then break end
		if CharCodeAtResult < 32 and CharCodeAtResult ~= 9 then
			error(SyntaxErrorFunction(Source, NewEnd, "Invalid character within String: " .. printCharCode(CharCodeAtResult) .. "."))
		end
		NewEnd += 1
		
		if CharCodeAtResult ~= 92 then continue end
		Text ..= String1.slice(Body, Count, NewEnd - 1)
		local CharCodeAtResult1 = String1.charCodeAt(Body, NewEnd)
		
		if CharCodeAtResult1 == 34 then
			Text ..= "\""
		elseif CharCodeAtResult1 == 47 then
			Text ..= "/"
		elseif CharCodeAtResult1 == 92 then
			Text ..= "\\"
		elseif CharCodeAtResult1 == 98 then
			Text ..= "\b"
		elseif CharCodeAtResult1 == 102 then
			Text ..= "\f"
		elseif CharCodeAtResult1 == 110 then
			Text ..= "\n"
		elseif CharCodeAtResult1 == 114 then
			Text ..= "\r"
		elseif CharCodeAtResult1 == 116 then
			Text ..= "\t"
		elseif CharCodeAtResult1 == 117 then
			local UniCharCodeResult: number = uniCharCode(String1.charCodeAt(Body, NewEnd + 1), String1.charCodeAt(Body, NewEnd + 2), String1.charCodeAt(Body, NewEnd + 3), String1.charCodeAt(Body, NewEnd + 4))
			
			if UniCharCodeResult < 0 then
				error(SyntaxErrorFunction(Source, NewEnd, "Invalid character escape sequence: \\u" .. String1.slice(Body, NewEnd + 1, NewEnd + 5) .. "."))
			end
			Text ..= utf8.char(UniCharCodeResult)
			NewEnd += 4
		else
			error(SyntaxErrorFunction(Source, NewEnd, "Invalid character escape sequence: \\" .. utf8.char(CharCodeAtResult1) .. "."))
		end
		NewEnd += 1
		Count = NewEnd
	end
	error(SyntaxErrorFunction(Source, NewEnd, "Unterminated string."))
end

return {
	Lexer = Module,
	isPunctuatorTokenKind = function(AMP): boolean --[[ Line: 600 ]]
		-- upvalues: TokenKind (copy)
		return AMP == TokenKind.BANG or (AMP == TokenKind.DOLLAR or (AMP == TokenKind.AMP or (AMP == TokenKind.PAREN_L or (AMP == TokenKind.PAREN_R or (AMP == TokenKind.SPREAD or (AMP == TokenKind.COLON or (AMP == TokenKind.EQUALS or (AMP == TokenKind.AT or (AMP == TokenKind.BRACKET_L or (AMP == TokenKind.BRACKET_R or (AMP == TokenKind.BRACE_L or (AMP == TokenKind.PIPE or AMP == TokenKind.BRACE_R))))))))))))
	end
}