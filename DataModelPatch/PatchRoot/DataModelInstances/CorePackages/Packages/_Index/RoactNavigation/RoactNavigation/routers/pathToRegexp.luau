local Parent = script.Parent.Parent.Parent
local Array = require(Parent.LuauPolyfill).Array
local RegExpModule = require(Parent.RegExp)

local function _(p1)
	return p1
end

local Callback = nil
local Callback1 = nil

local function lexer(Text: string)
	local List = {}
	local StartIndex6 = 1
	
	local function _(p1)
		-- upvalues: StartIndex6 (ref)
		StartIndex6 += 1
		
		return p1
	end
	
	local _ = function(StartIndex: number): string
		-- upvalues: Text (copy)
		return (string.sub(Text, StartIndex, StartIndex))
	end
	
	local Length = string.len(Text)
	local Count1 = nil
	while StartIndex6 <= Length do
		local Segment = string.sub(Text, StartIndex6, StartIndex6)
		
		if Segment == "*" or Segment == "+" or Segment == "?" then
			local StartIndex4: number = StartIndex6
			StartIndex6 += 1
			table.insert(List, {
				type = "MODIFIER",
				index = StartIndex6,
				value = string.sub(Text, StartIndex4, StartIndex4)
			})
		elseif Segment == "\\" then
			local Index: number = StartIndex6
			StartIndex6 += 1
			local StartIndex7: number = StartIndex6
			StartIndex6 += 1
			table.insert(List, {
				type = "ESCAPED_CHAR",
				index = Index,
				value = string.sub(Text, StartIndex7, StartIndex7)
			})
		elseif Segment == "{" then
			local StartIndex8: number = StartIndex6
			StartIndex6 += 1
			table.insert(List, {
				type = "OPEN",
				index = StartIndex6,
				value = string.sub(Text, StartIndex8, StartIndex8)
			})
		elseif Segment == "}" then
			local StartIndex1: number = StartIndex6
			StartIndex6 += 1
			table.insert(List, {
				type = "CLOSE",
				index = StartIndex6,
				value = string.sub(Text, StartIndex1, StartIndex1)
			})
		elseif Segment == ":" then
			local Text1 = ""
			local NewStartIndex = StartIndex6 + 1
			
			local _ = function(p1)
				-- upvalues: NewStartIndex (ref)
				NewStartIndex += 1
				
				return p1
			end
			while NewStartIndex <= Length do
				local ByteValue = string.byte(Text, NewStartIndex)
				
				if (ByteValue < 48 or ByteValue > 57) and (ByteValue < 65 or ByteValue > 90) and (ByteValue < 97 or ByteValue > 122) and ByteValue ~= 95 then break end
				local StartIndex9: number = NewStartIndex
				NewStartIndex += 1
				Text1 ..= string.sub(Text, StartIndex9, StartIndex9)
			end
			if Text1 == "" then
				error((("Missing parameter name at %d"):format(StartIndex6)))
			end
			table.insert(List, { type = "NAME", index = StartIndex6, value = Text1 })
			StartIndex6 = NewStartIndex
		elseif Segment == "(" then
			local Count = 1
			local Text2 = ""
			Count1 = StartIndex6 + 1
			local StartIndex: number = Count1
			
			if string.sub(Text, StartIndex, StartIndex) == "?" then
				error((("Pattern cannot start with \"?\" at %d"):format(Count1)))
			end
			local _ = function(p1)
				-- upvalues: Count1 (ref)
				Count1 += 1
				
				return p1
			end
			while Count1 <= Length do
				local StartIndex13: number = Count1
				
				if string.sub(Text, StartIndex13, StartIndex13) == "\\" then
					local StartIndex5: number = Count1
					Count1 += 1
					local Segment1 = string.sub(Text, StartIndex5, StartIndex5)
					local StartIndex14: number = Count1
					Count1 += 1
					Text2 ..= Segment1 .. string.sub(Text, StartIndex14, StartIndex14)
				end
				local StartIndex2: number = Count1
				
				if string.sub(Text, StartIndex2, StartIndex2) == ")" then
					Count -= 1
					
					if Count == 0 then
						Count1 += 1
						break
					end
				else
					local StartIndex10: number = Count1
					
					if string.sub(Text, StartIndex10, StartIndex10) == "(" then
						Count += 1
						local StartIndex3 = Count1 + 1
						
						if string.sub(Text, StartIndex3, StartIndex3) ~= "?" then
							error((("Capturing groups are not allowed at %d"):format(Count1)))
						end
					end
				end
				local StartIndex11: number = Count1
				Count1 += 1
				Text2 ..= string.sub(Text, StartIndex11, StartIndex11)
			end
			if Count ~= 0 then
				error((("Unbalanced pattern at %d"):format(StartIndex6)))
			end
			if Text2 == "" then
				error((("Missing pattern at %d"):format(StartIndex6)))
			end
			table.insert(List, { type = "PATTERN", index = StartIndex6, value = Text2 })
			StartIndex6 = Count1
		else
			local StartIndex12: number = StartIndex6
			StartIndex6 += 1
			table.insert(List, {
				type = "CHAR",
				index = StartIndex6,
				value = string.sub(Text, StartIndex12, StartIndex12)
			})
		end
	end
	table.insert(List, { type = "END", value = "", index = StartIndex6 })
	
	return List
end

local PathToRegexpModule = {
	parse = function(p1, p2)
		-- upvalues: lexer (copy), Callback (ref)
		local P5 = p2 or {}
		local LexerResult = lexer(p1)
		local Prefixes = if P5.prefixes == nil or P5.prefixes == "" then "./" else P5.prefixes
		local Formatted = string.format("[^%s]+?", Callback(P5.delimiter or "/#?"))
		local List = {}
		local Count = 0
		local Count1 = 1
		local Text = ""
		
		local function _(p3)
			-- upvalues: Count1 (ref)
			Count1 += 1
			
			return p3
		end
		
		local _ = function(p3)
			-- upvalues: Count (ref)
			Count += 1
			
			return p3
		end
		
		local _ = function(Type1)
			-- upvalues: Count1 (ref), LexerResult (copy)
			if Count1 <= #LexerResult and LexerResult[Count1].type == Type1 then
				local Count: number = Count1
				Count1 += 1
				
				return LexerResult[Count].value
			else
				return nil
			end
		end
		
		local function mustConsume(Type1)
			-- upvalues: Count1 (ref), LexerResult (copy)
			local v1 = nil
			if Count1 <= #LexerResult and LexerResult[Count1].type == Type1 then
				local Count: number = Count1
				Count1 += 1
				v1 = LexerResult[Count].value
			else
				v1 = nil
			end
			if v1 ~= nil then
				return v1
			end
			local LexerResultEntry = LexerResult[Count1]
			
			if LexerResultEntry == nil then
				error((("Expected token %s, got nil"):format(Type1)))
			end
			error((("Unexpected %s at %d, expected %s"):format(LexerResultEntry.type, LexerResultEntry.index, Type1)))
		end
		
		local function consumeText(): string
			-- upvalues: Count1 (ref), LexerResult (copy)
			local Text = ""
			local Value = nil
			
			if Count1 <= #LexerResult and LexerResult[Count1].type == "CHAR" then
				local Count: number = Count1
				Count1 += 1
				Value = LexerResult[Count].value
			else
				Value = nil
			end
			if not Value then
				if Count1 <= #LexerResult and LexerResult[Count1].type == "ESCAPED_CHAR" then
					local Count: number = Count1
					Count1 += 1
					Value = LexerResult[Count].value
				else
					Value = nil
				end
			end
			while Value and Value ~= "" do
				Text ..= Value
				local Value1 = nil
				
				if Count1 <= #LexerResult and LexerResult[Count1].type == "CHAR" then
					local Count: number = Count1
					Count1 += 1
					Value1 = LexerResult[Count].value
				else
					Value1 = nil
				end
				if not Value1 then
					if Count1 <= #LexerResult and LexerResult[Count1].type == "ESCAPED_CHAR" then
						local Count: number = Count1
						Count1 += 1
						Value1 = LexerResult[Count].value
					else
						Value1 = nil
					end
				end
				Value = Value1
			end
			return Text
		end
		while Count1 <= #LexerResult do
			local v1 = nil
			if Count1 <= #LexerResult and LexerResult[Count1].type == "CHAR" then
				local Count2: number = Count1
				Count1 += 1
				v1 = LexerResult[Count2].value
			else
				v1 = nil
			end
			local v2 = nil
			if Count1 <= #LexerResult and LexerResult[Count1].type == "NAME" then
				local Count3: number = Count1
				Count1 += 1
				v2 = LexerResult[Count3].value
			else
				v2 = nil
			end
			local v3 = nil
			if Count1 <= #LexerResult and LexerResult[Count1].type == "PATTERN" then
				local Count4: number = Count1
				Count1 += 1
				v3 = LexerResult[Count4].value
			else
				v3 = nil
			end
			if v2 and v2 ~= "" or v3 and v3 ~= "" then
				local Pattern = v1 or ""
				
				if string.find(Prefixes, Pattern) == nil then
					Text ..= Pattern
					Pattern = ""
				end
				if Text ~= nil and Text ~= "" then
					table.insert(List, Text)
					Text = ""
				end
				local Name: number = v2
				
				if v2 == nil or v2 == "" then
					local Count5: number = Count
					Count += 1
					Name = Count5
				end
				local config = {
					suffix = "",
					name = Name,
					prefix = Pattern,
					pattern = if v3 == nil or v3 == "" then Formatted else v3
				}
				local v4 = nil
				
				if Count1 <= #LexerResult and LexerResult[Count1].type == "MODIFIER" then
					local Count6: number = Count1
					Count1 += 1
					v4 = LexerResult[Count6].value
				else
					v4 = nil
				end
				config.modifier = v4 or ""
				table.insert(List, config)
			else
				local v5 = v1
				
				if not v5 then
					if Count1 <= #LexerResult and LexerResult[Count1].type == "ESCAPED_CHAR" then
						local Count8: number = Count1
						Count1 += 1
						v5 = LexerResult[Count8].value
					else
						v5 = nil
					end
				end
				if v5 and v5 ~= "" then
					Text ..= v5
				else
					if Text and Text ~= "" then
						table.insert(List, Text)
						Text = ""
					end
					local v6 = nil
					if Count1 <= #LexerResult and LexerResult[Count1].type == "OPEN" then
						local Count9: number = Count1
						Count1 += 1
						v6 = LexerResult[Count9].value
					else
						v6 = nil
					end
					if v6 and v6 ~= "" then
						local ConsumeTextResult: string = consumeText()
						local v7 = nil
						
						if Count1 <= #LexerResult and LexerResult[Count1].type == "NAME" then
							local Count10: number = Count1
							Count1 += 1
							v7 = LexerResult[Count10].value
						else
							v7 = nil
						end
						local V55 = v7 or ""
						local v8 = nil
						
						if Count1 <= #LexerResult and LexerResult[Count1].type == "PATTERN" then
							local Count11: number = Count1
							Count1 += 1
							v8 = LexerResult[Count11].value
						else
							v8 = nil
						end
						local Pattern1 = v8 or ""
						local ConsumeTextResult1: string = consumeText()
						mustConsume("CLOSE")
						
						if V55 == "" and Pattern1 ~= "" then
							local Count12: number = Count
							Count += 1
							V55 = Count12
						end
						if V55 ~= "" and V55 ~= 0 and (Pattern1 == nil or Pattern1 == "") then
							Pattern1 = Formatted
						end
						local config = {
							name = V55,
							pattern = Pattern1,
							prefix = ConsumeTextResult,
							suffix = ConsumeTextResult1
						}
						local Value = nil
						
						if Count1 <= #LexerResult and LexerResult[Count1].type == "MODIFIER" then
							local Count7: number = Count1
							Count1 += 1
							Value = LexerResult[Count7].value
						else
							Value = nil
						end
						config.modifier = Value or ""
						table.insert(List, config)
					else
						mustConsume("END")
					end
				end
			end
		end
		return List
	end
}

function PathToRegexpModule.compile(p3, p4)
	-- upvalues: PathToRegexpModule (copy)
	return PathToRegexpModule.tokensToFunction(PathToRegexpModule.parse(p3, p4), p4)
end

function PathToRegexpModule.tokensToFunction(ParseResult, p3)
	-- upvalues: Callback1 (ref), Array (copy), RegExpModule (copy)
	if p3 == nil then
		p3 = {}
	end
	local CallbackResult = Callback1(p3)
	local Encode = p3.encode or function(p4)
		return p4
	end
	local Validate = p3.validate
	
	if Validate == nil then
		Validate = true
	end
	local MapResult = Array.map(ParseResult, function(p4)
		-- upvalues: RegExpModule (upval), CallbackResult (copy)
		return if type(p4) == "table" then RegExpModule(("^(?:%s)$"):format(p4.pattern), CallbackResult) else nil
	end)
	
	return function(p4): string
		-- upvalues: ParseResult (copy), Array (upval), Encode (copy), Validate (ref), MapResult (copy)
		local Text = ""
		
		for i, value in ParseResult do
			if type(value) == "string" then
				Text ..= value
				continue
			end
			local v9 = if p4 then p4[tostring(value.name)] else nil
			local IsModifierMatch: boolean = value.modifier == "?" or value.modifier == "*"
			local IsModifierMatch1: boolean = value.modifier == "*" or value.modifier == "+"
			
			if Array.isArray(v9) then
				if not IsModifierMatch1 then
					error((("Expected \"%s\" to not repeat, but got an array"):format(value.name)))
				end
				if #v9 == 0 then
					if not IsModifierMatch then
						error((("Expected \"%s\" to not be empty"):format(value.name)))
					else
						continue
					end
				end
				for _, value1 in v9 do
					local EncodeResult = Encode(value1, value)
					
					if Validate and not MapResult[i]:test(EncodeResult) then
						error((("Expected all \"%s\" to match \"%s\", but got \"%s\""):format(value.name, value.pattern, EncodeResult)))
					end
					Text ..= value.prefix .. EncodeResult .. value.suffix
				end
			else
				local ValueType = type(v9)
				
				if ValueType == "string" or ValueType == "number" then
					local EncodeResult = Encode(tostring(v9), value)
					
					if Validate and not MapResult[i]:test(EncodeResult) then
						error((("Expected \"%s\" to match \"%s\", but got \"%s\""):format(value.name, value.pattern, EncodeResult)))
					end
					Text ..= value.prefix .. EncodeResult .. value.suffix
					continue
				elseif not IsModifierMatch then
					error((("Expected \"%s\" to be %s"):format(tostring(value.name), if IsModifierMatch1 then "an array" else "a string")))
				end
			end
		end
		return Text
	end
end

function PathToRegexpModule.match(p5, p6)
	-- upvalues: PathToRegexpModule (copy)
	local t = {}
	
	return PathToRegexpModule.regexpToFunction(PathToRegexpModule.pathToRegexp(p5, t, p6), t, p6)
end

function PathToRegexpModule.regexpToFunction(PathToRegexpResult, p5, p6)
	-- upvalues: Array (copy)
	if p6 == nil then
		p6 = {}
	end
	local Decode = p6.decode or function(p7)
		return p7
	end
	
	return function(p7)
		-- upvalues: PathToRegexpResult (copy), p5 (copy), Array (upval), Decode (copy)
		local ExecResult = PathToRegexpResult:exec(p7)
		
		if not ExecResult then
			return false
		end
		local ExecResultEntry = ExecResult[1]
		local Index = ExecResult.index or 0
		local Params = {}
		
		for i = 2, ExecResult.n do
			if ExecResult[i] ~= nil then
				local v10 = p5[i - 1]
				
				if v10.modifier == "*" or v10.modifier == "+" then
					Params[v10.name] = Array.map(string.split(ExecResult[i], v10.prefix .. v10.suffix), function(p8)
						-- upvalues: Decode (upval), v10 (copy)
						return Decode(p8, v10)
					end)
				else
					Params[v10.name] = Decode(ExecResult[i], v10)
				end
			end
		end
		return { path = ExecResultEntry, index = Index, params = Params }
	end
end

Callback = function(Text: string): string
	return string.gsub(Text, "[%.%+%*%?=%^!:${}%(%)%[%]|/\\]", function(Match): string
		return "\\" .. Match
	end)
end

Callback1 = function(p7): string
	return if p7 and p7.sensitive then "" else "i"
end

local function arrayToRegexp(p7, p8, p9)
	-- upvalues: Array (copy), PathToRegexpModule (copy), RegExpModule (copy), Callback1 (ref)
	return RegExpModule(("(?:%s)"):format(table.concat(Array.map(p7, function(p10)
		-- upvalues: PathToRegexpModule (upval), p8 (copy), p9 (copy)
		return PathToRegexpModule.pathToRegexp(p10, p8, p9).source
	end), "|")), Callback1(p9))
end

local function stringToRegexp(p7, p8, p9)
	-- upvalues: PathToRegexpModule (copy)
	return PathToRegexpModule.tokensToRegexp(PathToRegexpModule.parse(p7, p9), p8, p9)
end

function PathToRegexpModule.tokensToRegexp(ParseResult, List, p7)
	-- upvalues: Callback (ref), RegExpModule (copy), Callback1 (ref)
	local T = if p7 == nil then {} else p7
	local Strict = T.strict
	
	if Strict == nil then
		Strict = false
	end
	local Start = T.start
	
	if Start == nil then
		Start = true
	end
	local End = T.end_
	
	if End == nil then
		End = true
	end
	local Encode = T.encode or function(p8)
		return p8
	end
	local Text: string = if T.endsWith then ("[%s]|$"):format(Callback(T.endsWith or "")) else "$"
	local Text1: string = ("[%s]"):format(Callback(T.delimiter or "/#?"))
	local Text2: string = if Start then "^" else ""
	for _, value in ParseResult do
		if type(value) == "string" then
			Text2 ..= Callback(Encode(value))
		else
			local CallbackResult = Callback(Encode(value.prefix))
			local CallbackResult1 = Callback(Encode(value.suffix))
			
			if not value.pattern or value.pattern == "" then
				Text2 ..= ("(?:%s%s)%s"):format(CallbackResult, CallbackResult1, value.modifier)
				continue
			end
			if List then
				table.insert(List, value)
			end
			if (not CallbackResult or CallbackResult == "") and (not CallbackResult1 or CallbackResult1 == "") then
				Text2 ..= ("(%s)%s"):format(value.pattern, value.modifier)
			elseif value.modifier == "+" or value.modifier == "*" then
				Text2 ..= ("(?:%s((?:%s)(?:%s%s(?:%s))*)%s)%s"):format(CallbackResult, value.pattern, CallbackResult1, CallbackResult, value.pattern, CallbackResult1, if value.modifier == "*" then "?" else "")
			else
				Text2 ..= ("(?:%s(%s)%s)%s"):format(CallbackResult, value.pattern, CallbackResult1, value.modifier)
			end
		end
	end
	if End then
		if not Strict then
			Text2 ..= ("%s?"):format(Text1)
		end
		if T.endsWith and T.endsWith ~= "" then
			Text2 ..= ("(?=%s)"):format(Text)
		else
			Text2 ..= "$"
		end
	else
		local ParseResultEntry: string = ParseResult[#ParseResult]
		local HasFoundAt: boolean = if type(ParseResultEntry) == "string" then string.find(Text1, ParseResultEntry:sub(-1)) ~= nil else ParseResultEntry == nil
		
		if not Strict then
			Text2 ..= string.format("(?:%s(?=%s))?", Text1, Text)
		end
		if not HasFoundAt then
			Text2 ..= string.format("(?=%s|%s)", Text1, Text)
		end
	end
	return RegExpModule(Text2, Callback1(T))
end

function PathToRegexpModule.pathToRegexp(p8, p9, p10)
	-- upvalues: Array (copy), arrayToRegexp (copy), stringToRegexp (copy)
	return if Array.isArray(p8) then arrayToRegexp(p8, p9, p10) else stringToRegexp(p8, p9, p10)
end

return PathToRegexpModule