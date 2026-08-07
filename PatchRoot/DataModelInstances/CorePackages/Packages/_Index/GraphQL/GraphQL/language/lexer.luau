-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:35 2026 Pacific Standard Time.

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

local function uniCharCode(p0, p1, p2, p3) --[[ line: 88 ]]
	-- upvalues: char2hex (write)
	local var12 = char2hex(p0)
	local var13 = char2hex(p1)
	local var14 = char2hex(p2)
	local var15 = char2hex(p3)
	
	return if var12 < 0 or var13 < 0 or (var14 < 0 or var15 < 0) then -1 else bit32.bor(bit32.lshift(var12, 12), bit32.lshift(var13, 8), bit32.lshift(var14, 4), var15)
end

char2hex = function(p4) --[[ line: 108 | named "char2hex" ]]
	return if p4 >= 48 and p4 <= 57 then p4 - 48 elseif p4 >= 65 and p4 <= 70 then p4 - 55 elseif p4 >= 97 and p4 <= 102 then p4 - 87 else -1
end

local function readName(p5, p6, p7, p8, p9) --[[ line: 126 ]]
	-- upvalues: string (ref), isNaN (ref), token (ref), tokenKind (ref)
	local body = p5.body
	local var16 = string.len(body)
	local var17 = p6 + 1
	local var18 = 0
	
	local _ = function() --[[ line: 132 ]]
		-- upvalues: var17 (write), var16 (ref)
		return var17 ~= var16 + 1
	end
	
	local _ = function() --[[ line: 135 ]]
		-- upvalues: var18 (write), string (copy), body (ref), var17 (write), isNaN (copy)
		var18 = string.charCodeAt(body, var17)
		
		return not isNaN(var18)
	end
	
	local _ = function() --[[ line: 139 ]]
		-- upvalues: var18 (write)
		return var18 == 95
	end
	
	local _ = function() --[[ line: 142 ]]
		-- upvalues: var18 (write)
		return var18 >= 48 and var18 <= 57
	end
	
	local _ = function() --[[ line: 145 ]]
		-- upvalues: var18 (write)
		return var18 >= 65 and var18 <= 90
	end
	
	local _ = function() --[[ line: 148 ]]
		-- upvalues: var18 (write)
		return var18 >= 97 and var18 <= 122
	end
	
	local _ = function() --[[ line: 151 ]]
		-- upvalues: var18 (write)
		return var18 == 95 or ((var18 >= 48 and var18 <= 57) or ((var18 >= 65 and var18 <= 90) or (var18 >= 97 and var18 <= 122)))
	end
	while var17 ~= var16 + 1 do
		var18 = string.charCodeAt(body, var17)
		
		if not isNaN(var18) or var18 ~= 95 and (not (var18 >= 48 and var18 <= 57) and (not (var18 >= 65 and var18 <= 90) and not (var18 >= 97 and var18 <= 122))) then break end
		var17 += 1
	end
	return token.new(tokenKind.NAME, p6, var17, p7, p8, p9, string.slice(body, p6, var17))
end

local function readComment(p10, p11, p12, p13, p14) --[[ line: 179 ]]
	-- upvalues: string (ref), isNaN (ref), token (ref), tokenKind (ref)
	local body = p10.body
	local _ = nil
	local var19 = p11
	repeat
		var19 += 1
		local var20 = string.charCodeAt(body, var19)
	until isNaN(var20) or var20 <= 31 and var20 ~= 9
	return token.new(tokenKind.COMMENT, p11, var19, p12, p13, p14, string.slice(body, p11 + 1, var19))
end

function printCharCode(p15) --[[ line: 201 ]]
	-- upvalues: isNaN (ref), tokenKind (ref), httpService (ref), toUnicodeStringModule (ref)
	return if isNaN(p15) then tokenKind.EOF elseif p15 < 127 then httpService:JSONEncode(string.char(p15)) else toUnicodeStringModule(p15)
end

function readDigits(p16, p17, p18) --[[ line: 220 ]]
	-- upvalues: string (ref), syntaxError (ref)
	local body = p16.body
	local var21 = p17
	local var22 = p18
	
	if var22 < 48 or var22 > 57 then
		error(syntaxError(p16, var21, "Invalid number, expected digit but got: " .. printCharCode(var22) .. "."))
		
		return
	end
	repeat
		var21 += 1
		var22 = string.charCodeAt(body, var21)
	until not (var22 >= 48 and var22 <= 57)
	return var21
end

function unexpectedCharacterMessage(p19) --[[ line: 245 ]]
	return if p19 < 32 and p19 ~= 9 and (p19 ~= 10 and p19 ~= 13) then "Cannot contain the invalid character " .. printCharCode(p19) .. "." elseif p19 == 39 then "Unexpected single quote character ('), did you mean to use a double quote (\")?" else "Cannot parse the unexpected character " .. printCharCode(p19) .. "."
end

function isNameStart(p20) --[[ line: 259 ]]
	return p20 == 95 or ((p20 >= 65 and p20 <= 90) or (p20 >= 97 and p20 <= 122))
end

function readNumber(p21, p22, p23, p24, p25, p26) --[[ line: 274 ]]
	-- upvalues: string (ref), syntaxError (ref), token (ref), tokenKind (ref)
	local body = p21.body
	local var23 = p23
	local var24 = p22
	local var25 = false
	
	if var23 == 45 then
		var24 += 1
		var23 = string.charCodeAt(body, var24)
	end
	if var23 == 48 then
		var24 += 1
		var23 = string.charCodeAt(body, var24)
		
		if var23 >= 48 and var23 <= 57 then
			error(syntaxError(p21, var24, "Invalid number, unexpected digit after 0: " .. printCharCode(var23) .. "."))
		end
	else
		var24 = readDigits(p21, var24, var23)
		var23 = string.charCodeAt(body, var24)
	end
	if var23 == 46 then
		var25 = true
		var24 += 1
		var24 = readDigits(p21, var24, string.charCodeAt(body, var24))
		var23 = string.charCodeAt(body, var24)
	end
	if var23 == 69 or var23 == 101 then
		var25 = true
		var24 += 1
		var23 = string.charCodeAt(body, var24)
		
		if var23 == 43 or var23 == 45 then
			var24 += 1
			var23 = string.charCodeAt(body, var24)
		end
		var24 = readDigits(p21, var24, var23)
		var23 = string.charCodeAt(body, var24)
	end
	if var23 == 46 or isNameStart(var23) then
		error(syntaxError(p21, var24, "Invalid number, expected digit but got: " .. printCharCode(var23) .. "."))
	end
	return token.new(if var25 then tokenKind.FLOAT else tokenKind.INT, p22, var24, p24, p25, p26, string.slice(body, p22, var24))
end

local function readToken(p27, p28) --[[ line: 359 ]]
	-- upvalues: string (ref), token (ref), tokenKind (ref), readComment (ref), readBlockString (write), readString (write), readName (ref), syntaxError (ref)
	local var27, line, var28
	local source = p27.source
	local body = source.body
	local charCount = utf8.len(body)
	assert(charCount ~= nil, "invalid utf8 supplied for token")
	local _end = p28._end
	while _end <= charCount do
		var27 = string.charCodeAt(body, _end)
		line = p27.line
		var28 = _end - p27.lineStart
		
		if var27 == 65279 or var27 == 9 or (var27 == 32 or var27 == 44) then
			_end += 1
		elseif var27 == 10 then
			_end += 1
			p27.line += 1
			p27.lineStart = _end - 1
		elseif var27 == 13 then
			_end = if string.charCodeAt(body, _end + 1) == 10 then _end + 2 else _end + 1
			p27.line += 1
			p27.lineStart = _end - 1
			continue
		end
		if var27 ~= 33 then
			if var27 ~= 35 then
				if var27 ~= 36 then
					if var27 ~= 38 then
						if var27 ~= 40 then
							if var27 ~= 41 then
								if var27 == 46 then
									if string.charCodeAt(body, _end + 1) ~= 46 or string.charCodeAt(body, _end + 2) ~= 46 then
										error(syntaxError(source, _end, unexpectedCharacterMessage(var27)))
										continue
									end
									return token.new(tokenKind.SPREAD, _end, _end + 3, line, var28, p28)
								elseif var27 ~= 58 then
									if var27 ~= 61 then
										if var27 ~= 64 then
											if var27 ~= 91 then
												if var27 ~= 93 then
													if var27 ~= 123 then
														if var27 ~= 124 then
															if var27 ~= 125 then
																if var27 ~= 34 then
																	if var27 ~= 45 and var27 ~= 48 and (var27 ~= 49 and var27 ~= 50) and (var27 ~= 51 and var27 ~= 52 and (var27 ~= 53 and var27 ~= 54)) and (var27 ~= 55 and var27 ~= 56 and var27 ~= 57) then
																		if var27 ~= 65 and var27 ~= 66 and (var27 ~= 67 and var27 ~= 68) and (var27 ~= 69 and var27 ~= 70 and (var27 ~= 71 and var27 ~= 72)) and (var27 ~= 73 and var27 ~= 74 and (var27 ~= 75 and var27 ~= 76) and (var27 ~= 77 and var27 ~= 78 and (var27 ~= 79 and var27 ~= 80))) and (var27 ~= 81 and var27 ~= 82 and (var27 ~= 83 and var27 ~= 84) and (var27 ~= 85 and var27 ~= 86 and (var27 ~= 87 and var27 ~= 88)) and (var27 ~= 89 and var27 ~= 90 and (var27 ~= 95 and var27 ~= 97) and (var27 ~= 98 and var27 ~= 99 and (var27 ~= 100 and var27 ~= 101)))) and (var27 ~= 102 and var27 ~= 103 and (var27 ~= 104 and var27 ~= 105) and (var27 ~= 106 and var27 ~= 107 and (var27 ~= 108 and var27 ~= 109)) and (var27 ~= 110 and var27 ~= 111 and (var27 ~= 112 and var27 ~= 113) and (var27 ~= 114 and var27 ~= 115 and (var27 ~= 116 and var27 ~= 117))) and (var27 ~= 118 and var27 ~= 119 and (var27 ~= 120 and var27 ~= 121) and var27 ~= 122)) then
																		end
																		return readName(source, _end, line, var28, p28)
																	end
																	return readNumber(source, _end, var27, line, var28, p28)
																end
																return if string.charCodeAt(body, _end + 1) == 34 and string.charCodeAt(body, _end + 2) == 34 then readBlockString(source, _end, line, var28, p28, p27) else readString(source, _end, line, var28, p28)
															end
															return token.new(tokenKind.BRACE_R, _end, _end + 1, line, var28, p28)
														end
														return token.new(tokenKind.PIPE, _end, _end + 1, line, var28, p28)
													end
													return token.new(tokenKind.BRACE_L, _end, _end + 1, line, var28, p28)
												end
												return token.new(tokenKind.BRACKET_R, _end, _end + 1, line, var28, p28)
											end
											return token.new(tokenKind.BRACKET_L, _end, _end + 1, line, var28, p28)
										end
										return token.new(tokenKind.AT, _end, _end + 1, line, var28, p28)
									end
									return token.new(tokenKind.EQUALS, _end, _end + 1, line, var28, p28)
								end
								return token.new(tokenKind.COLON, _end, _end + 1, line, var28, p28)
							end
							return token.new(tokenKind.PAREN_R, _end, _end + 1, line, var28, p28)
						end
						return token.new(tokenKind.PAREN_L, _end, _end + 1, line, var28, p28)
					end
					return token.new(tokenKind.AMP, _end, _end + 1, line, var28, p28)
				end
				return token.new(tokenKind.DOLLAR, _end, _end + 1, line, var28, p28)
			end
			return readComment(source, _end, line, var28, p28)
		end
		return token.new(tokenKind.BANG, _end, _end + 1, line, var28, p28)
	end
	return token.new(tokenKind.EOF, charCount + 1, charCount + 1, p27.line, _end - p27.lineStart, p28)
end

local t = {}
t.__index = t

function t.new(p29) --[[ line: 558 ]]
	-- upvalues: token (ref), tokenKind (ref), t (ref)
	local var29 = token.new(tokenKind.SOF, 1, 1, 0, 0, nil)
	
	return setmetatable({
		source = p29,
		lastToken = var29,
		token = var29,
		line = 1,
		lineStart = 0
	}, t)
end

function t:advance() --[[ line: 571 ]]
	self.lastToken = self.token
	self.token = self:lookahead()
	
	return self.token
end

function t:lookahead() --[[ line: 577 ]]
	-- upvalues: tokenKind (ref), readToken (ref)
	local token = self.token
	
	if token.kind ~= tokenKind.EOF then
		repeat
			if token.next then
				token = token.next
			else
				local var30 = readToken(self, token)
				token.next = var30
				var30.prev = token
				token = var30
			end
		until token.kind ~= tokenKind.COMMENT
	end
	return token
end

local function isPunctuatorTokenKind(p30) --[[ line: 600 ]]
	-- upvalues: tokenKind (ref)
	return if p30 ~= tokenKind.BANG then if p30 ~= tokenKind.DOLLAR then if p30 ~= tokenKind.AMP then if p30 ~= tokenKind.PAREN_L then if p30 ~= tokenKind.PAREN_R then if p30 ~= tokenKind.SPREAD then if p30 ~= tokenKind.COLON then if p30 ~= tokenKind.EQUALS then if p30 ~= tokenKind.AT then if p30 ~= tokenKind.BRACKET_L then if p30 ~= tokenKind.BRACKET_R then if p30 ~= tokenKind.BRACE_L then if p30 ~= tokenKind.PIPE then p30 == tokenKind.BRACE_R else true else true else true else true else true else true else true else true else true else true else true else true else true
end

readBlockString = function(p31, p32, p33, p34, p35, p36) --[[ line: 623 | named "readBlockString" ]]
	-- upvalues: isNaN (ref), string (ref), token (ref), tokenKind (ref), dedentBlockStringValue (ref), syntaxError (ref)
	local body = p31.body
	local var31 = p32 + 3
	local var32 = var31
	local _ = 0
	local var33 = ""
	while var31 <= string.len(body) and not isNaN(string.charCodeAt(body, var31)) do
		local var34 = string.charCodeAt(body, var31)
		
		if var34 ~= 34 or string.charCodeAt(body, var31 + 1) ~= 34 or string.charCodeAt(body, var31 + 2) ~= 34 then
			if var34 < 32 and var34 ~= 9 and (var34 ~= 10 and var34 ~= 13) then
				error(syntaxError(p31, var31, "Invalid character within String: " .. printCharCode(var34) .. "."))
			end
			if var34 == 10 then
				var31 += 1
				p36.line += 1
				p36.lineStart = var31 - 1
			elseif var34 == 13 then
				var31 = if string.charCodeAt(body, var31 + 1) == 10 then var31 + 2 else var31 + 1
				p36.line += 1
				p36.lineStart = var31 - 1
			elseif var34 == 92 and string.charCodeAt(body, var31 + 1) == 34 and (string.charCodeAt(body, var31 + 2) == 34 and string.charCodeAt(body, var31 + 3) == 34) then
				var33 ..= string.slice(body, var32, var31) .. "\"\"\""
				var31 += 4
				var32 = var31
			else
				var31 += 1
			end
		end
		var33 ..= string.slice(body, var32, var31)
		
		return token.new(tokenKind.BLOCK_STRING, p32, var31 + 3, p33, p34, p35, dedentBlockStringValue(var33))
	end
	error(syntaxError(p31, var31, "Unterminated string."))
end

readString = function(p37, p38, p39, p40, p41) --[[ line: 697 | named "readString" ]]
	-- upvalues: string (ref), isNaN (ref), token (ref), tokenKind (ref), syntaxError (ref), uniCharCode (write)
	local body = p37.body
	local charCount = utf8.len(body)
	assert(charCount ~= nil, "invalid utf8 sequence detected")
	local var36 = p38 + 1
	local var37 = var36
	local var38 = ""
	while var36 <= charCount do
		local var39 = string.charCodeAt(body, var36)
		
		if isNaN(var39) then break end
		if var39 ~= 34 then
			if var39 == 10 or var39 == 13 then break end
			if var39 < 32 and var39 ~= 9 then
				error(syntaxError(p37, var36, "Invalid character within String: " .. printCharCode(var39) .. "."))
			end
			var36 += 1
			
			if var39 ~= 92 then continue end
			var38 ..= string.slice(body, var37, var36 - 1)
			var39 = string.charCodeAt(body, var36)
			
			if var39 == 34 then
				var38 ..= "\""
			elseif var39 == 47 then
				var38 ..= "/"
			elseif var39 == 92 then
				var38 ..= "\\"
			elseif var39 == 98 then
				var38 ..= "\b"
			elseif var39 == 102 then
				var38 ..= "\f"
			elseif var39 == 110 then
				var38 ..= "\n"
			elseif var39 == 114 then
				var38 ..= "\r"
			elseif var39 == 116 then
				var38 ..= "\t"
			elseif var39 == 117 then
				local var40 = uniCharCode(string.charCodeAt(body, var36 + 1), string.charCodeAt(body, var36 + 2), string.charCodeAt(body, var36 + 3), string.charCodeAt(body, var36 + 4))
				
				if var40 < 0 then
					error(syntaxError(p37, var36, "Invalid character escape sequence: \\u" .. string.slice(body, var36 + 1, var36 + 5) .. "."))
				end
				var38 ..= utf8.char(var40)
				var36 += 4
			else
				error(syntaxError(p37, var36, "Invalid character escape sequence: \\" .. utf8.char(var39) .. "."))
			end
			var36 += 1
			var37 = var36
		end
		var38 ..= string.slice(body, var37, var36)
		
		return token.new(tokenKind.STRING, p38, var36 + 1, p39, p40, p41, var38)
	end
	error(syntaxError(p37, var36, "Unterminated string."))
end

return { Lexer = t, isPunctuatorTokenKind = isPunctuatorTokenKind }