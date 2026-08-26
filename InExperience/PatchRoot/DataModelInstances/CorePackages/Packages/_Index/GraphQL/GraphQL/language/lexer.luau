local parent = script.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.Parent.LuauPolyfill)
local string = luauPolyfillModule.String
local isNaN = luauPolyfillModule.Number.isNaN
local httpService = game:GetService("HttpService")
local syntaxError = require(parent_1.error.syntaxError).syntaxError
local _ = require(script.Parent.source)
local token = require(parent.ast).Token
local tokenKind = require(parent.tokenKind).TokenKind
local toUnicodeStringModule = require(parent_1.luaUtils.toUnicodeString)
local dedentBlockStringValue = require(parent.blockString).dedentBlockStringValue
local readBlockString = nil
local readString = nil
local _ = nil
local char2hex = nil

local function uniCharCode(p1, p2, p3, p4)
	-- upvalues: char2hex (write)
	local var1 = char2hex(p1)
	local var2 = char2hex(p2)
	local var3 = char2hex(p3)
	local var4 = char2hex(p4)
	
	return if var1 < 0 or var2 < 0 or (var3 < 0 or var4 < 0) then -1 else bit32.bor(bit32.lshift(var1, 12), bit32.lshift(var2, 8), bit32.lshift(var3, 4), var4)
end

char2hex = function(p1)
	return if p1 >= 48 and p1 <= 57 then p1 - 48 elseif p1 >= 65 and p1 <= 70 then p1 - 55 elseif p1 >= 97 and p1 <= 102 then p1 - 87 else -1
end

local function readName(p1, p2, p3, p4, p5)
	-- upvalues: string (ref), isNaN (ref), token (ref), tokenKind (ref)
	local body = p1.body
	local var1 = string.len(body)
	local var2 = p2 + 1
	local var3 = 0
	
	local _ = function()
		-- upvalues: var2 (write), var1 (ref)
		return var2 ~= var1 + 1
	end
	
	local _ = function()
		-- upvalues: var3 (write), string (copy), body (ref), var2 (write), isNaN (copy)
		var3 = string.charCodeAt(body, var2)
		
		return not isNaN(var3)
	end
	
	local _ = function()
		-- upvalues: var3 (write)
		return var3 == 95
	end
	
	local _ = function()
		-- upvalues: var3 (write)
		return var3 >= 48 and var3 <= 57
	end
	
	local _ = function()
		-- upvalues: var3 (write)
		return var3 >= 65 and var3 <= 90
	end
	
	local _ = function()
		-- upvalues: var3 (write)
		return var3 >= 97 and var3 <= 122
	end
	
	local _ = function()
		-- upvalues: var3 (write)
		return var3 == 95 or ((var3 >= 48 and var3 <= 57) or ((var3 >= 65 and var3 <= 90) or (var3 >= 97 and var3 <= 122)))
	end
	while var2 ~= var1 + 1 do
		var3 = string.charCodeAt(body, var2)
		
		if not isNaN(var3) or var3 ~= 95 and (not (var3 >= 48 and var3 <= 57) and (not (var3 >= 65 and var3 <= 90) and not (var3 >= 97 and var3 <= 122))) then break end
		var2 += 1
	end
	return token.new(tokenKind.NAME, p2, var2, p3, p4, p5, string.slice(body, p2, var2))
end

local function readComment(p6, p7, p8, p9, p10)
	-- upvalues: string (ref), isNaN (ref), token (ref), tokenKind (ref)
	local body = p6.body
	local _ = nil
	local var4 = p7
	repeat
		var4 += 1
		local var5 = string.charCodeAt(body, var4)
	until isNaN(var5) or var5 <= 31 and var5 ~= 9
	return token.new(tokenKind.COMMENT, p7, var4, p8, p9, p10, string.slice(body, p7 + 1, var4))
end

function printCharCode(p6)
	-- upvalues: isNaN (ref), tokenKind (ref), httpService (ref), toUnicodeStringModule (ref)
	return if isNaN(p6) then tokenKind.EOF elseif p6 < 127 then httpService:JSONEncode(string.char(p6)) else toUnicodeStringModule(p6)
end

function readDigits(p6, p7, p8)
	-- upvalues: string (ref), syntaxError (ref)
	local body = p6.body
	local var4 = p7
	local var5 = p8
	
	if var5 < 48 or var5 > 57 then
		error(syntaxError(p6, var4, "Invalid number, expected digit but got: " .. printCharCode(var5) .. "."))
		
		return
	end
	repeat
		var4 += 1
		var5 = string.charCodeAt(body, var4)
	until not (var5 >= 48 and var5 <= 57)
	return var4
end

function unexpectedCharacterMessage(p6)
	return if p6 < 32 and p6 ~= 9 and (p6 ~= 10 and p6 ~= 13) then "Cannot contain the invalid character " .. printCharCode(p6) .. "." elseif p6 == 39 then "Unexpected single quote character ('), did you mean to use a double quote (\")?" else "Cannot parse the unexpected character " .. printCharCode(p6) .. "."
end

function isNameStart(p6)
	return p6 == 95 or ((p6 >= 65 and p6 <= 90) or (p6 >= 97 and p6 <= 122))
end

function readNumber(p6, p7, p8, p9, p10, p11)
	-- upvalues: string (ref), syntaxError (ref), token (ref), tokenKind (ref)
	local body = p6.body
	local var4 = p8
	local var5 = p7
	local var6 = false
	
	if var4 == 45 then
		var5 += 1
		var4 = string.charCodeAt(body, var5)
	end
	if var4 == 48 then
		var5 += 1
		var4 = string.charCodeAt(body, var5)
		
		if var4 >= 48 and var4 <= 57 then
			error(syntaxError(p6, var5, "Invalid number, unexpected digit after 0: " .. printCharCode(var4) .. "."))
		end
	else
		var5 = readDigits(p6, var5, var4)
		var4 = string.charCodeAt(body, var5)
	end
	if var4 == 46 then
		var6 = true
		var5 += 1
		var5 = readDigits(p6, var5, string.charCodeAt(body, var5))
		var4 = string.charCodeAt(body, var5)
	end
	if var4 == 69 or var4 == 101 then
		var6 = true
		var5 += 1
		var4 = string.charCodeAt(body, var5)
		
		if var4 == 43 or var4 == 45 then
			var5 += 1
			var4 = string.charCodeAt(body, var5)
		end
		var5 = readDigits(p6, var5, var4)
		var4 = string.charCodeAt(body, var5)
	end
	if var4 == 46 or isNameStart(var4) then
		error(syntaxError(p6, var5, "Invalid number, expected digit but got: " .. printCharCode(var4) .. "."))
	end
	return token.new(if var6 then tokenKind.FLOAT else tokenKind.INT, p7, var5, p9, p10, p11, string.slice(body, p7, var5))
end

local function readToken(p6, p7)
	-- upvalues: string (ref), token (ref), tokenKind (ref), readComment (ref), readBlockString (write), readString (write), readName (ref), syntaxError (ref)
	local var4, line, var5
	local source = p6.source
	local body = source.body
	local charCount = utf8.len(body)
	assert(charCount ~= nil, "invalid utf8 supplied for token")
	local _end = p7._end
	while _end <= charCount do
		var4 = string.charCodeAt(body, _end)
		line = p6.line
		var5 = _end - p6.lineStart
		
		if var4 == 65279 or var4 == 9 or (var4 == 32 or var4 == 44) then
			_end += 1
		elseif var4 == 10 then
			_end += 1
			p6.line += 1
			p6.lineStart = _end - 1
		elseif var4 == 13 then
			_end = if string.charCodeAt(body, _end + 1) == 10 then _end + 2 else _end + 1
			p6.line += 1
			p6.lineStart = _end - 1
			continue
		end
		if var4 ~= 33 then
			if var4 ~= 35 then
				if var4 ~= 36 then
					if var4 ~= 38 then
						if var4 ~= 40 then
							if var4 ~= 41 then
								if var4 == 46 then
									if string.charCodeAt(body, _end + 1) ~= 46 or string.charCodeAt(body, _end + 2) ~= 46 then
										error(syntaxError(source, _end, unexpectedCharacterMessage(var4)))
										continue
									end
									return token.new(tokenKind.SPREAD, _end, _end + 3, line, var5, p7)
								elseif var4 ~= 58 then
									if var4 ~= 61 then
										if var4 ~= 64 then
											if var4 ~= 91 then
												if var4 ~= 93 then
													if var4 ~= 123 then
														if var4 ~= 124 then
															if var4 ~= 125 then
																if var4 ~= 34 then
																	if var4 ~= 45 and var4 ~= 48 and (var4 ~= 49 and var4 ~= 50) and (var4 ~= 51 and var4 ~= 52 and (var4 ~= 53 and var4 ~= 54)) and (var4 ~= 55 and var4 ~= 56 and var4 ~= 57) then
																		if var4 ~= 65 and var4 ~= 66 and (var4 ~= 67 and var4 ~= 68) and (var4 ~= 69 and var4 ~= 70 and (var4 ~= 71 and var4 ~= 72)) and (var4 ~= 73 and var4 ~= 74 and (var4 ~= 75 and var4 ~= 76) and (var4 ~= 77 and var4 ~= 78 and (var4 ~= 79 and var4 ~= 80))) and (var4 ~= 81 and var4 ~= 82 and (var4 ~= 83 and var4 ~= 84) and (var4 ~= 85 and var4 ~= 86 and (var4 ~= 87 and var4 ~= 88)) and (var4 ~= 89 and var4 ~= 90 and (var4 ~= 95 and var4 ~= 97) and (var4 ~= 98 and var4 ~= 99 and (var4 ~= 100 and var4 ~= 101)))) and (var4 ~= 102 and var4 ~= 103 and (var4 ~= 104 and var4 ~= 105) and (var4 ~= 106 and var4 ~= 107 and (var4 ~= 108 and var4 ~= 109)) and (var4 ~= 110 and var4 ~= 111 and (var4 ~= 112 and var4 ~= 113) and (var4 ~= 114 and var4 ~= 115 and (var4 ~= 116 and var4 ~= 117))) and (var4 ~= 118 and var4 ~= 119 and (var4 ~= 120 and var4 ~= 121) and var4 ~= 122)) then
																		end
																		return readName(source, _end, line, var5, p7)
																	end
																	return readNumber(source, _end, var4, line, var5, p7)
																end
																return if string.charCodeAt(body, _end + 1) == 34 and string.charCodeAt(body, _end + 2) == 34 then readBlockString(source, _end, line, var5, p7, p6) else readString(source, _end, line, var5, p7)
															end
															return token.new(tokenKind.BRACE_R, _end, _end + 1, line, var5, p7)
														end
														return token.new(tokenKind.PIPE, _end, _end + 1, line, var5, p7)
													end
													return token.new(tokenKind.BRACE_L, _end, _end + 1, line, var5, p7)
												end
												return token.new(tokenKind.BRACKET_R, _end, _end + 1, line, var5, p7)
											end
											return token.new(tokenKind.BRACKET_L, _end, _end + 1, line, var5, p7)
										end
										return token.new(tokenKind.AT, _end, _end + 1, line, var5, p7)
									end
									return token.new(tokenKind.EQUALS, _end, _end + 1, line, var5, p7)
								end
								return token.new(tokenKind.COLON, _end, _end + 1, line, var5, p7)
							end
							return token.new(tokenKind.PAREN_R, _end, _end + 1, line, var5, p7)
						end
						return token.new(tokenKind.PAREN_L, _end, _end + 1, line, var5, p7)
					end
					return token.new(tokenKind.AMP, _end, _end + 1, line, var5, p7)
				end
				return token.new(tokenKind.DOLLAR, _end, _end + 1, line, var5, p7)
			end
			return readComment(source, _end, line, var5, p7)
		end
		return token.new(tokenKind.BANG, _end, _end + 1, line, var5, p7)
	end
	return token.new(tokenKind.EOF, charCount + 1, charCount + 1, p6.line, _end - p6.lineStart, p7)
end

local t = {}
t.__index = t

function t.new(p8)
	-- upvalues: token (ref), tokenKind (ref), t (ref)
	local var6 = token.new(tokenKind.SOF, 1, 1, 0, 0, nil)
	
	return setmetatable({
		source = p8,
		lastToken = var6,
		token = var6,
		line = 1,
		lineStart = 0
	}, t)
end

function t:advance()
	self.lastToken = self.token
	self.token = self:lookahead()
	
	return self.token
end

function t:lookahead()
	-- upvalues: tokenKind (ref), readToken (ref)
	local token = self.token
	
	if token.kind ~= tokenKind.EOF then
		repeat
			if token.next then
				token = token.next
			else
				local var6 = readToken(self, token)
				token.next = var6
				var6.prev = token
				token = var6
			end
		until token.kind ~= tokenKind.COMMENT
	end
	return token
end

local function isPunctuatorTokenKind(p8)
	-- upvalues: tokenKind (ref)
	return if p8 ~= tokenKind.BANG then if p8 ~= tokenKind.DOLLAR then if p8 ~= tokenKind.AMP then if p8 ~= tokenKind.PAREN_L then if p8 ~= tokenKind.PAREN_R then if p8 ~= tokenKind.SPREAD then if p8 ~= tokenKind.COLON then if p8 ~= tokenKind.EQUALS then if p8 ~= tokenKind.AT then if p8 ~= tokenKind.BRACKET_L then if p8 ~= tokenKind.BRACKET_R then if p8 ~= tokenKind.BRACE_L then if p8 ~= tokenKind.PIPE then p8 == tokenKind.BRACE_R else true else true else true else true else true else true else true else true else true else true else true else true else true
end

readBlockString = function(p8, p9, p10, p11, p12, p13)
	-- upvalues: isNaN (ref), string (ref), token (ref), tokenKind (ref), dedentBlockStringValue (ref), syntaxError (ref)
	local body = p8.body
	local var6 = p9 + 3
	local var7 = var6
	local _ = 0
	local var8 = ""
	while var6 <= string.len(body) and not isNaN(string.charCodeAt(body, var6)) do
		local var9 = string.charCodeAt(body, var6)
		
		if var9 ~= 34 or string.charCodeAt(body, var6 + 1) ~= 34 or string.charCodeAt(body, var6 + 2) ~= 34 then
			if var9 < 32 and var9 ~= 9 and (var9 ~= 10 and var9 ~= 13) then
				error(syntaxError(p8, var6, "Invalid character within String: " .. printCharCode(var9) .. "."))
			end
			if var9 == 10 then
				var6 += 1
				p13.line += 1
				p13.lineStart = var6 - 1
			elseif var9 == 13 then
				var6 = if string.charCodeAt(body, var6 + 1) == 10 then var6 + 2 else var6 + 1
				p13.line += 1
				p13.lineStart = var6 - 1
			elseif var9 == 92 and string.charCodeAt(body, var6 + 1) == 34 and (string.charCodeAt(body, var6 + 2) == 34 and string.charCodeAt(body, var6 + 3) == 34) then
				var8 ..= string.slice(body, var7, var6) .. "\"\"\""
				var6 += 4
				var7 = var6
			else
				var6 += 1
			end
		end
		var8 ..= string.slice(body, var7, var6)
		
		return token.new(tokenKind.BLOCK_STRING, p9, var6 + 3, p10, p11, p12, dedentBlockStringValue(var8))
	end
	error(syntaxError(p8, var6, "Unterminated string."))
end

readString = function(p14, p15, p16, p17, p18)
	-- upvalues: string (ref), isNaN (ref), token (ref), tokenKind (ref), syntaxError (ref), uniCharCode (write)
	local body = p14.body
	local charCount = utf8.len(body)
	assert(charCount ~= nil, "invalid utf8 sequence detected")
	local var10 = p15 + 1
	local var11 = var10
	local var12 = ""
	while var10 <= charCount do
		local var13 = string.charCodeAt(body, var10)
		
		if isNaN(var13) then break end
		if var13 ~= 34 then
			if var13 == 10 or var13 == 13 then break end
			if var13 < 32 and var13 ~= 9 then
				error(syntaxError(p14, var10, "Invalid character within String: " .. printCharCode(var13) .. "."))
			end
			var10 += 1
			
			if var13 ~= 92 then continue end
			var12 ..= string.slice(body, var11, var10 - 1)
			var13 = string.charCodeAt(body, var10)
			
			if var13 == 34 then
				var12 ..= "\""
			elseif var13 == 47 then
				var12 ..= "/"
			elseif var13 == 92 then
				var12 ..= "\\"
			elseif var13 == 98 then
				var12 ..= "\b"
			elseif var13 == 102 then
				var12 ..= "\f"
			elseif var13 == 110 then
				var12 ..= "\n"
			elseif var13 == 114 then
				var12 ..= "\r"
			elseif var13 == 116 then
				var12 ..= "\t"
			elseif var13 == 117 then
				local var14 = uniCharCode(string.charCodeAt(body, var10 + 1), string.charCodeAt(body, var10 + 2), string.charCodeAt(body, var10 + 3), string.charCodeAt(body, var10 + 4))
				
				if var14 < 0 then
					error(syntaxError(p14, var10, "Invalid character escape sequence: \\u" .. string.slice(body, var10 + 1, var10 + 5) .. "."))
				end
				var12 ..= utf8.char(var14)
				var10 += 4
			else
				error(syntaxError(p14, var10, "Invalid character escape sequence: \\" .. utf8.char(var13) .. "."))
			end
			var10 += 1
			var11 = var10
		end
		var12 ..= string.slice(body, var11, var10)
		
		return token.new(tokenKind.STRING, p15, var10 + 1, p16, p17, p18, var12)
	end
	error(syntaxError(p14, var10, "Unterminated string."))
end

return { Lexer = t, isPunctuatorTokenKind = isPunctuatorTokenKind }