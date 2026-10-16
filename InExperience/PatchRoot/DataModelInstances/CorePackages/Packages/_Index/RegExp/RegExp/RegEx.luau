local self = setmetatable({}, { __mode = "k" })
local t = {}
local t1 = {}
local t2 = {}
local I = nil

local function to_str_arr(Text: string, p1) --[[ Line: 68 ]]
	if p1 then
		Text = string.sub(Text, utf8.offset(Text, p1))
	end
	local Length = utf8.len(Text)
	
	if Length <= 1999 then
		return { n = Length, s = Text, utf8.codepoint(Text, 1, #Text) }
	end
	local Ceiled = math.ceil(Length / 1999)
	local Buffer = table.create(Length)
	local NewN = 1
	
	for i = 1, Ceiled do
		local Packed = table.pack(utf8.codepoint(Text, utf8.offset(Text, i * 1999 - 1998), utf8.offset(Text, i * 1999 - (i == Ceiled and 1998 - ((Length - 1) % 1999 + 1) or -1)) - 1))
		table.move(Packed, 1, Packed.n, NewN, Buffer)
		NewN += Packed.n
	end
	Buffer.s = Text
	Buffer.n = Length
	
	return Buffer
end

local function from_str_arr(p2): string --[[ Line: 88 ]]
	local N = p2.n or #p2
	
	if N <= 7997 then
		return utf8.char(table.unpack(p2))
	end
	local Ceiled = math.ceil(N / 7997)
	local Buffer = table.create(Ceiled)
	
	for i = 1, Ceiled do
		Buffer[i] = utf8.char(table.unpack(p2, i * 7997 - 7996, i * 7997 - (i == Ceiled and 7997 - ((N - 1) % 7997 + 1) or 0)))
	end
	return table.concat(Buffer)
end

local function _(Text: string, p3, p4): string --[[ Line: 101 | Named "utf8_sub" ]]
	local OffsetResult = utf8.offset(Text, p4)
	
	return (string.sub(Text, utf8.offset(Text, p3), OffsetResult and OffsetResult - 1))
end

local config = {
	a = "anchored",
	i = "caseless",
	m = "multiline",
	s = "dotall",
	u = "unicode",
	U = "ungreedy",
	x = "extended"
}
local config1 = {
	alnum = true,
	alpha = true,
	ascii = true,
	blank = true,
	cntrl = true,
	digit = true,
	graph = true,
	lower = true,
	print = true,
	punct = true,
	space = true,
	upper = true,
	word = true,
	xdigit = true
}
local config2 = {
	[68] = { "class", "digit", true },
	[83] = { "class", "space", true },
	[87] = { "class", "word", true },
	[100] = { "class", "digit", false },
	[115] = { "class", "space", false },
	[119] = { "class", "word", false },
	[72] = { "class", "blank", true },
	[86] = { "class", "vertical_tab", true },
	[104] = { "class", "blank", false },
	[118] = { "class", "vertical_tab", false },
	[78] = { 78 },
	[82] = { 82 },
	[66] = 8,
	[110] = 10,
	[114] = 13,
	[116] = 9
}
local config3 = {
	[98] = { 98, { "class", "word", false } },
	[66] = { 66, { "class", "word", false } },
	[75] = { 75 },
	[71] = { 71 },
	[74] = { 74 },
	[90] = { 90 },
	[122] = { 122 }
}
local config4 = {
	[33] = true,
	[34] = true,
	[35] = true,
	[36] = true,
	[37] = true,
	[38] = true,
	[39] = true,
	[40] = true,
	[41] = true,
	[42] = true,
	[43] = true,
	[44] = true,
	[45] = true,
	[46] = true,
	[47] = true,
	[58] = true,
	[59] = true,
	[60] = true,
	[61] = true,
	[62] = true,
	[63] = true,
	[64] = true,
	[91] = true,
	[92] = true,
	[93] = true,
	[94] = true,
	[95] = true,
	[96] = true,
	[123] = true,
	[124] = true,
	[125] = true,
	[126] = true
}
local list = { 36 }
local list1 = { 46 }
local list2 = { 94 }
local list3 = { 124 }

local _ = function(p3, p4, Callback) --[[ Line: 164 | Named "check_re" ]]
	-- upvalues: self (copy), t (copy)
	return if p3 == "Match" then function(...) --[[ Line: 166 ]]
		-- upvalues: self (upval), p4 (copy), Callback (copy)
		if select("#", ...) < 1 then
			error("missing argument #1 (Match expected)", 2)
		end
		local v1, v2 = ...
		
		if self[v1] and self[v1].name == "Match" then
			v1 = self[v1]
		else
			error(string.format("invalid argument #1 to %q (Match expected, got %s)", p4, (typeof(v1))), 2)
		end
		if (p4 == "group" or p4 == "span") and v2 == nil then
			v2 = 0
		end
		return Callback(v1, v2)
	end else function(...) --[[ Line: 185 ]]
		-- upvalues: self (upval), p4 (copy), t (upval), Callback (copy)
		local Selected: number = select("#", ...)
		
		if Selected < 1 then
			error("missing argument #1 (RegEx expected)", 2)
		elseif Selected < 2 then
			error("missing argument #2 (string expected)", 2)
		end
		local v1, v2, Largest, v3, v4, v5 = ...
		
		if self[v1] and self[v1].name == "RegEx" then
			if p4 == "sub" then
				if type(Largest) == "number" then
					Largest ..= ""
				elseif type(Largest) ~= "string" then
					error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(Largest))), 2)
				end
			elseif type(v2) == "number" then
				v2 ..= ""
			elseif type(v2) ~= "string" then
				error(string.format("invalid argument #2 to %q (string expected, got %s)", p4, (typeof(v2))), 2)
			end
		else
			if type(v1) ~= "string" and type(v1) ~= "number" then
				error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", p4, (typeof(v1))), 2)
			end
			v1 = t.fromstring(v1)
		end
		if p4 ~= "sub" and p4 ~= "split" then
			local ValueType = typeof(Largest)
			
			if ValueType ~= "nil" then
				Largest = tonumber(Largest)
				
				if Largest then
					if Largest < 0 then
						Largest = #v2 + math.floor(Largest + 0.5) + 1
					else
						Largest = math.max(math.floor(Largest + 0.5), 1)
					end
				else
					error(string.format("invalid argument #3 to %q (number expected, got %s)", p4, ValueType), 2)
				end
			end
		end
		local SelfEntry = self[v1]
		
		if p4 == "match" or p4 == "matchiter" then
			v3 = (...)
		elseif p4 == "sub" then
			v5 = (...)
		end
		return Callback(SelfEntry, v2, Largest, v3, v4, v5)
	end
end

local function match_tostr(p3): string --[[ Line: 233 ]]
	-- upvalues: self (copy)
	local Spans = self[p3].spans
	local SpanEntry = Spans[0][1]
	local SpanEntry1: number = Spans[0][2]
	
	if SpanEntry1 <= SpanEntry then
		return string.format("Match (%d..%d, empty)", SpanEntry, SpanEntry1 - 1)
	else
		local Input: string = Spans.input
		local OffsetResult = utf8.offset(Input, SpanEntry1)
		
		return string.format("Match (%d..%d): %s", SpanEntry, SpanEntry1 - 1, (string.sub(Input, utf8.offset(Input, SpanEntry), OffsetResult and OffsetResult - 1)))
	end
end

local function new_match(Spans, GroupId, Source, Input) --[[ Line: 242 ]]
	-- upvalues: I (ref), t2 (ref), match_tostr (copy), self (copy)
	Spans.source = Source
	Spans.input = Input
	local Proxy = newproxy(true)
	local Meta = getmetatable(Proxy)
	Meta.__metatable = I
	Meta.__index = setmetatable(Spans, t2)
	Meta.__tostring = match_tostr
	self[Proxy] = { name = "Match", spans = Spans, group_id = GroupId }
	
	return Proxy
end

local function v20(p3, p4): string? --[[ Line: 254 ]]
	local Span = p3.spans[type(p4) == "number" and p4 or p3.group_id[p4]]
	
	if Span then
		local Input: string = p3.spans.input
		local OffsetResult = utf8.offset(Input, Span[2])
		
		return (string.sub(Input, utf8.offset(Input, Span[1]), OffsetResult and OffsetResult - 1))
	else
		return nil
	end
end

local v1 = "group"

function t2.group(...) --[[ Line: 166 ]]
	-- upvalues: self (copy), v1 (copy), v20 (copy)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local v2, v3 = ...
	
	if self[v2] and self[v2].name == "Match" then
		v2 = self[v2]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", v1, (typeof(v2))), 2)
	end
	if (v1 == "group" or v1 == "span") and v3 == nil then
		v3 = 0
	end
	return v20(v2, v3)
end

local function v22(p3, p4) --[[ Line: 262 ]]
	local Span = p3.spans[type(p4) == "number" and p4 or p3.group_id[p4]]
	
	if Span then
		return Span[1], Span[2] - 1
	else
		return nil
	end
end

local v2 = "span"

function t2.span(...) --[[ Line: 166 ]]
	-- upvalues: self (copy), v2 (copy), v22 (copy)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local v3, v4 = ...
	
	if self[v3] and self[v3].name == "Match" then
		v3 = self[v3]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", v2, (typeof(v3))), 2)
	end
	if (v2 == "group" or v2 == "span") and v4 == nil then
		v4 = 0
	end
	return v22(v3, v4)
end

local function v24(p3) --[[ Line: 270 ]]
	local Spans = p3.spans
	
	if Spans.n <= 0 then
		local Input: string = Spans.input
		local OffsetResult = utf8.offset(Input, Spans[0][2])
		
		return (string.sub(Input, utf8.offset(Input, Spans[0][1]), OffsetResult and OffsetResult - 1))
	end
	local Buffer = table.create(Spans.n)
	
	for i = 0, Spans.n do
		local Span = Spans[i]
		
		if Span then
			local Input: string = Spans.input
			local OffsetResult = utf8.offset(Input, Span[2])
			Buffer[i] = string.sub(Input, utf8.offset(Input, Span[1]), OffsetResult and OffsetResult - 1)
		end
	end
	return table.unpack(Buffer, 1, Spans.n)
end

local v3 = "groups"

function t2.groups(...) --[[ Line: 166 ]]
	-- upvalues: self (copy), v3 (copy), v24 (copy)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local v4, v5 = ...
	
	if self[v4] and self[v4].name == "Match" then
		v4 = self[v4]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", v3, (typeof(v4))), 2)
	end
	if (v3 == "group" or v3 == "span") and v5 == nil then
		v5 = 0
	end
	return v24(v4, v5)
end

local function v26(p4) --[[ Line: 285 ]]
	local Spans = p4.spans
	local Segments = {}
	
	for i, value in pairs(p4.group_id) do
		local Span = Spans[value]
		
		if Span then
			local Input: string = Spans.input
			local OffsetResult = utf8.offset(Input, Span[2])
			Segments[i] = string.sub(Input, utf8.offset(Input, Span[1]), OffsetResult and OffsetResult - 1)
		end
	end
	return Segments
end

local v4 = "groupdict"

function t2.groupdict(...) --[[ Line: 166 ]]
	-- upvalues: self (copy), v4 (copy), v26 (copy)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local v5, v6 = ...
	
	if self[v5] and self[v5].name == "Match" then
		v5 = self[v5]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", v4, (typeof(v5))), 2)
	end
	if (v4 == "group" or v4 == "span") and v6 == nil then
		v6 = 0
	end
	return v26(v5, v6)
end

local function v28(p5) --[[ Line: 297 ]]
	local Spans = p5.spans
	local Buffer = table.create(Spans.n)
	
	for i = 0, Spans.n do
		local Span = Spans[i]
		
		if Span then
			local Input: string = Spans.input
			local OffsetResult = utf8.offset(Input, Span[2])
			Buffer[i] = string.sub(Input, utf8.offset(Input, Span[1]), OffsetResult and OffsetResult - 1)
		end
	end
	Buffer.n = Spans.n
	
	return Buffer
end

local v5 = "groupdict"

function t2.grouparr(...) --[[ Line: 166 ]]
	-- upvalues: self (copy), v5 (copy), v28 (copy)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local v6, v7 = ...
	
	if self[v6] and self[v6].name == "Match" then
		v6 = self[v6]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", v5, (typeof(v6))), 2)
	end
	if (v5 == "group" or v5 == "span") and v7 == nil then
		v7 = 0
	end
	return v28(v6, v7)
end

local config5 = {
	CR = 0,
	LF = 1,
	CRLF = 2,
	ANYRLF = 3,
	ANY = 4,
	NUL = 5
}

local function is_newline(p6, Total: number, p7): boolean --[[ Line: 314 ]]
	local Newline = p7.newline
	local v6 = p6[Total]
	
	return if Newline == 0 then v6 == 13 elseif Newline == 2 then v6 == 10 and p6[Total - 1] == 32 elseif Newline == 3 then v6 == 10 or v6 == 13 elseif Newline == 4 then v6 == 10 or (v6 == 11 or (v6 == 12 or (v6 == 13 or (v6 == 133 or (v6 == 8232 or v6 == 8233))))) elseif Newline == 5 then v6 == 0 else v6 == 10
end

local function tkn_char_match(Entry, p6, Total, p7, p8) --[[ Line: 338 ]]
	-- upvalues: tkn_char_match (copy), config4 (copy), is_newline (copy)
	local Count = p6[Total]
	
	if not Count then
		return false
	end
	if p7.ignoreCase and Count >= 97 and Count <= 122 then
		Count -= 32
	end
	if type(Entry) == "number" then
		return Entry == Count
	end
	if Entry[1] == "charset" then
		for _, value in ipairs(Entry[3]) do
			if tkn_char_match(value, p6, Total, p7, p8) then
				return not Entry[2]
			end
		end
		return Entry[2]
	else
		if Entry[1] == "range" then
			return Entry[2] <= Count and Count <= Entry[3] or p7.ignoreCase and (Count >= 65 and (Count <= 90 and Entry[2] <= Count + 32) and Count + 32 <= Entry[3])
		end
		if Entry[1] == "class" then
			local Entry1 = Entry[2]
			local Entry2 = Entry[3]
			local IsL = false
			
			if Entry1 == "xdigit" then
				IsL = Count >= 48 and Count <= 57 or (Count >= 65 and Count <= 70 or Count >= 97 and Count <= 102)
			elseif Entry1 == "ascii" then
				IsL = Count <= 127
			elseif Entry1 == "vertical_tab" then
				IsL = Count >= 10 and Count <= 13 or (Count == 8232 or Count == 8233)
			elseif p7.unicode then
				local Text = (false)[Count] or "Cn"
				local Segment = Text:sub(1, 1)
				
				if Entry1 == "alnum" then
					IsL = Segment == "L" or (Text == "Nl" or Text == "Nd")
				elseif Entry1 == "alpha" then
					IsL = Segment == "L" or Text == "Nl"
				elseif Entry1 == "blank" then
					IsL = Text == "Zs" or Count == 9
				elseif Entry1 == "cntrl" then
					IsL = Text == "Cc"
				elseif Entry1 == "digit" then
					IsL = Text == "Nd"
				elseif Entry1 == "graph" then
					IsL = Segment ~= "P" and Segment ~= "C"
				elseif Entry1 == "lower" then
					IsL = Text == "Ll"
				elseif Entry1 == "print" then
					IsL = Segment ~= "C"
				elseif Entry1 == "punct" then
					IsL = Segment == "P"
				elseif Entry1 == "space" then
					IsL = Segment == "Z" or Count >= 9 and Count <= 13
				elseif Entry1 == "upper" then
					IsL = Text == "Lu"
				elseif Entry1 == "word" then
					IsL = Segment == "L" or (Text == "Nl" or (Text == "Nd" or Text == "Pc"))
				end
			elseif Entry1 == "alnum" then
				IsL = Count >= 48 and Count <= 57 or (Count >= 65 and Count <= 90 or Count >= 97 and Count <= 122)
			elseif Entry1 == "alpha" then
				IsL = Count >= 65 and Count <= 90 or Count >= 97 and Count <= 122
			elseif Entry1 == "blank" then
				IsL = Count == 9 or Count == 32
			elseif Entry1 == "cntrl" then
				IsL = Count <= 31 or Count == 127
			elseif Entry1 == "digit" then
				IsL = Count >= 48 and Count <= 57
			elseif Entry1 == "graph" then
				IsL = Count >= 33 and Count <= 126
			elseif Entry1 == "lower" then
				IsL = Count >= 97 and Count <= 122
			elseif Entry1 == "print" then
				IsL = Count >= 32 and Count <= 126
			elseif Entry1 == "punct" then
				IsL = config4[Count]
			elseif Entry1 == "space" then
				IsL = Count >= 9 and Count <= 13 or Count == 32
			elseif Entry1 == "upper" then
				IsL = Count >= 65 and Count <= 90
			elseif Entry1 == "word" then
				IsL = Count >= 48 and Count <= 57 or (Count >= 65 and Count <= 90 or (Count >= 97 and Count <= 122 or Count == 95))
			end
			return if Entry2 then not IsL else IsL
		elseif Entry[1] ~= "category" then
			return if Entry[1] == 46 then p7.dotAll or not is_newline(p6, Total, p8) elseif Entry[1] == 78 then not is_newline(p6, Total, p8) else Entry[1] == 82 and (if p8.newline_seq == 0 then Count == 10 or Count == 13 else Count == 10 or (Count == 11 or (Count == 12 or (Count == 13 or (Count == 133 or (Count == 8232 or Count == 8233))))))
		else
			local Text = (false)[Count] or "Cn"
			local Entry3 = Entry[3]
			local CountEntry3 = #Entry3
			
			if CountEntry3 == 3 then
				local LN = if Entry3 == "Xan" or Entry3 == "Xwd" then Text:find("^[LN]") or Entry3 == "Xwd" and Count == 95 elseif Entry3 == "Xps" or Entry3 == "Xsp" then Text:sub(1, 1) == "Z" or Count >= 9 and Count <= 13 else Entry3 == "Xuc" and tkn_char_match(false, p6, Total, p7, p8)
				
				return if Entry[2] then not LN else LN
			else
				return if Text:sub(1, CountEntry3) == Entry3 then not Entry[2] else Entry[2]
			end
		end
	end
end

local function find_alternation(p9, Count, NewCount: number) --[[ Line: 463 ]]
	-- upvalues: list3 (copy)
	while true do
		local v6 = p9[Count]
		local IsTable = type(v6) == "table"
		if v6 == list3 then
			return Count, NewCount
		elseif IsTable and v6[1] == 40 then
			if NewCount then
				NewCount += v6.count
			end
			Count = v6[3]
		elseif IsTable and v6[1] == "quantifier" and type(v6[5]) == "table" and v6[5][1] == 40 then
			if NewCount then
				NewCount += v6[5].count
			end
			Count = v6[5][3]
		else
			if not v6 or IsTable and v6[1] == 41 then
				return nil, NewCount
			elseif NewCount then
				if IsTable and v6[1] == "quantifier" then
					NewCount += v6[3]
				else
					NewCount += 1
				end
			end
		end
		Count += 1
	end
end

local function re_rawfind(Token, Str_arr, Total, Flags, VerbFlags, p10) --[[ Line: 492 ]]
	-- upvalues: find_alternation (copy), tkn_char_match (copy), is_newline (copy)
	local Count = 0
	local Total1 = Total
	local Total2 = Total
	local List = {}
	local Count1 = nil
	local Flag = nil
	local Alternation2 = nil
	local Entry = nil
	local v7 = nil
	local Entry1 = nil
	local v8 = nil
	local Amount = nil
	local v9 = nil
	local v10 = nil
	local v11 = nil
	while Count do
		if Count == 0 then
			Count += 1
			local Alternation = find_alternation(Token, Count)
			
			if Alternation then
				table.insert(List, 1, { "alternation", Alternation, Total1 })
			end
		else
			local TokenEntry = Token[Count]
			local TokenEntry1 = type(TokenEntry) == "table" and TokenEntry[1]
			
			if not TokenEntry then break end
			if TokenEntry == "ACCEPT" then
				Flag = true
				Count1 = Count
				repeat
					Count1 += 1
					local IsTable = type(Token[Count1]) == "table"
					local TokenEntry2 = Token[Count1]
					if IsTable and (TokenEntry2[1] == 40 or TokenEntry2[1] == "quantifier" and type(TokenEntry2[5]) == "table" and TokenEntry2[5][1] == 40) then
						Count1 = TokenEntry2[1] == "quantifier" and TokenEntry2[5][3] or TokenEntry2[3]
					elseif IsTable and TokenEntry2[1] == 41 and (TokenEntry2[4] == 33 or TokenEntry2[4] == 61) then
						Flag = false
						Count = Count1
						break
					end
				until not TokenEntry2
				if Flag then break end
			else
				if TokenEntry == "PRUNE" or TokenEntry == "SKIP" then
					table.insert(List, 1, { TokenEntry, Total1 })
					Count += 1
				elseif TokenEntry1 == 40 then
					table.insert(List, 1, {
						"group", Count, Total1, nil, TokenEntry[2], TokenEntry[3], TokenEntry[4]
					})
					Count += 1
					local Alternation1, Alternation2_1 = find_alternation(Token, Count, if TokenEntry[4] == 33 then TokenEntry[5] and 0 else TokenEntry[4] == 61 and (TokenEntry[5] and 0))
					
					if Alternation1 then
						table.insert(List, 1, { "alternation", Alternation1, Total1 })
					end
					if Alternation2_1 then
						Total1 -= Alternation2_1
					end
				elseif TokenEntry1 == 41 and TokenEntry[4] ~= 33 then
					local Removed = nil
					if TokenEntry[4] == 33 or TokenEntry[4] == 61 then
						while true do
							v8 = nil
							Removed = table.remove(List, 1)
							if (Removed[1] ~= "group" or Removed[2] ~= TokenEntry[3]) and (Removed[1] ~= "matchStart" or v8 or TokenEntry[4] ~= 61 or true) then continue end
							if (TokenEntry[4] == 33 or TokenEntry[4] == 61) and not TokenEntry[5] then
								Total1 = Removed[3]
							end
							if not v8 then break end
							table.insert(List, 1, v8)
							break
						end
					elseif TokenEntry[4] == 62 then
						repeat
							local Removed1 = table.remove(List, 1)
						until not Removed1 or Removed1[1] == "group" and Removed1[2] == TokenEntry[3]
					else
						for _, value in ipairs(List) do
							if value[1] == "group" and value[2] == TokenEntry[3] then
								if value.jmp then
									Count = value.jmp
								end
								value[4] = Total1
								
								if value[7] ~= "quantifier" or value[10] + 1 >= value[9] then break end
								if Token[TokenEntry[3]][4] ~= "lazy" or value[10] + 1 < value[8] then
									Count = TokenEntry[3]
								end
								local TokenEntry3 = Token[TokenEntry[3]]
								table.insert(List, 1, {
									"group", value[2], Total1, nil, TokenEntry3[5][2], TokenEntry3[5][3],
									"quantifier", TokenEntry3[2], TokenEntry3[3], value[10] + 1, value[11],
									TokenEntry3[4]
								})
								
								if not value[11] then break end
								table.insert(List, 1, { "alternation", value[11], Total1 })
								break
							end
						end
					end
					Count += 1
					continue
				elseif TokenEntry1 == 75 then
					table.insert(List, 1, { "matchStart", Total1 })
					Count += 1
				elseif TokenEntry1 == 124 then
					local Count2 = Count
					repeat
						Count2 += 1
						local IsTable = type(Token[Count2]) == "table"
						local TokenEntry4 = Token[Count2]
						if IsTable and (TokenEntry4[1] == 40 or TokenEntry4[1] == "quantifier" and type(TokenEntry4[5]) == "table" and TokenEntry4[5][1] == 40) then
							Count2 = TokenEntry4[1] == "quantifier" and TokenEntry4[5][3] or TokenEntry4[3]
						end
					until IsTable and TokenEntry4[1] == 41 or not TokenEntry4
					if Token[Count2] then
						for _, value2 in ipairs(List) do
							if value2[1] == "group" and value2[6] == Count2 then
								Count = value2[6]
								break
							end
						end
					else
						Count = Count2
					end
				elseif TokenEntry1 == "recurmatch" then
					table.insert(List, 1, {
						"group",
						TokenEntry[3],
						Total1,
						nil,
						nil,
						Token[TokenEntry[3]][3],
						nil,
						jmp = Count
					})
					Count = TokenEntry[3] + 1
					local Alternation3, _ = find_alternation(Token, Count)
					
					if Alternation3 then
						table.insert(List, 1, { "alternation", Alternation3, Total1 })
					end
				else
					local Tkn_char_matchResult = nil
					
					if TokenEntry == "FAIL" then
						Tkn_char_matchResult = false
					elseif TokenEntry1 == 41 then
						repeat
							local Removed1 = table.remove(List, 1)
						until Removed1[1] == "group" and Removed1[2] == TokenEntry[3]
					elseif TokenEntry1 == "quantifier" then
						if type(TokenEntry[5]) == "table" and TokenEntry[5][1] == 40 then
							local Alternation4 = find_alternation(Token, Count + 1)
							
							if Alternation4 then
								table.insert(List, 1, { "alternation", Alternation4, Total1 })
							end
							table.insert(List, if Alternation4 then 2 else 1, {
								"group", Count, Total1, nil, TokenEntry[5][2], TokenEntry[5][3], "quantifier",
								TokenEntry[2], TokenEntry[3], 0, Alternation4, TokenEntry[4]
							})
							
							if TokenEntry[4] == "lazy" and TokenEntry[2] == 0 then
								Count = TokenEntry[5][3]
							end
							Tkn_char_matchResult = true
						else
							v10 = nil
							v11 = nil
							Amount = 1
							local IsBackref: boolean = type(TokenEntry[5]) == "table" and TokenEntry[5][1] == "backref"
							
							if IsBackref then
								Amount = 0
								local TokenEntry5 = TokenEntry[5][2]
								
								for _, value4 in ipairs(List) do
									if value4[1] == "group" and value4[5] == TokenEntry5 then
										v10 = value4[3]
										v11 = value4[4]
										Amount = v11 - v10
										break
									end
								end
							end
							local NewTotal = Total1 + TokenEntry[2] * Amount
							local v12 = 0
							while v12 < TokenEntry[3] do
								if IsBackref then
									if not v10 or not v11 then break end
									local S: string = Str_arr.s
									local OffsetResult = utf8.offset(S, v11)
									local Segment = string.sub(S, utf8.offset(S, v10), OffsetResult and OffsetResult - 1)
									local S1: string = Str_arr.s
									local OffsetResult1 = utf8.offset(S1, Total1 + Amount)
									
									if Segment ~= string.sub(S1, utf8.offset(S1, Total1), OffsetResult1 and OffsetResult1 - 1) then break end
								elseif not tkn_char_match(TokenEntry[5], Str_arr, Total1, Flags, VerbFlags) then break end
								Total1 += Amount
								v12 += 1
							end
							Tkn_char_matchResult = v12 >= TokenEntry[2]
							
							if Tkn_char_matchResult and TokenEntry[4] ~= "possessive" then
								if TokenEntry[4] == "lazy" then
									local Total4: number = Total1
									Total1 = NewTotal
									NewTotal = Total4
								end
								table.insert(List, 1, {
									"quantifier",
									Count,
									Total1,
									math.min(NewTotal, Str_arr.n + 1),
									(if TokenEntry[4] == "lazy" then 1 else -1) * Amount
								})
							end
						end
					elseif TokenEntry1 == "backref" then
						v7 = nil
						v9 = nil
						local TokenEntry6 = TokenEntry[2]
						
						for _, value3 in ipairs(List) do
							if value3[1] == "group" and value3[5] == TokenEntry6 then
								v7 = value3[3]
								v9 = value3[4]
								break
							end
						end
						if v7 and v9 then
							local Total3: number = Total1
							Total1 += v9 - v7
							local S: string = Str_arr.s
							local OffsetResult = utf8.offset(S, v9)
							local Segment = string.sub(S, utf8.offset(S, v7), OffsetResult and OffsetResult - 1)
							local S2: string = Str_arr.s
							local OffsetResult2 = utf8.offset(S2, Total1)
							Tkn_char_matchResult = Segment == string.sub(S2, utf8.offset(S2, Total3), OffsetResult2 and OffsetResult2 - 1)
						end
					else
						local Str_arrEntry = Str_arr[Total1]
						
						if TokenEntry1 == 36 or TokenEntry1 == 90 or TokenEntry1 == 122 then
							Tkn_char_matchResult = Total1 == Str_arr.n + 1 or (TokenEntry1 == 36 and Flags.multiline and is_newline(Str_arr, Total1 + 1, VerbFlags) or TokenEntry1 == 90 and Total1 == Str_arr.n and is_newline(Str_arr, Total1, VerbFlags))
						elseif TokenEntry1 == 94 or (TokenEntry1 == 65 or TokenEntry1 == 71) then
							Tkn_char_matchResult = Total1 == 1 or (TokenEntry1 == 94 and Flags.multiline and is_newline(Str_arr, Total1 - 1, VerbFlags) or TokenEntry1 == 71 and Total1 == Total)
						elseif TokenEntry1 == 66 or TokenEntry1 == 98 then
							local IsTotalMatch = Total1 == 1 or Flags.multiline and is_newline(Str_arr, Total1 - 1, VerbFlags)
							local IsTotalMatch1 = Total1 == Str_arr.n + 1 or Flags.multiline and is_newline(Str_arr, Total1, VerbFlags)
							local v13 = if tkn_char_match(TokenEntry[2], Str_arr[Total1 - 1], Flags) then 0 else tkn_char_match(TokenEntry[2], Str_arrEntry, Flags) and 1
							
							if v13 == 0 then
								Tkn_char_matchResult = IsTotalMatch1 or not tkn_char_match(TokenEntry[2], Str_arrEntry, Flags)
							elseif v13 then
								Tkn_char_matchResult = IsTotalMatch or not tkn_char_match(TokenEntry[2], Str_arr[Total1 - 1], Flags)
							end
							if TokenEntry1 == 66 then
								Tkn_char_matchResult = not Tkn_char_matchResult
							end
						else
							Tkn_char_matchResult = tkn_char_match(TokenEntry, Str_arr, Total1, Flags, VerbFlags)
							Total1 += 1
						end
					end
					repeat
						if Tkn_char_matchResult then break end
						while true do
							Entry = List[1] and List[1][1]
							Entry1 = List[1]
							if Entry and (Entry ~= "PRUNE" and Entry ~= "SKIP") then
								if Entry == "alternation" then
									Count = Entry1[2]
									Total1 = Entry1[3]
									local Alternation
									Alternation, Alternation2 = find_alternation(Token, Count + 1)
									
									if Alternation then
										Entry1[2] = Alternation
									else
										table.remove(List, 1)
									end
									if not Alternation2 then break end
									Total1 -= Alternation2
									break
								end
								if Entry == "group" then
									if Entry1[7] == "quantifier" then
										if Entry1[12] == "greedy" and Entry1[8] <= Entry1[10] or Entry1[12] == "lazy" and (Entry1[10] < Entry1[9] and not Entry1[13]) then
											Count = Entry1[12] == "greedy" and Entry1[6] or Entry1[2]
											Total1 = Entry1[3]
											
											if Entry1[12] == "greedy" then
												table.remove(List, 1)
												break
											end
											if Entry1[8] <= Entry1[10] then
												Entry1[13] = true
												break
											end
										end
									elseif Entry1[7] == 33 then
										table.remove(List, 1)
										Count = Entry1[6]
										Total1 = Entry1[3]
										break
									end
								elseif Entry == "quantifier" and math.sign(Entry1[4] - Entry1[3]) == math.sign(Entry1[5]) then
									Entry1[3] += Entry1[5]
									Count = Entry1[2]
									Total1 = Entry1[3]
									break
								end
								table.remove(List, 1)
							else
								if Entry then
									table.clear(List)
								end
								if Str_arr.n < Total2 then
									return not p10 and nil
								end
								Total2 = Entry == "SKIP" and Entry1[2] or Total2 + 1
								Count = 0
								Total1 = Total2
								break
							end
						end
					until true
					Count += 1
					continue
				end
			end
		end
	end
	if p10 then
		return true
	end
	local Flag1 = false
	local Buffer = table.create(Token.group_n)
	Buffer[0] = { Total2, Total1 }
	Buffer.n = Token.group_n
	
	for _, value1 in ipairs(List) do
		if value1[1] == "matchStart" and not Flag1 then
			Flag1 = true
			Buffer[0][1] = value1[2]
		elseif value1[1] == "group" and value1[5] and not Buffer[value1[5]] then
			Buffer[value1[5]] = { value1[3], value1[4] }
		end
	end
	return Buffer
end

local function v35(p11, p12, p13) --[[ Line: 789 ]]
	-- upvalues: re_rawfind (copy), to_str_arr (copy)
	return (re_rawfind(p11.token, to_str_arr(p12, p13), 1, p11.flags, p11.verb_flags, true))
end

local v14 = "test"

function t1.test(...) --[[ Line: 185 ]]
	-- upvalues: self (copy), v14 (copy), t (copy), v35 (copy)
	local Selected: number = select("#", ...)
	
	if Selected < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif Selected < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local v15, v16, Largest, v17, v18, v19 = ...
	
	if self[v15] and self[v15].name == "RegEx" then
		if v14 == "sub" then
			if type(Largest) == "number" then
				Largest ..= ""
			elseif type(Largest) ~= "string" then
				error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(Largest))), 2)
			end
		elseif type(v16) == "number" then
			v16 ..= ""
		elseif type(v16) ~= "string" then
			error(string.format("invalid argument #2 to %q (string expected, got %s)", v14, (typeof(v16))), 2)
		end
	else
		if type(v15) ~= "string" and type(v15) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", v14, (typeof(v15))), 2)
		end
		v15 = t.fromstring(v15)
	end
	if v14 ~= "sub" and v14 ~= "split" then
		local ValueType = typeof(Largest)
		
		if ValueType ~= "nil" then
			Largest = tonumber(Largest)
			
			if Largest then
				if Largest < 0 then
					Largest = #v16 + math.floor(Largest + 0.5) + 1
				else
					Largest = math.max(math.floor(Largest + 0.5), 1)
				end
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", v14, ValueType), 2)
			end
		end
	end
	local SelfEntry = self[v15]
	
	if v14 == "match" or v14 == "matchiter" then
		v17 = (...)
	elseif v14 == "sub" then
		v19 = (...)
	end
	return v35(SelfEntry, v16, Largest, v17, v18, v19)
end

local function v37(p11, Input, p12, Source) --[[ Line: 793 ]]
	-- upvalues: re_rawfind (copy), to_str_arr (copy), new_match (copy)
	local Re_rawfindResult = re_rawfind(p11.token, to_str_arr(Input, p12), 1, p11.flags, p11.verb_flags, false)
	
	return if Re_rawfindResult then new_match(Re_rawfindResult, p11.group_id, Source, Input) else nil
end

local v15 = "match"

function t1.match(...) --[[ Line: 185 ]]
	-- upvalues: self (copy), v15 (copy), t (copy), v37 (copy)
	local Selected: number = select("#", ...)
	
	if Selected < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif Selected < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local v16, v17, Largest, v18, v19, v20 = ...
	
	if self[v16] and self[v16].name == "RegEx" then
		if v15 == "sub" then
			if type(Largest) == "number" then
				Largest ..= ""
			elseif type(Largest) ~= "string" then
				error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(Largest))), 2)
			end
		elseif type(v17) == "number" then
			v17 ..= ""
		elseif type(v17) ~= "string" then
			error(string.format("invalid argument #2 to %q (string expected, got %s)", v15, (typeof(v17))), 2)
		end
	else
		if type(v16) ~= "string" and type(v16) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", v15, (typeof(v16))), 2)
		end
		v16 = t.fromstring(v16)
	end
	if v15 ~= "sub" and v15 ~= "split" then
		local ValueType = typeof(Largest)
		
		if ValueType ~= "nil" then
			Largest = tonumber(Largest)
			
			if Largest then
				if Largest < 0 then
					Largest = #v17 + math.floor(Largest + 0.5) + 1
				else
					Largest = math.max(math.floor(Largest + 0.5), 1)
				end
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", v15, ValueType), 2)
			end
		end
	end
	local SelfEntry = self[v16]
	
	if v15 == "match" or v15 == "matchiter" then
		v18 = (...)
	elseif v15 == "sub" then
		v20 = (...)
	end
	return v37(SelfEntry, v17, Largest, v18, v19, v20)
end

local function v39(p11, p12, p13, Source) --[[ Line: 801 ]]
	-- upvalues: to_str_arr (copy), re_rawfind (copy), new_match (copy)
	local Str_arr = to_str_arr(p12, p13)
	local Total = 1
	
	return function() --[[ Line: 804 ]]
		-- upvalues: Total (ref), Str_arr (ref), re_rawfind (upval), p11 (copy), new_match (upval), Source (copy)
		local Re_rawfindResult = Total <= Str_arr.n + 1 and re_rawfind(p11.token, Str_arr, Total, p11.flags, p11.verb_flags, false)
		
		if Re_rawfindResult then
			Total = Re_rawfindResult[0][2] + (if Re_rawfindResult[0][2] <= Re_rawfindResult[0][1] then 1 else 0)
			
			return (new_match(Re_rawfindResult, p11.group_id, Source, Str_arr.s))
		else
			return nil
		end
	end
end

local v16 = "matchall"

function t1.matchall(...) --[[ Line: 185 ]]
	-- upvalues: self (copy), v16 (copy), t (copy), v39 (copy)
	local Selected: number = select("#", ...)
	
	if Selected < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif Selected < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local v17, v18, Largest, v19, v20, v21 = ...
	
	if self[v17] and self[v17].name == "RegEx" then
		if v16 == "sub" then
			if type(Largest) == "number" then
				Largest ..= ""
			elseif type(Largest) ~= "string" then
				error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(Largest))), 2)
			end
		elseif type(v18) == "number" then
			v18 ..= ""
		elseif type(v18) ~= "string" then
			error(string.format("invalid argument #2 to %q (string expected, got %s)", v16, (typeof(v18))), 2)
		end
	else
		if type(v17) ~= "string" and type(v17) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", v16, (typeof(v17))), 2)
		end
		v17 = t.fromstring(v17)
	end
	if v16 ~= "sub" and v16 ~= "split" then
		local ValueType = typeof(Largest)
		
		if ValueType ~= "nil" then
			Largest = tonumber(Largest)
			
			if Largest then
				if Largest < 0 then
					Largest = #v18 + math.floor(Largest + 0.5) + 1
				else
					Largest = math.max(math.floor(Largest + 0.5), 1)
				end
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", v16, ValueType), 2)
			end
		end
	end
	local SelfEntry = self[v17]
	
	if v16 == "match" or v16 == "matchiter" then
		v19 = (...)
	elseif v16 == "sub" then
		v21 = (...)
	end
	return v39(SelfEntry, v18, Largest, v19, v20, v21)
end

local function insert_tokenized_sub(p11, p12, p13, List) --[[ Line: 814 ]]
	-- upvalues: insert_tokenized_sub (copy)
	for _, value in ipairs(List) do
		if type(value) ~= "table" then
			if p13[value] then
				table.move(p12, p13[value][1], p13[value][2] - 1, #p11 + 1, p11)
				continue
			end
			continue
		end
		if value[1] ~= "condition" then
			table.move(value, 1, #value, #p11 + 1, p11)
		elseif p13[value[2]] then
			if value[3] then
				insert_tokenized_sub(p11, p12, p13, value[3])
			else
				table.move(p12, p13[value[2]][1], p13[value[2]][2] - 1, #p11 + 1, p11)
			end
		elseif value[4] then
			insert_tokenized_sub(p11, p12, p13, value[4])
		end
	end
	p11.n = #p11
	
	return p11
end

local function v42(p14, Callback, p15, p16: number?, p17, Source) --[[ Line: 838 ]]
	-- upvalues: to_str_arr (copy), config2 (copy), re_rawfind (copy), insert_tokenized_sub (copy), new_match (copy), from_str_arr (copy)
	if p17 ~= nil and type(p17) ~= "number" and type(p17) ~= "string" then
		error(string.format("invalid argument #5 to 'sub' (string expected, got %s)", (typeof(p17))), 3)
	end
	local config = { l = false, o = false, u = false }
	
	for i in string.gmatch(p17 or "", utf8.charpattern) do
		if config[i] ~= false then
			error("invalid regular expression substitution flag " .. i, 3)
		end
		config[i] = true
	end
	local ValueType = type(Callback)
	
	if ValueType == "number" then
		Callback ..= ""
	elseif ValueType ~= "string" and ValueType ~= "function" and (not config.o or ValueType ~= "table") then
		error(string.format("invalid argument #2 to 'sub' (string/function%s expected, got %s)", if config.o then "/table" else "", (typeof(Callback))), 3)
	end
	if tonumber(p16) then
		p16 = tonumber(p16)
		
		if p16 <= -1 or p16 ~= p16 then
			p16 = 1e999
		end
	elseif p16 == nil then
		p16 = 1e999
	else
		error(string.format("invalid argument #4 to 'sub' (number expected, got %s)", (typeof(p16))), 3)
	end
	if p16 < 1 then
		return p15, 0
	end
	local Count1 = 0
	
	if ValueType == "string" then
		Callback = to_str_arr(Callback)
		
		if not config.l then
			local v17 = 0
			local Buffer = table.create(3)
			local GroupN = p14.token.group_n
			local List4 = {}
			while v17 < Callback.n do
				local Count3: number = v17
				repeat
					Count3 += 1
				until not Callback[Count3] or (Callback[Count3] == 36 or Callback[Count3] == 92) or (Callback[Count3] == 58 or Callback[Count3] == 125) and List4[1]
				Count1 += Count3 - v17 - 1
				
				if Count3 - v17 > 1 then
					table.insert(Buffer, table.move(Callback, v17 + 1, Count3 - 1, 1, table.create(Count3 - v17 - 1)))
				end
				if Callback[Count3] == 58 then
					local Entry = List4[1]
					
					if Entry[2] then
						error("malformed substitution pattern", 3)
					end
					Entry[2] = table.move(Buffer, Entry[3], #Buffer, 1, table.create(#Buffer + 1 - Entry[3]))
					
					for i2 = #Buffer, Entry[3], -1 do
						Buffer[i2] = nil
					end
				elseif Callback[Count3] == 125 then
					local Removed = table.remove(List4, 1)
					local MoveResult1 = table.move(Buffer, Removed[3], #Buffer, 1, table.create(#Buffer + 1 - Removed[3]))
					
					for i3 = #Buffer, Removed[3], -1 do
						Buffer[i3] = nil
					end
					table.insert(Buffer, {
						"condition",
						Removed[1],
						Removed[2] ~= true and (Removed[2] or MoveResult1),
						Removed[2] and MoveResult1
					})
				elseif Callback[Count3] then
					Count3 += 1
					local CallbackEntry: number = Callback[Count3]
					
					if CallbackEntry then
						if CallbackEntry == 92 and Callback[Count3 - 1] == 36 then
							local List1 = Buffer[#Buffer]
							
							if type(List1) == "table" then
								table.insert(List1, 36)
							else
								table.insert(Buffer, { 36 })
							end
							Count3 -= 1
							Count1 += 1
						elseif CallbackEntry == 48 then
							table.insert(Buffer, 0)
						elseif CallbackEntry > 48 and CallbackEntry <= 57 then
							local CallbackEntryDelta = CallbackEntry - 48
							while Callback[Count3 + 1] and (Callback[Count3 + 1] >= 48 and Callback[Count3 + 1] <= 57) do
								CallbackEntryDelta ..= Callback[Count3 + 1] - 48
								Count3 += 1
							end
							local Number: number? = tonumber(CallbackEntryDelta)
							
							if not config.u and GroupN < Number then
								error("reference to non-existent subpattern", 3)
							end
							table.insert(Buffer, Number)
						elseif CallbackEntry == 123 and Callback[Count3 - 1] == 36 then
							Count3 += 1
							local Count4: number = Count3
							while Callback[Count3] and (Callback[Count3] >= 48 and Callback[Count3] <= 57 or Callback[Count3] >= 65 and Callback[Count3] <= 90 or Callback[Count3] >= 97 and Callback[Count3] <= 122 or Callback[Count3] == 95) do
								Count3 += 1
							end
							if (Callback[Count3] == 125 or Callback[Count3] == 58 and (Callback[Count3 + 1] == 43 or Callback[Count3 + 1] == 45)) and Count3 ~= Count4 then
								local S: string = Callback.s
								local OffsetResult = utf8.offset(S, Count3)
								local Segment = string.sub(S, utf8.offset(S, Count4), OffsetResult and OffsetResult - 1)
								local Number = nil
								
								if Callback[Count4] >= 48 and Callback[Count4] <= 57 then
									Number = tonumber(Segment)
									
									if not config.u and GroupN < Number then
										error("reference to non-existent subpattern", 3)
									end
								else
									Number = p14.group_id[Segment]
									
									if not config.u and (not Number or GroupN < Number) then
										error("reference to non-existent subpattern", 3)
									end
								end
								if Callback[Count3] == 58 then
									Count3 += 1
									table.insert(List4, { Number, Callback[Count3] == 45, #Buffer + 1 })
								else
									table.insert(Buffer, Number)
								end
							else
								error("malformed substitution pattern", 3)
							end
						else
							local v18 = nil
							
							if Callback[Count3 - 1] == 36 then
								if CallbackEntry ~= 36 then
									local List2 = Buffer[#Buffer]
									
									if type(List2) == "table" then
										table.insert(List2, 36)
									else
										table.insert(Buffer, { 36 })
									end
								end
							else
								v18 = config2[Callback[Count3]]
								
								if type(v18) ~= "number" then
									v18 = nil
								end
							end
							local List3 = Buffer[#Buffer]
							
							if type(List3) == "table" then
								table.insert(List3, v18 or Callback[Count3])
							else
								table.insert(Buffer, { v18 or Callback[Count3] })
							end
							Count1 += 1
						end
					else
						if Callback[Count3 - 1] == 92 then
							error("replacement string must not end with a trailing backslash", 3)
						end
						local List = Buffer[#Buffer]
						
						if type(List) == "table" then
							table.insert(List, Callback[Count3 - 1])
						else
							table.insert(Buffer, { Callback[Count3 - 1] })
						end
					end
				end
				v17 = Count3
			end
			if List4[1] then
				error("malformed substitution pattern", 3)
			end
			if Buffer[2] or type(Buffer[1]) ~= "table" or Buffer[1][1] == "condition" then
				Callback = Buffer
				ValueType = "subst_string"
			else
				local BufferEntry = Buffer[1]
				Callback.n = #Buffer[1]
				Callback = BufferEntry
			end
		end
	end
	local Str_arr = to_str_arr(p15)
	local Count2 = 0
	local Count = 1
	local v19 = 0
	while Count <= Str_arr.n + Count2 + 1 do
		local Re_rawfindResult = re_rawfind(p14.token, Str_arr, Count, p14.flags, p14.verb_flags, false)
		
		if not Re_rawfindResult then break end
		local MoveResult = nil
		
		if ValueType == "string" then
			MoveResult = Callback
		elseif ValueType == "subst_string" then
			MoveResult = insert_tokenized_sub(table.create(Count1), Str_arr, Re_rawfindResult, Callback)
		else
			local Segment1 = nil
			local CallbackEntry = nil
			if ValueType == "table" then
				local S: string = Str_arr.s
				local OffsetResult = utf8.offset(S, Re_rawfindResult[0][2])
				Segment1 = string.sub(S, utf8.offset(S, Re_rawfindResult[0][1]), OffsetResult and OffsetResult - 1)
				CallbackEntry = Callback[Segment1]
			else
				Segment1 = new_match(Re_rawfindResult, p14.group_id, Source, Str_arr.s)
				CallbackEntry = Callback(Segment1)
			end
			if CallbackEntry == Segment1 or config.o and not CallbackEntry then
				local Re_rawfindResultEntryDelta = Re_rawfindResult[0][2] - Re_rawfindResult[0][1]
				MoveResult = table.move(Str_arr, Re_rawfindResult[0][1], Re_rawfindResult[0][2] - 1, 1, table.create(Re_rawfindResultEntryDelta))
				MoveResult.n = Re_rawfindResultEntryDelta
			elseif type(CallbackEntry) == "string" then
				MoveResult = to_str_arr(CallbackEntry)
			elseif type(CallbackEntry) == "number" then
				MoveResult = to_str_arr(CallbackEntry .. "")
			elseif config.o then
				error(string.format("invalid replacement value (a %s)", (type(CallbackEntry))), 3)
			else
				MoveResult = { n = 0 }
			end
		end
		local v20 = Re_rawfindResult[0][2] - Re_rawfindResult[0][1]
		local Smallest = math.min(MoveResult.n, v20)
		
		for i1 = 0, Smallest - 1 do
			Str_arr[Re_rawfindResult[0][1] + i1] = MoveResult[i1 + 1]
		end
		local Index = Re_rawfindResult[0][1] + Smallest
		Count = Re_rawfindResult[0][2]
		
		if MoveResult.n < v20 then
			for _ = 1, v20 - MoveResult.n do
				table.remove(Str_arr, Index)
				Count2 -= 1
				Count -= 1
			end
		elseif v20 < MoveResult.n then
			for i4 = 1, MoveResult.n - v20 do
				table.insert(Str_arr, Index + i4 - 1, MoveResult[Smallest + i4])
				Count2 += 1
				Count += 1
			end
		end
		if v20 <= 0 then
			Count += 1
		end
		v19 += 1
		
		if p16 < v19 + 1 then break end
	end
	return from_str_arr(Str_arr), v19
end

local v21 = "sub"

function t1.sub(...) --[[ Line: 185 ]]
	-- upvalues: self (copy), v21 (copy), t (copy), v42 (copy)
	local Selected: number = select("#", ...)
	
	if Selected < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif Selected < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local v22, v23, Largest, v24, v25, v26 = ...
	
	if self[v22] and self[v22].name == "RegEx" then
		if v21 == "sub" then
			if type(Largest) == "number" then
				Largest ..= ""
			elseif type(Largest) ~= "string" then
				error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(Largest))), 2)
			end
		elseif type(v23) == "number" then
			v23 ..= ""
		elseif type(v23) ~= "string" then
			error(string.format("invalid argument #2 to %q (string expected, got %s)", v21, (typeof(v23))), 2)
		end
	else
		if type(v22) ~= "string" and type(v22) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", v21, (typeof(v22))), 2)
		end
		v22 = t.fromstring(v22)
	end
	if v21 ~= "sub" and v21 ~= "split" then
		local ValueType = typeof(Largest)
		
		if ValueType ~= "nil" then
			Largest = tonumber(Largest)
			
			if Largest then
				if Largest < 0 then
					Largest = #v23 + math.floor(Largest + 0.5) + 1
				else
					Largest = math.max(math.floor(Largest + 0.5), 1)
				end
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", v21, ValueType), 2)
			end
		end
	end
	local SelfEntry = self[v22]
	
	if v21 == "match" or v21 == "matchiter" then
		v24 = (...)
	elseif v21 == "sub" then
		v26 = (...)
	end
	return v42(SelfEntry, v23, Largest, v24, v25, v26)
end

local function v44(p18, p19, p20: number?) --[[ Line: 1076 ]]
	-- upvalues: to_str_arr (copy), re_rawfind (copy)
	if tonumber(p20) then
		p20 = tonumber(p20)
		
		if p20 <= -1 or p20 ~= p20 then
			p20 = 1e999
		end
	elseif p20 == nil then
		p20 = 1e999
	else
		error(string.format("invalid argument #3 to 'split' (number expected, got %s)", (typeof(p20))), 3)
	end
	local Str_arr = to_str_arr(p19)
	local Total = 1
	local Count = 0
	local List = {}
	local v22 = 0
	while Total <= Str_arr.n + 1 do
		Count += 1
		local Re_rawfindResult = Count <= p20 and re_rawfind(p18.token, Str_arr, Total, p18.flags, p18.verb_flags, false)
		
		if not Re_rawfindResult then break end
		local S: string = Str_arr.s
		local OffsetResult = utf8.offset(S, Re_rawfindResult[0][1])
		table.insert(List, (string.sub(S, utf8.offset(S, Total - v22), OffsetResult and OffsetResult - 1)))
		v22 = if Re_rawfindResult[0][2] <= Re_rawfindResult[0][1] then 1 else 0
		Total = Re_rawfindResult[0][2] + v22
	end
	table.insert(List, (string.sub(Str_arr.s, utf8.offset(Str_arr.s, Total - v22))))
	
	return List
end

local v23 = "split"

function t1.split(...) --[[ Line: 185 ]]
	-- upvalues: self (copy), v23 (copy), t (copy), v44 (copy)
	local Selected: number = select("#", ...)
	
	if Selected < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif Selected < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local v24, v25, Largest, v26, v27, v28 = ...
	
	if self[v24] and self[v24].name == "RegEx" then
		if v23 == "sub" then
			if type(Largest) == "number" then
				Largest ..= ""
			elseif type(Largest) ~= "string" then
				error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", (typeof(Largest))), 2)
			end
		elseif type(v25) == "number" then
			v25 ..= ""
		elseif type(v25) ~= "string" then
			error(string.format("invalid argument #2 to %q (string expected, got %s)", v23, (typeof(v25))), 2)
		end
	else
		if type(v24) ~= "string" and type(v24) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", v23, (typeof(v24))), 2)
		end
		v24 = t.fromstring(v24)
	end
	if v23 ~= "sub" and v23 ~= "split" then
		local ValueType = typeof(Largest)
		
		if ValueType ~= "nil" then
			Largest = tonumber(Largest)
			
			if Largest then
				if Largest < 0 then
					Largest = #v25 + math.floor(Largest + 0.5) + 1
				else
					Largest = math.max(math.floor(Largest + 0.5), 1)
				end
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", v23, ValueType), 2)
			end
		end
	end
	local SelfEntry = self[v24]
	
	if v23 == "match" or v23 == "matchiter" then
		v26 = (...)
	elseif v23 == "sub" then
		v28 = (...)
	end
	return v44(SelfEntry, v25, Largest, v26, v27, v28)
end

local _ = function(p21, p22) --[[ Line: 1106 | Named "re_index" ]]
	-- upvalues: t1 (ref), self (copy)
	return t1[p22] or self[p21].flags[p22]
end

local function re_tostr(p21): string --[[ Line: 1110 ]]
	-- upvalues: self (copy)
	return self[p21].pattern_repr .. self[p21].flag_repr
end

local config6 = {
	[58] = true,
	[33] = true,
	[61] = true,
	[62] = true,
	[124] = true
}

local function tokenize_ptn(List, Flags) --[[ Line: 1126 ]]
	-- upvalues: config5 (copy), config6 (copy), list3 (copy), list1 (copy), config2 (copy), config1 (copy), config3 (copy), list2 (copy), list (copy)
	if Flags.unicode then
		return "USE_UNICODE_DATA has always been false, so you cannot also use the unicode flag"
	end
	local Count: number? = 1
	local N = List.n
	local Count1 = 0
	local List1 = {}
	local t = {}
	local config = { newline = 1, newline_seq = 1, not_empty = 0 }
	local Count6 = nil
	local Entry6 = nil
	local Count8 = nil
	local Entry7 = nil
	local Entry3 = nil
	local Largest1 = nil
	local Count5 = nil
	while Count <= N do
		local Entry1: number = List[Count]
		
		if Entry1 == 40 then
			local Entry = nil
			
			if List[Count + 1] == 42 then
				Count += 2
				local Count2: number = Count
				while List[Count] and (List[Count] >= 48 and List[Count] <= 57 or List[Count] >= 65 and List[Count] <= 90 or List[Count] >= 97 and List[Count] <= 122 or (List[Count] == 95 or List[Count] == 58)) do
					Count += 1
				end
				if List[Count] ~= 41 and List[Count - 1] ~= 58 then
					return "quantifier doesn't follow a repeatable pattern"
				end
				local S = List.s
				local OffsetResult = utf8.offset(S, Count)
				local OffsetResult1 = utf8.offset(S, Count2)
				local Segment = string.sub(S, OffsetResult1, OffsetResult and OffsetResult - 1)
				
				if Segment == "positive_lookahead:" or Segment == "negative_lookhead:" or Segment == "positive_lookbehind:" or Segment == "negative_lookbehind:" or Segment:find("^[pn]l[ab]:$") then
					OffsetResult = 40
					OffsetResult1 = if Segment:find("^n") then 33 else 61
					S = {
						OffsetResult,
						nil,
						nil,
						OffsetResult1,
						Segment:find("b", 3, true) and 1
					}
					Entry = S
				elseif Segment == "atomic:" then
					Entry = {
						40,
						nil,
						nil,
						62,
						nil
					}
				elseif Segment == "ACCEPT" or Segment == "FAIL" or Segment == "F" or Segment == "PRUNE" or Segment == "SKIP" then
					S = if Segment == "F" then "FAIL" else Segment
					Entry = S
				else
					if config5[Segment] then
						config.newline = Segment
					elseif Segment == "BSR_ANYCRLF" or Segment == "BSR_UNICODE" then
						S = if Segment == "BSR_UNICODE" then 1 else 0
						config.newline_seq = S
					else
						if Segment ~= "NOTEMPTY" and Segment ~= "NOTEMPTY_ATSTART" then
							return "unknown or malformed verb"
						end
						S = if Segment == "NOTEMPTY" then 1 else 2
						config.not_empty = S
					end
					if List1[1] then
						return "this verb must be placed at the beginning of the regex"
					end
				end
			elseif List[Count + 1] == 63 then
				Count += 2
				
				if List[Count] == 35 then
					Count = table.find(List, 41, Count)
					
					if not Count then
						return "unterminated parenthetical"
					end
					Count += 1
					continue
				else
					if not List[Count] then
						return "unterminated parenthetical"
					end
					Entry = {
						40,
						nil,
						nil,
						List[Count],
						nil
					}
					
					if List[Count] == 48 and List[Count + 1] == 41 then
						Entry[1] = "recurmatch"
						Entry[2] = 0
						Entry[3] = 0
						Entry[5] = nil
					elseif List[Count] > 48 and List[Count] <= 57 then
						local Count4: number = Count
						Count += 1
						while List[Count] >= 48 and List[Count] <= 48 do
							Count += 1
						end
						if List[Count] ~= 41 then
							return "invalid group structure"
						end
						local S: string = List.s
						local OffsetResult = utf8.offset(S, Count)
						Entry[1] = "recurmatch"
						Entry[2] = tonumber((string.sub(S, utf8.offset(S, Count4), OffsetResult and OffsetResult - 1)))
						Entry[4] = nil
					elseif List[Count] == 60 and List[Count + 1] == 33 or List[Count + 1] == 61 then
						Count += 1
						Entry[4] = List[Count]
						Entry[5] = 1
					elseif List[Count] == 124 then
						Entry[5] = Count1
					elseif List[Count] == 80 or List[Count] == 60 or List[Count] == 39 then
						if List[Count] == 80 then
							Count += 1
						end
						if List[Count] == 61 then
							local NewCount = Count + 1
							while List[Count] and (List[Count] >= 48 and List[Count] <= 57 or List[Count] >= 65 and List[Count] <= 90 or List[Count] >= 97 and List[Count] <= 122 or List[Count] == 95) do
								Count += 1
							end
							if not List[Count] then
								return "unterminated parenthetical"
							end
							if List[Count] ~= 41 or Count == NewCount then
								return "invalid group structure"
							end
							local S: string = List.s
							local OffsetResult = utf8.offset(S, Count)
							Entry = {
								"backref",
								(string.sub(S, utf8.offset(S, NewCount), OffsetResult and OffsetResult - 1))
							}
						else
							if List[Count] ~= 60 and (List[Count - 1] == 80 or List[Count] ~= 39) then
								return "invalid group structure"
							end
							local v24: number = if List[Count] == 39 then 39 else 62
							local NewCount1 = Count + 1
							Count += 1
							
							if List[Count] == 41 then
								return "missing character in subpattern"
							end
							if List[Count] >= 48 and List[Count] <= 57 then
								return "subpattern name must not begin with a digit"
							end
							if (List[Count] < 65 or List[Count] > 90) and (List[Count] < 97 or List[Count] > 122) and List[Count] ~= 95 then
								return "invalid character in subpattern"
							end
							Count += 1
							while List[Count] and (List[Count] >= 48 and List[Count] <= 57 or List[Count] >= 65 and List[Count] <= 90 or List[Count] >= 97 and List[Count] <= 122 or List[Count] == 95) do
								Count += 1
							end
							if not List[Count] then
								return "unterminated parenthetical"
							end
							if List[Count] ~= v24 then
								return "invalid character in subpattern"
							end
							local S: string = List.s
							local OffsetResult = utf8.offset(S, Count)
							local Segment = string.sub(S, utf8.offset(S, NewCount1), OffsetResult and OffsetResult - 1)
							Count1 += 1
							
							if (t[Segment] or Count1) ~= Count1 then
								return "subpattern name already exists"
							end
							for i, value in pairs(t) do
								if Segment ~= i and Count1 == value then
									return "different names for subpatterns of the same number aren't permitted"
								end
							end
							t[Segment] = Count1
							Entry[2] = Count1
							Entry[4] = nil
						end
					elseif not config6[List[Count]] then
						return "invalid group structure"
					end
				end
			else
				Count1 += 1
				Entry = { 40, Count1, nil, nil }
			end
			if Entry then
				table.insert(List1, Entry)
			end
		elseif Entry1 == 41 then
			local v25 = #List1 + 1
			Count5 = -1
			Count6 = 0
			Largest1 = 0
			Count8 = 0
			repeat
				v25 -= 1
				Entry7 = List1[v25]
				local IsTable1 = type(List1[v25]) == "table"
				if IsTable1 and Entry7[1] == 40 then
					Count8 += 1
					
					if Count6 and Entry7.count then
						Count6 += Entry7.count
					end
					if not Entry7[3] then
						if Entry7[4] == 124 then
							Count1 = Entry7[5] + math.max(Largest1, Count8)
						end
						if Count6 == Count5 or Count5 == -1 then
							Count5 = Count6
							break
						else
							Count5 = nil
							break
						end
					end
				elseif Entry7 == list3 then
					if Count6 == Count5 or Count5 == -1 then
						Count5 = Count6
						Count6 = 0
					else
						Count5 = nil
						Count6 = nil
					end
					Largest1 = math.max(Largest1, Count8)
					Count8 = 0
				elseif Count6 then
					if IsTable1 and Entry7[1] == "quantifier" then
						if Entry7[2] == Entry7[3] then
							Count6 += Entry7[2]
						else
							Count6 = nil
						end
					else
						Count6 += 1
					end
				end
			until v25 < 1
			if v25 < 1 then
				return "unmatched ) in regular expression"
			end
			local Entry8 = List1[v25]
			local v26 = #List1 + 1
			local config4 = {
				41,
				Entry8[2],
				v25,
				Entry8[4],
				Entry8[5],
				count = Count5
			}
			
			if (Entry8[4] == 33 or Entry8[4] == 61) and (Entry8[5] and not Count5) then
				return "lookbehind assertion is not fixed width"
			end
			Entry8[3] = v26
			table.insert(List1, config4)
		elseif Entry1 == 46 then
			table.insert(List1, list1)
		elseif Entry1 == 91 then
			local Flag = false
			Entry6 = nil
			Count += 1
			local Count10: number = Count
			
			if List[Count] == 94 then
				Flag = true
				Count += 1
			elseif List[Count] == 46 or (List[Count] == 58 or List[Count] == 61) then
				Entry6 = List[Count]
			end
			local List2 = nil
			if List[Count] == 91 or List[Count] == 92 then
				List2 = {}
			else
				List2 = { List[Count] }
				Count += 1
			end
			while List[Count] ~= 93 do
				if not List[Count] then
					return "unterminated character class"
				end
				if List[Count] == 45 and List2[1] and type(List2[1]) == "number" then
					if List[Count + 1] == 93 then
						table.insert(List2, 1, 45)
					else
						Count += 1
						local Entry4 = List[Count]
						
						if Entry4 == 91 then
							if List[Count + 1] == 46 or List[Count + 1] == 58 or List[Count + 1] == 61 then
								local NewCount4: number? = Count + 2
								repeat
									NewCount4 = table.find(List, 93, NewCount4)
								until not NewCount4 or List[NewCount4 - 1] ~= 92
								if not NewCount4 then
									return "unterminated character class"
								end
								if List[NewCount4 - 1] == List[Count + 1] and NewCount4 - 1 ~= Count + 1 then
									return "invalid range in character class"
								end
							end
							if List2[1] > 91 then
								return "invalid range in character class"
							end
						elseif Entry4 == 92 then
							Count += 1
							
							if List[Count] == 120 then
								local v27: number? = nil
								local EntryDelta2 = nil
								Count += 1
								
								if List[Count] and List[Count] >= 48 and List[Count] <= 57 or List[Count] >= 65 and List[Count] <= 70 or List[Count] >= 97 and List[Count] <= 102 then
									local Entry5 = List[Count]
									v27 = Entry5 - (if List[Count] >= 65 and List[Count] <= 90 then 55 elseif List[Count] >= 97 and List[Count] <= 122 then 87 else 48)
									Count += 1
									
									if List[Count] and List[Count] >= 48 and List[Count] <= 57 or List[Count] >= 65 and List[Count] <= 70 or List[Count] >= 97 and List[Count] <= 102 then
										Entry5 = List[Count]
										EntryDelta2 = Entry5 - (if List[Count] >= 65 and List[Count] <= 90 then 55 elseif List[Count] >= 97 and List[Count] <= 122 then 87 else 48)
									else
										Count -= 1
									end
								else
									Count -= 1
								end
								Entry4 = v27 and (EntryDelta2 and 16 * v27 + EntryDelta2 or v27) or 0
							elseif List[Count] >= 48 and List[Count] <= 55 then
								local EntryDelta6 = List[Count] - 48
								local v28: number? = nil
								local v29: number? = nil
								Count += 1
								
								if List[Count] and List[Count] >= 48 and List[Count] <= 55 then
									v28 = List[Count] - 48
									Count += 1
									
									if List[Count] and List[Count] >= 48 and List[Count] <= 55 then
										v29 = List[Count] - 48
									else
										Count -= 1
									end
								else
									Count -= 1
								end
								Entry4 = v28 and (v29 and 64 * EntryDelta6 + 8 * v28 + v29 or 8 * EntryDelta6 + v28) or EntryDelta6
							else
								Entry4 = config2[List[Count]] or List[Count]
								
								if type(Entry4) ~= "number" then
									return "invalid range in character class"
								end
							end
						elseif Entry4 < List2[1] then
							return "invalid range in character class"
						end
						List2[1] = { "range", List2[1], Entry4 }
					end
				elseif List[Count] == 91 then
					if List[Count + 1] == 46 or List[Count + 1] == 58 or List[Count + 1] == 61 then
						local NewCount: number? = Count + 2
						repeat
							NewCount = table.find(List, 93, NewCount)
						until not NewCount or List[NewCount - 1] ~= 92
						if not NewCount then
							return "unterminated character class"
						end
						if List[NewCount - 1] == List[Count + 1] and NewCount - 1 ~= Count + 1 then
							if List[NewCount - 1] == 46 or List[NewCount - 1] == 61 then
								return "POSIX collating elements aren't supported"
							end
							if List[NewCount - 1] == 58 then
								local IsEntryMatch = List[Count + 3] == 94
								local S1: string = List.s
								local OffsetResult = utf8.offset(S1, NewCount - 1)
								local Segment = string.sub(S1, utf8.offset(S1, Count + (if IsEntryMatch then 3 else 2)), OffsetResult and OffsetResult - 1)
								
								if not config1[Segment] then
									return "unknown POSIX class name"
								end
								table.insert(List2, 1, { "class", Segment, IsEntryMatch })
								Count = NewCount
							end
						else
							table.insert(List2, 1, 91)
						end
					else
						table.insert(List2, 1, 91)
					end
				elseif List[Count] == 92 then
					Count += 1
					
					if List[Count] == 120 then
						local EntryDelta5: number? = nil
						local EntryDelta = nil
						Count += 1
						
						if List[Count] == 123 then
							Count += 1
							local Count11: number = Count
							while List[Count] and (List[Count] >= 48 and List[Count] <= 57 or List[Count] >= 65 and List[Count] <= 70 or List[Count] >= 97 and List[Count] <= 102) do
								Count += 1
							end
							if List[Count] ~= 125 or Count == Count11 then
								return "malformed hexadecimal character"
							end
							if Count - Count11 > 4 then
								return "character offset too large"
							end
							local S: string = List.s
							local OffsetResult = utf8.offset(S, Count)
							table.insert(List2, 1, (tonumber(string.sub(S, utf8.offset(S, Count11), OffsetResult and OffsetResult - 1), 16)))
						else
							if List[Count] and (List[Count] >= 48 and List[Count] <= 57) or (List[Count] >= 65 and List[Count] <= 70 or List[Count] >= 97 and List[Count] <= 102) then
								local Entry2 = List[Count]
								EntryDelta5 = Entry2 - (if List[Count] >= 65 and List[Count] <= 90 then 55 elseif List[Count] >= 97 and List[Count] <= 122 then 87 else 48)
								Count += 1
								
								if List[Count] and List[Count] >= 48 and List[Count] <= 57 or List[Count] >= 65 and List[Count] <= 70 or List[Count] >= 97 and List[Count] <= 102 then
									Entry2 = List[Count]
									EntryDelta = Entry2 - (if List[Count] >= 65 and List[Count] <= 90 then 55 elseif List[Count] >= 97 and List[Count] <= 122 then 87 else 48)
								else
									Count -= 1
								end
							else
								Count -= 1
							end
							table.insert(List2, 1, EntryDelta5 and (EntryDelta and 16 * EntryDelta5 + EntryDelta or EntryDelta5) or 0)
						end
					elseif List[Count] >= 48 and List[Count] <= 55 then
						local EntryDelta = List[Count] - 48
						local EntryDelta4: number? = nil
						local EntryDelta1: number? = nil
						Count += 1
						
						if List[Count] and List[Count] >= 48 and List[Count] <= 55 then
							EntryDelta4 = List[Count] - 48
							Count += 1
							
							if List[Count] and List[Count] >= 48 and List[Count] <= 55 then
								EntryDelta1 = List[Count] - 48
							else
								Count -= 1
							end
						else
							Count -= 1
						end
						table.insert(List2, 1, EntryDelta4 and (EntryDelta1 and 64 * EntryDelta + 8 * EntryDelta4 + EntryDelta1 or 8 * EntryDelta + EntryDelta4) or EntryDelta)
					elseif List[Count] ~= 69 then
						if List[Count] == 81 then
							local NewCount3 = Count + 1
							repeat
								Count = table.find(List, 92, Count + 1)
							until not Count or List[Count + 1] == 69
							table.move(List, NewCount3, Count and Count - 1 or #List, #List1 + 1, List1)
							
							if not Count then break end
							Count += 1
						elseif List[Count] == 78 then
							if List[Count + 1] ~= 123 or List[Count + 2] ~= 85 or List[Count + 3] ~= 43 or not Flags.unicode then
								return "invalid escape sequence"
							end
							Count += 4
							local Count7: number = Count
							while List[Count] and (List[Count] >= 48 and List[Count] <= 57 or List[Count] >= 65 and List[Count] <= 70 or List[Count] >= 97 and List[Count] <= 102) do
								Count += 1
							end
							if List[Count] ~= 125 or Count == Count7 then
								return "malformed Unicode code point"
							end
							local S: string = List.s
							local OffsetResult = utf8.offset(S, Count)
							table.insert(List2, 1, (tonumber((string.sub(S, utf8.offset(S, Count7), OffsetResult and OffsetResult - 1)))))
						else
							if List[Count] == 80 or List[Count] == 112 then
								return "USE_UNICODE_DATA in regexp has always been disabled. Do not use the flag \\p"
							end
							if List[Count] == 111 then
								Count += 1
								
								if List[Count] ~= 123 then
									return "malformed octal code"
								end
								Count += 1
								local Count13: number = Count
								while List[Count] and List[Count] >= 48 and List[Count] <= 55 do
									Count += 1
								end
								if List[Count] ~= 125 or Count == Count13 then
									return "malformed octal code"
								end
								local S: string = List.s
								local OffsetResult = utf8.offset(S, Count)
								local Number: number? = tonumber(string.sub(S, utf8.offset(S, Count13), OffsetResult and OffsetResult - 1), 8)
								
								if Number > 65535 then
									return "character offset too large"
								end
								table.insert(List2, 1, Number)
							else
								local Entry9 = config2[List[Count]]
								table.insert(List2, 1, type(Entry9) == "string" and { "class", Entry9, false } or (Entry9 or List[Count]))
							end
						end
					end
				elseif Flags.ignoreCase and (List[Count] >= 97 and List[Count] <= 122) then
					table.insert(List2, 1, List[Count] - 32)
				else
					table.insert(List2, 1, List[Count])
				end
				Count += 1
			end
			if List[Count - 1] == Entry6 and Count - 1 ~= Count10 then
				return if Entry6 == 58 then "POSIX named classes are only support within a character set" else "POSIX collating elements aren't supported"
			end
			if List2[2] or Flag then
				table.insert(List1, { "charset", Flag, List2 })
			else
				table.insert(List1, List2[1])
			end
		elseif Entry1 == 92 then
			Count += 1
			local Entry11: number = List[Count]
			
			if not Entry11 then
				return "pattern may not end with a trailing backslash"
			end
			if Entry11 >= 48 and Entry11 <= 57 then
				local Count14: number = Count
				while List[Count + 1] and (List[Count + 1] >= 48 and List[Count + 1] <= 57) do
					Count += 1
				end
				local S = List.s
				local EntryDelta3: number? = utf8.offset(S, Count + 1)
				local StartIndex = utf8.offset(S, Count14)
				local Number: number? = tonumber((string.sub(S, StartIndex, EntryDelta3 and EntryDelta3 - 1)))
				
				if Count1 < Number and Count ~= Count14 then
					Count = Count14
					local v30: number? = nil
					S = nil
					EntryDelta3 = nil
					
					if List[Count] <= 55 then
						v30 = List[Count] - 48
						Count += 1
						
						if List[Count] and (List[Count] >= 48 and List[Count] <= 55) then
							S = List[Count] - 48
							Count += 1
							
							if List[Count] and List[Count] >= 48 and List[Count] <= 55 then
								EntryDelta3 = List[Count] - 48
							else
								Count -= 1
							end
						else
							Count -= 1
						end
					end
					StartIndex = v30 and (S and (EntryDelta3 and 64 * v30 + 8 * S + EntryDelta3 or 8 * v30 + S) or v30) or List[Count14]
					table.insert(List1, StartIndex)
				else
					table.insert(List1, { "backref", Number })
				end
			elseif Entry11 ~= 69 then
				if Entry11 == 81 then
					local NewCount2 = Count + 1
					repeat
						Count = table.find(List, 92, Count + 1)
					until not Count or List[Count + 1] == 69
					table.move(List, NewCount2, Count and Count - 1 or #List, #List1 + 1, List1)
					
					if not Count then break end
					Count += 1
				elseif Entry11 == 78 then
					if List[Count + 1] == 123 and List[Count + 2] == 85 and List[Count + 3] == 43 and Flags.unicode then
						Count += 4
						local Count12: number = Count
						while List[Count] and (List[Count] >= 48 and List[Count] <= 57 or (List[Count] >= 65 and List[Count] <= 70 or List[Count] >= 97 and List[Count] <= 102)) do
							Count += 1
						end
						if List[Count] ~= 125 or Count == Count12 then
							return "malformed Unicode code point"
						end
						local S: string = List.s
						local OffsetResult = utf8.offset(S, Count)
						table.insert(List1, (tonumber((string.sub(S, utf8.offset(S, Count12), OffsetResult and OffsetResult - 1)))))
					else
						table.insert(List1, config2[78])
					end
				else
					if Entry11 == 80 or Entry11 == 112 then
						return "USE_UNICODE_DATA in regexp has always been disabled. Do not use the flag \\p"
					end
					if Entry11 == 103 and (List[Count + 1] == 123 or List[Count + 1] >= 48 and List[Count + 1] <= 57) then
						local Flag = false
						Count += 1
						
						if List[Count] == 123 then
							Count += 1
							Flag = true
						elseif List[Count] < 48 or List[Count] > 57 then
							return "malformed reference code"
						end
						local Count9: number = Count
						while List[Count] and (List[Count] >= 48 and List[Count] <= 57 or (List[Count] >= 65 and List[Count] <= 70 or List[Count] >= 97 and List[Count] <= 102)) do
							Count += 1
						end
						if Flag and List[Count] ~= 125 then
							return "malformed reference code"
						end
						local S: string = List.s
						local OffsetResult = utf8.offset(S, Count + (if Flag then 0 else 1))
						table.insert(List1, {
							"backref",
							(tonumber((string.sub(S, utf8.offset(S, Count9), OffsetResult and OffsetResult - 1))))
						})
						
						if not Flag then
							Count -= 1
						end
					elseif Entry11 == 111 then
						Count += 1
						
						if List[Count + 1] ~= 123 then
							return "malformed octal code"
						end
						Count += 1
						local Count16: number = Count
						while List[Count] and List[Count] >= 48 and List[Count] <= 55 do
							Count += 1
						end
						if List[Count] ~= 125 or Count == Count16 then
							return "malformed octal code"
						end
						local S: string = List.s
						local OffsetResult = utf8.offset(S, Count)
						local Number: number? = tonumber(string.sub(S, utf8.offset(S, Count16), OffsetResult and OffsetResult - 1), 8)
						
						if Number > 65535 then
							return "character offset too large"
						end
						table.insert(List1, Number)
					elseif Entry11 == 120 then
						local v31: number? = nil
						local EntryDelta7 = nil
						Count += 1
						
						if List[Count] == 123 then
							Count += 1
							local Count17: number = Count
							while List[Count] and (List[Count] >= 48 and List[Count] <= 57 or (List[Count] >= 65 and List[Count] <= 70 or List[Count] >= 97 and List[Count] <= 102)) do
								Count += 1
							end
							if List[Count] ~= 125 or Count == Count17 then
								return "malformed hexadecimal code"
							end
							if Count - Count17 > 4 then
								return "character offset too large"
							end
							local S: string = List.s
							local OffsetResult = utf8.offset(S, Count)
							table.insert(List1, (tonumber(string.sub(S, utf8.offset(S, Count17), OffsetResult and OffsetResult - 1), 16)))
						else
							if List[Count] and (List[Count] >= 48 and List[Count] <= 57 or (List[Count] >= 65 and List[Count] <= 70 or List[Count] >= 97 and List[Count] <= 102)) then
								local Entry10 = List[Count]
								v31 = Entry10 - (if List[Count] >= 65 and List[Count] <= 90 then 55 elseif List[Count] >= 97 and List[Count] <= 122 then 87 else 48)
								Count += 1
								
								if List[Count] and (List[Count] >= 48 and List[Count] <= 57 or (List[Count] >= 65 and List[Count] <= 70 or List[Count] >= 97 and List[Count] <= 102)) then
									Entry10 = List[Count]
									EntryDelta7 = Entry10 - (if List[Count] >= 65 and List[Count] <= 90 then 55 elseif List[Count] >= 97 and List[Count] <= 122 then 87 else 48)
								else
									Count -= 1
								end
							else
								Count -= 1
							end
							table.insert(List1, v31 and (EntryDelta7 and 16 * v31 + EntryDelta7 or v31) or 0)
						end
					else
						table.insert(List1, config3[Entry11] or config2[Entry11] or Entry11)
					end
				end
			end
		elseif Entry1 == 42 or Entry1 == 43 or (Entry1 == 63 or Entry1 == 123) then
			local Number: number? = nil
			local Number1: number? = nil
			
			if Entry1 == 123 then
				local NewCount = Count + 1
				local v32: number? = nil
				while List[Count + 1] and (List[Count + 1] >= 48 and List[Count + 1] <= 57 or List[Count + 1] == 44 and (not v32 and Count + 1 ~= NewCount)) do
					Count += 1
					
					if List[Count] == 44 then
						v32 = Count
					end
				end
				if List[Count + 1] == 125 then
					Count += 1
					
					if v32 then
						local S = List.s
						local OffsetResult = utf8.offset(S, v32)
						local EndIndex: number = OffsetResult and OffsetResult - 1
						Number = tonumber((string.sub(S, utf8.offset(S, NewCount), EndIndex)))
						local Number2 = nil
						
						if v32 + 1 == Count then
							Number2 = 1e999
						else
							S = List.s
							local OffsetResult2 = utf8.offset(S, Count)
							EndIndex = utf8.offset(S, v32 + 1)
							Number2 = tonumber((string.sub(S, EndIndex, OffsetResult2 and OffsetResult2 - 1)))
						end
						Number1 = Number2
						
						if Number1 < Number then
							return "numbers out of order in {} quantifier"
						end
					else
						local S2: string = List.s
						local OffsetResult = utf8.offset(S2, Count)
						Number = tonumber((string.sub(S2, utf8.offset(S2, NewCount), OffsetResult and OffsetResult - 1)))
						Number1 = Number
					end
				else
					table.move(List, NewCount - 1, Count, #List1 + 1, List1)
				end
			else
				Number = if Entry1 == 43 then 1 else 0
				Number1 = if Entry1 == 63 then 1 else 1e999
			end
			if Number then
				local Possessive: string = if Flags.ungreedy then "lazy" else "greedy"
				
				if List[Count + 1] == 43 or List[Count + 1] == 63 then
					Count += 1
					Possessive = if List[Count] == 43 then "possessive" elseif Flags.ungreedy then "greedy" else "lazy"
				end
				local Count15 = #List1
				local Entry12 = List1[Count15]
				
				if not Entry12 or type(Entry12) == "table" and (Entry12[1] == "quantifier" or Entry12[1] == 40 or config3[Entry12[1]]) or (Entry12 == list3 or type(Entry12) == "string") then
					return "quantifier doesn't follow a repeatable pattern"
				end
				if Number1 == 0 then
					table.remove(List1)
				elseif Number ~= 1 or Number1 ~= 1 then
					if type(Entry12) == "table" and Entry12[1] == 41 then
						Count15 = Entry12[3]
					end
					List1[Count15] = {
						"quantifier",
						Number,
						Number1,
						Possessive,
						List1[Count15]
					}
				end
			end
		elseif Entry1 == 124 then
			table.insert(List1, list3)
			local Count3 = #List1
			repeat
				Count3 -= 1
				Entry3 = List1[Count3]
				local IsTable = type(List1[Count3]) == "table"
				if IsTable and Entry3[1] == 41 then
					Count3 = List1[Count3][3]
				elseif IsTable and Entry3[1] == 40 then
					if Entry3[4] ~= 124 then break end
					Count1 = Entry3[5]
					break
				end
			until not Entry3
		elseif Entry1 == 36 or Entry1 == 94 then
			table.insert(List1, Entry1 == 94 and list2 or list)
		elseif Flags.ignoreCase and Entry1 >= 97 and Entry1 <= 122 then
			table.insert(List1, Entry1 - 32)
		elseif Flags.extended and (Entry1 >= 9 and Entry1 <= 13 or (Entry1 == 32 or Entry1 == 35)) then
			if Entry1 == 35 then
				repeat
					Count += 1
				until not List[Count] or List[Count] == 10 or List[Count] == 13
			end
		else
			table.insert(List1, Entry1)
		end
		Count += 1
	end
	local Largest = 0
	local value1 = nil
	
	for _, value1 in ipairs(List1) do
		if type(value1) ~= "table" or value1[1] ~= 40 and (value1[1] ~= "quantifier" or (type(value1[5]) ~= "table" or value1[5][1] ~= 40)) then
			if type(value1) == "table" and (value1[1] == "backref" or value1[1] == "recurmatch") then
				if not t[value1[2]] and (type(value1[2]) ~= "number" or Count1 < value1[2]) then
					return "reference to a non-existent or invalid subpattern"
				end
				if value1[1] == "recurmatch" and value1[2] ~= 0 then
					for i1, value2 in ipairs(List1) do
						if type(value2) == "table" and (value2[1] == 40 and value2[2] == value1[2]) then
							value1[3] = i1
							break
						end
					end
				elseif type(value1[2]) == "string" then
					value1[2] = t[value1[2]]
				end
				continue
			end
			continue
		end
		if value1[1] == "quantifier" then
			value1 = value1[5]
		end
		if not value1[3] then
			return "unterminated parenthetical"
		elseif value1[2] then
			Largest = math.max(Largest, value1[2])
		end
	end
	List1.group_n = Largest
	
	return List1, t, config
end

if not tonumber(256) then
	error(string.format("expected number for options.cacheSize, got %s", "number"), 2)
end
local Number: number? = tonumber(256)
local Tbl1 = nil
local Tbl = nil

if Number then
	if Number < 0 or Number ~= Number then
		error("cache size cannot be a negative number or a NaN", 2)
	elseif Number == 1e999 then
		Tbl1 = { nil }
		Tbl = { nil }
	elseif Number >= 4294967296 then
		error("cache size too large", 2)
	else
		Tbl1 = table.create(256)
		Tbl = table.create(256)
	end
end
if Number then
	function t.pruge() --[[ Line: 1916 ]]
		-- upvalues: Tbl (ref), Tbl1 (ref)
		table.clear(Tbl)
		table.clear(Tbl1)
	end
end
local function new_re(p21, Flags, Joined, Pattern_repr) --[[ Line: 1922 ]]
	-- upvalues: Number (copy), Tbl1 (ref), Tbl (ref), tokenize_ptn (copy), self (copy), t1 (ref), re_tostr (copy), I (ref)
	local Formatted = Number and string.format("%s|%s", p21.s, Joined)
	local Entry = Number and Tbl1[table.find(Tbl, Formatted)]
	local Unpacked3 = nil
	local Unpacked = nil
	local Unpacked2 = nil
	
	if Entry then
		Unpacked, Unpacked2, Unpacked3 = table.unpack(Entry, 1, 3)
	else
		Unpacked, Unpacked2, Unpacked3 = tokenize_ptn(p21, Flags)
		
		if type(Unpacked) == "string" then
			error(Unpacked, 2)
		end
		if Number and Unpacked[1] then
			table.insert(Tbl, 1, Formatted)
			table.insert(Tbl1, 1, { Unpacked, Unpacked2, Unpacked3 })
			
			if Number ~= 1e999 then
				table.remove(Tbl, Number + 1)
				table.remove(Tbl1, Number + 1)
			end
		end
	end
	local Proxy = newproxy(true)
	self[Proxy] = {
		name = "RegEx",
		flags = Flags,
		flag_repr = Joined,
		pattern_repr = Pattern_repr,
		token = Unpacked,
		group_id = Unpacked2,
		verb_flags = Unpacked3
	}
	local Meta = getmetatable(Proxy)
	Meta.__index = setmetatable(Flags, t1)
	Meta.__tostring = re_tostr
	Meta.__metatable = I
	
	return Proxy
end

local function escape_fslash(Text): string --[[ Line: 1953 ]]
	return (if #Text % 2 == 0 then "\\" else "") .. Text .. "."
end

local function sort_flag_chr(A: string, B: string): boolean --[[ Line: 1957 ]]
	return A:lower() < B:lower()
end

function t.new(...) --[[ Line: 1961 ]]
	-- upvalues: config (copy), sort_flag_chr (copy), new_re (copy), to_str_arr (copy), escape_fslash (copy)
	if select("#", ...) == 0 then
		error("missing argument #1 (string expected)", 2)
	end
	local Text, v33 = ...
	
	if type(Text) == "number" then
		Text ..= ""
	elseif type(Text) ~= "string" then
		error(string.format("invalid argument #1 (string expected, got %s)", (typeof(Text))), 2)
	end
	if type(v33) ~= "string" and type(v33) ~= "number" and v33 ~= nil then
		error(string.format("invalid argument #2 (string expected, got %s)", (typeof(v33))), 2)
	end
	local config1 = {
		anchored = false,
		caseless = false,
		multiline = false,
		dotall = false,
		unicode = false,
		ungreedy = false,
		extended = false
	}
	local List = {}
	
	for i in string.gmatch(v33 or "", utf8.charpattern) do
		if config1[config[i]] ~= false then
			error("invalid regular expression flag " .. i, 3)
		end
		config1[config[i]] = true
		table.insert(List, i)
	end
	table.sort(List, sort_flag_chr)
	
	return (new_re(to_str_arr(Text), config1, table.concat(List), string.format("/%s/", Text:gsub("(\\*)/", escape_fslash))))
end

function t.fromstring(...) --[[ Line: 1991 ]]
	-- upvalues: to_str_arr (copy), config (copy), sort_flag_chr (copy), new_re (copy)
	if select("#", ...) == 0 then
		error("missing argument #1 (string expected)", 2)
	end
	local Text = (...)
	
	if type(Text) == "number" then
		Text ..= ""
	elseif type(Text) ~= "string" then
		error(string.format("invalid argument #1 (string expected, got %s)", typeof(Text), 2))
	end
	local Str_arr = to_str_arr(Text)
	local Codepoint: number = Str_arr[1]
	
	if Codepoint then
		if Codepoint == 92 or Codepoint >= 48 and Codepoint <= 57 or Codepoint >= 65 and Codepoint <= 90 or Codepoint >= 97 and Codepoint <= 122 then
			error("delimiter must not be alphanumeric or a backslash", 2)
		end
	else
		error("empty regex", 2)
	end
	local FoundIndex: number? = 1
	repeat
		FoundIndex = table.find(Str_arr, Codepoint, FoundIndex + 1)
		if not FoundIndex then
			error(string.format("no ending delimiter ('%s') found", utf8.char(Codepoint)), 2)
		end
		local Count = 1
		while Str_arr[FoundIndex - Count] == 92 do
			Count += 1
		end
	until Count % 2 == 1
	local config1 = {
		anchored = false,
		caseless = false,
		multiline = false,
		dotall = false,
		unicode = false,
		ungreedy = false,
		extended = false
	}
	local List = {}
	while FoundIndex < Str_arr.n do
		local Character = utf8.char(table.remove(Str_arr))
		Str_arr.n -= 1
		
		if config1[config[Character]] ~= false then
			error("invalid regular expression flag " .. Character, 3)
		end
		config1[config[Character]] = true
		table.insert(List, Character)
	end
	table.sort(List, sort_flag_chr)
	local Joined = table.concat(List)
	table.remove(Str_arr, 1)
	table.remove(Str_arr)
	Str_arr.n -= 2
	Str_arr.s = string.sub(Str_arr.s, 2, 1 + Str_arr.n)
	
	return (new_re(Str_arr, config1, Joined, (string.sub(Text, 1, 2 + Str_arr.n))))
end

local config7 = {
	["\0"] = "\\x00",
	["\n"] = "\\n",
	["\t"] = "\\t",
	["\r"] = "\\r",
	["\f"] = "\\f"
}

function t.escape(...) --[[ Line: 2047 ]]
	-- upvalues: config7 (copy)
	if select("#", ...) == 0 then
		error("missing argument #1 (string expected)", 2)
	end
	local Text1, v34, Text = ...
	
	if type(Text1) == "number" then
		Text1 ..= ""
	elseif type(Text1) ~= "string" then
		error(string.format("invalid argument #1 to 'escape' (string expected, got %s)", (typeof(Text1))), 2)
	end
	if Text == nil then
		Text = ""
	elseif type(Text) == "number" then
		Text ..= ""
	elseif type(Text) ~= "string" then
		error(string.format("invalid argument #3 to 'escape' (string expected, got %s)", (typeof(Text))), 2)
	end
	if utf8.len(Text) > 1 or Text:match("^[%a\\]$") then
		error("delimiter have not be alphanumeric", 2)
	end
	return (string.gsub(Text1, "[\0\f\n\r\t]", config7):gsub(string.format("[\\%s#()%%%%*+.?[%%]^{|%s]", if v34 then "%s" else "", (if Text:find("^[%%%]]$") then "%" else "") .. Text), "\\%1"))
end

function t.type(...) --[[ Line: 2070 ]]
	-- upvalues: self (copy)
	if select("#", ...) == 0 then
		error("missing argument #1", 2)
	end
	return self[(...)] and self[(...)].name
end

for i, value in pairs(t1) do
	t[i] = value
end
t1 = { __index = t1 }
I = t.fromstring("/The\\s*metatable\\s*is\\s*(?:locked|inaccessible)(?#Nice try :])/i")
getmetatable(I).__metatable = I

local function readonly_table() --[[ Line: 2086 ]]
	error("Attempt to modify a readonly table", 2)
end

t2 = {
	__index = t2,
	__metatable = I,
	__newindex = readonly_table
}
t.Match = setmetatable({}, t2)

return (setmetatable({}, {
	__index = t,
	__metatable = I,
	__newindex = readonly_table
}))