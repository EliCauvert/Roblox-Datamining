local _ = { cacheSize = 256, unicodeData = false }
local tbl = setmetatable({}, { __mode = "k" })
local t = {}
local t_1 = {}
local t_2 = {}
local var4 = nil

local function to_str_arr(p0, p1) --[[ line: 54 ]]
	if p1 then
		p0 = string.sub(p0, utf8.offset(p0, p1))
	end
	local charCount = utf8.len(p0)
	
	if charCount <= 1999 then
		return { n = charCount, s = p0, utf8.codepoint(p0, 1, #p0) }
	end
	local ceiled = math.ceil(charCount / 1999)
	local list = table.create(charCount)
	local var58 = 1
	
	for i = 1, ceiled do
		local packed = table.pack(utf8.codepoint(p0, utf8.offset(p0, i * 1999 - 1998), utf8.offset(p0, i * 1999 - (if i == ceiled then 1998 - ((charCount - 1) % 1999 + 1) else -1)) - 1))
		table.move(packed, 1, packed.n, var58, list)
		var58 += packed.n
	end
	list.s = p0
	list.n = charCount
	
	return list
end

local function from_str_arr(p2) --[[ line: 74 ]]
	local n = p2.n or #p2
	
	if n <= 7997 then
		return utf8.char(table.unpack(p2))
	end
	local ceiled = math.ceil(n / 7997)
	local list = table.create(ceiled)
	
	for i = 1, ceiled do
		list[i] = utf8.char(table.unpack(p2, i * 7997 - 7996, i * 7997 - (if i == ceiled then 7997 - ((n - 1) % 7997 + 1) else 0)))
	end
	return table.concat(list)
end

local function _(p3, p4, p5) --[[ line: 87 | named "utf8_sub" ]]
	local byteOffset = utf8.offset(p3, p5)
	
	return string.sub(p3, utf8.offset(p3, p4), byteOffset and byteOffset - 1)
end

local t_3 = {
	a = "anchored",
	i = "caseless",
	m = "multiline",
	s = "dotall",
	u = "unicode",
	U = "ungreedy",
	x = "extended"
}
local t_4 = {
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
local t_5 = {
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
local t_6 = {
	[98] = { 98, { "class", "word", false } },
	[66] = { 66, { "class", "word", false } },
	[75] = { 75 },
	[71] = { 71 },
	[74] = { 74 },
	[90] = { 90 },
	[122] = { 122 }
}
local _ = {
	C = true,
	Cc = true,
	Cf = true,
	Cn = true,
	Co = true,
	Cs = true,
	L = true,
	Ll = true,
	Lm = true,
	Lo = true,
	Lt = true,
	Lu = true,
	M = true,
	Mc = true,
	Me = true,
	Mn = true,
	N = true,
	Nd = true,
	Nl = true,
	No = true,
	P = true,
	Pc = true,
	Pd = true,
	Pe = true,
	Pf = true,
	Pi = true,
	Po = true,
	Ps = true,
	S = true,
	Sc = true,
	Sk = true,
	Sm = true,
	So = true,
	Z = true,
	Zl = true,
	Zp = true,
	Zs = true,
	Xan = true,
	Xps = true,
	Xsp = true,
	Xuc = true,
	Xwd = true
}
local t_7 = {
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
local list_1 = { 46 }
local list_2 = { 94 }
local list_3 = { 124 }

local _ = function(p6, p7, p8) --[[ line: 150 | named "check_re" ]]
	-- upvalues: tbl (ref), t (ref)
	return if p6 == "Match" then function(...) --[[ line: 152 ]]
		-- upvalues: tbl (copy), p7 (ref), p8 (ref)
		if select("#", ...) < 1 then
			error("missing argument #1 (Match expected)", 2)
		end
		local var72, var73 = ...
		
		if tbl[var72] and tbl[var72].name == "Match" then
			var72 = tbl[var72]
		else
			error(string.format("invalid argument #1 to %q (Match expected, got %s)", p7, typeof(var72)), 2)
		end
		if (p7 == "group" or p7 == "span") and var73 == nil then
			var73 = 0
		end
		return p8(var72, var73)
	end else function(...) --[[ line: 171 ]]
		-- upvalues: tbl (copy), p7 (ref), t (copy), p8 (ref)
		local var64 = select("#", ...)
		
		if var64 < 1 then
			error("missing argument #1 (RegEx expected)", 2)
		elseif var64 < 2 then
			error("missing argument #2 (string expected)", 2)
		end
		local var65, var66, var67, var68, var69, var70 = ...
		
		if not tbl[var65] or tbl[var65].name ~= "RegEx" then
			if type(var65) ~= "string" and type(var65) ~= "number" then
				error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", p7, typeof(var65)), 2)
			end
			var65 = t.fromstring(var65)
		elseif p7 == "sub" then
			if type(var67) == "number" then
				var67 ..= ""
			elseif type(var67) ~= "string" then
				error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var67)), 2)
			end
		elseif type(var66) == "number" then
			var66 ..= ""
		elseif type(var66) ~= "string" then
			error(string.format("invalid argument #2 to %q (string expected, got %s)", p7, typeof(var66)), 2)
		end
		if p7 ~= "sub" and p7 ~= "split" then
			local var71 = typeof(var67)
			
			if var71 ~= "nil" then
				var67 = tonumber(var67)
				
				if var67 then
					var67 = if var67 < 0 then #var66 + math.floor(var67 + 0.5) + 1 else math.max(math.floor(var67 + 0.5), 1)
				else
					error(string.format("invalid argument #3 to %q (number expected, got %s)", p7, var71), 2)
				end
			end
		end
		var65 = tbl[var65]
		
		if p7 == "match" or p7 == "matchiter" then
			var68 = ...
		elseif p7 == "sub" then
			var70 = ...
		end
		return p8(var65, var66, var67, var68, var69, var70)
	end
end

local function match_tostr(p9) --[[ line: 219 ]]
	-- upvalues: tbl (ref)
	local spans = tbl[p9].spans
	local var74 = spans[0][1]
	local var75 = spans[0][2]
	
	if var75 <= var74 then
		return string.format("Match (%d..%d, empty)", var74, var75 - 1)
	end
	local format = string.format
	local var76 = "Match (%d..%d): %s"
	local var77 = var75 - 1
	local input = spans.input
	local byteOffset = utf8.offset(input, var75)
	
	return format(var76, var74, var77, string.sub(input, utf8.offset(input, var74), byteOffset and byteOffset - 1))
end

local function new_match(p10, p11, p12, p13) --[[ line: 228 ]]
	-- upvalues: var4 (write), t_2 (write), match_tostr (ref), tbl (ref)
	p10.source = p12
	p10.input = p13
	local var79 = newproxy(true)
	local var80 = getmetatable(var79)
	var80.__metatable = var4
	var80.__index = setmetatable(p10, t_2)
	var80.__tostring = match_tostr
	tbl[var79] = { name = "Match", spans = p10, group_id = p11 }
	
	return var79
end

local var18 = function(p14, p15) --[[ line: 240 ]]
	local var81 = p14.spans[if type(p15) == "number" then p15 else p14.group_id[p15]]
	
	if var81 then
		local input = p14.spans.input
		local byteOffset = utf8.offset(input, var81[2])
		
		return string.sub(input, utf8.offset(input, var81[1]), byteOffset and byteOffset - 1)
	end
	return nil
end

local var19 = "group"

function t_2.group(...) --[[ line: 152 ]]
	-- upvalues: tbl (ref), var19 (ref), var18 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var72, var73 = ...
	
	if tbl[var72] and tbl[var72].name == "Match" then
		var72 = tbl[var72]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var19, typeof(var72)), 2)
	end
	if (var19 == "group" or var19 == "span") and var73 == nil then
		var73 = 0
	end
	return var18(var72, var73)
end

local var20 = function(p16, p17) --[[ line: 248 ]]
	local var83 = p16.spans[if type(p17) == "number" then p17 else p16.group_id[p17]]
	
	if var83 then
		return var83[1], var83[2] - 1
	end
	return nil
end

local var21 = "span"

function t_2.span(...) --[[ line: 152 ]]
	-- upvalues: tbl (ref), var21 (ref), var20 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var72, var73 = ...
	
	if tbl[var72] and tbl[var72].name == "Match" then
		var72 = tbl[var72]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var21, typeof(var72)), 2)
	end
	if (var21 == "group" or var21 == "span") and var73 == nil then
		var73 = 0
	end
	return var20(var72, var73)
end

local var22 = function(p18) --[[ line: 256 ]]
	local spans = p18.spans
	
	if spans.n <= 0 then
		local input = spans.input
		local byteOffset = utf8.offset(input, spans[0][2])
		
		return string.sub(input, utf8.offset(input, spans[0][1]), byteOffset and byteOffset - 1)
	end
	local list = table.create(spans.n)
	
	for i = 0, spans.n do
		local var85 = spans[i]
		
		if var85 then
			local input = spans.input
			local byteOffset = utf8.offset(input, var85[2])
			list[i] = string.sub(input, utf8.offset(input, var85[1]), byteOffset and byteOffset - 1)
		end
	end
	return table.unpack(list, 1, spans.n)
end

local var23 = "groups"

function t_2.groups(...) --[[ line: 152 ]]
	-- upvalues: tbl (ref), var23 (ref), var22 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var72, var73 = ...
	
	if tbl[var72] and tbl[var72].name == "Match" then
		var72 = tbl[var72]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var23, typeof(var72)), 2)
	end
	if (var23 == "group" or var23 == "span") and var73 == nil then
		var73 = 0
	end
	return var22(var72, var73)
end

local var24 = function(p19) --[[ line: 271 ]]
	local spans = p19.spans
	local t = {}
	
	for i, v in pairs(p19.group_id) do
		v = spans[v]
		
		if v then
			local input = spans.input
			local byteOffset = utf8.offset(input, v[2])
			t[i] = string.sub(input, utf8.offset(input, v[1]), byteOffset and byteOffset - 1)
		end
	end
	return t
end

local var25 = "groupdict"

function t_2.groupdict(...) --[[ line: 152 ]]
	-- upvalues: tbl (ref), var25 (ref), var24 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var72, var73 = ...
	
	if tbl[var72] and tbl[var72].name == "Match" then
		var72 = tbl[var72]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var25, typeof(var72)), 2)
	end
	if (var25 == "group" or var25 == "span") and var73 == nil then
		var73 = 0
	end
	return var24(var72, var73)
end

local var26 = function(p20) --[[ line: 283 ]]
	local spans = p20.spans
	local list = table.create(spans.n)
	
	for i = 0, spans.n do
		local var91 = spans[i]
		
		if var91 then
			local input = spans.input
			local byteOffset = utf8.offset(input, var91[2])
			list[i] = string.sub(input, utf8.offset(input, var91[1]), byteOffset and byteOffset - 1)
		end
	end
	list.n = spans.n
	
	return list
end

local var27 = "groupdict"

function t_2.grouparr(...) --[[ line: 152 ]]
	-- upvalues: tbl (ref), var27 (ref), var26 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var72, var73 = ...
	
	if tbl[var72] and tbl[var72].name == "Match" then
		var72 = tbl[var72]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var27, typeof(var72)), 2)
	end
	if (var27 == "group" or var27 == "span") and var73 == nil then
		var73 = 0
	end
	return var26(var72, var73)
end

local t_8 = {
	CR = 0,
	LF = 1,
	CRLF = 2,
	ANYRLF = 3,
	ANY = 4,
	NUL = 5
}

local function is_newline(p21, p22, p23) --[[ line: 300 ]]
	local newline = p23.newline
	local var93 = p21[p22]
	
	return if newline == 0 then var93 == 13 elseif newline == 2 then var93 == 10 and p21[p22 - 1] == 32 elseif newline == 3 then if var93 ~= 10 then var93 == 13 else true elseif newline == 4 then if var93 ~= 10 then if var93 ~= 11 then if var93 ~= 12 then if var93 ~= 13 then if var93 ~= 133 then if var93 ~= 8232 then var93 == 8233 else true else true else true else true else true else true elseif newline == 5 then var93 == 0 else var93 == 10
end

local function tkn_char_match(p24, p25, p26, p27, p28) --[[ line: 324 ]]
	-- upvalues: tkn_char_match (ref), t_7 (ref), is_newline (ref)
	local v
	local var94 = p25[p26]
	
	if not var94 then
		return false
	elseif p27.ignoreCase and var94 >= 97 and var94 <= 122 then
		var94 -= 32
	end
	if type(p24) == "number" then
		return p24 == var94
	elseif p24[1] == "charset" then
		for i, v in ipairs(p24[3]) do
			if tkn_char_match(v, p25, p26, p27, p28) then
				return not p24[2]
			end
		end
		return p24[2]
	elseif p24[1] == "range" then
		return p24[2] <= var94 or p27.ignoreCase and (var94 >= 65 and (var94 <= 90 and (p24[2] <= var94 + 32 and var94 + 32 <= p24[3])))
	elseif p24[1] == "class" then
		local var95 = p24[2]
		local var96 = p24[3]
		local var97 = false
		
		if var95 == "xdigit" then
			var97 = var94 >= 48 or (var94 >= 65 or (var94 >= 97 and var94 <= 102))
		elseif var95 == "ascii" then
			local _ = var94 <= 127
		elseif var95 == "vertical_tab" then
			local var98
			if var94 >= 10 then
				var98 = true
				
				if var94 > 13 then
					var98 = if var94 ~= 8232 then var94 == 8233 else true
				end
				var97 = var98
			end
		elseif p27.unicode then
			local var99 = (false)[var94] or "Cn"
			v = var99:sub(1, 1)
			
			if var95 == "alnum" then
				var97 = if v ~= "L" then if var99 ~= "Nl" then var99 == "Nd" else true else true
			elseif var95 == "alpha" then
				var97 = if v ~= "L" then var99 == "Nl" else true
			elseif var95 == "blank" then
				var97 = if var99 ~= "Zs" then var94 == 9 else true
			elseif var95 == "cntrl" then
				local _ = var99 == "Cc"
			elseif var95 == "digit" then
				local _ = var99 == "Nd"
			elseif var95 == "graph" then
				var97 = v ~= "P" and v ~= "C"
			elseif var95 == "lower" then
				local _ = var99 == "Ll"
			elseif var95 == "print" then
				local _ = v ~= "C"
			elseif var95 == "punct" then
				local _ = v == "P"
			elseif var95 == "space" then
				var97 = if v ~= "Z" then var94 >= 9 and var94 <= 13 else true
			elseif var95 == "upper" then
				local _ = var99 == "Lu"
			elseif var95 == "word" then
				var97 = if v ~= "L" then if var99 ~= "Nl" then if var99 ~= "Nd" then var99 == "Pc" else true else true else true
			end
		elseif var95 == "alnum" then
			var97 = var94 >= 48 or (var94 >= 65 or (var94 >= 97 and var94 <= 122))
		elseif var95 == "alpha" then
			var97 = var94 >= 65 or (var94 >= 97 and var94 <= 122)
		elseif var95 == "blank" then
			var97 = if var94 ~= 9 then var94 == 32 else true
		elseif var95 == "cntrl" then
			var97 = if var94 > 31 then var94 == 127 else true
		elseif var95 == "digit" then
			var97 = var94 >= 48 and var94 <= 57
		elseif var95 == "graph" then
			var97 = var94 >= 33 and var94 <= 126
		elseif var95 == "lower" then
			var97 = var94 >= 97 and var94 <= 122
		elseif var95 == "print" then
			var97 = var94 >= 32 and var94 <= 126
		elseif var95 == "punct" then
			var97 = t_7[var94]
		elseif var95 == "space" then
			var97 = var94 >= 9 or var94 == 32
		elseif var95 == "upper" then
			var97 = var94 >= 65 and var94 <= 90
		elseif var95 == "word" then
			var97 = var94 >= 48 or (var94 >= 65 or (var94 >= 97 or var94 == 95))
		end
		return if var96 then not var97 else var97
	elseif p24[1] == "category" then
		local var100 = (false)[var94] or "Cn"
		local var101 = p24[3]
		local var101Count = #var101
		
		if var101Count == 3 then
			local var103 = false
			
			if var101 == "Xan" or var101 == "Xwd" then
				v = var100:find("^[LN]") or (var101 == "Xwd" and var94 == 95)
				var103 = v
			elseif var101 == "Xps" or var101 == "Xsp" then
				v = if var100:sub(1, 1) ~= "Z" then var94 >= 9 and var94 <= 13 else true
				var103 = v
			elseif var101 == "Xuc" then
				var103 = tkn_char_match(false, p25, p26, p27, p28)
			end
			return if p24[2] then not var103 else var103
		else
			return if var100:sub(1, var101Count) == var101 then not p24[2] else p24[2]
		end
	else
		return if p24[1] == 46 then p27.dotAll or not is_newline(p25, p26, p28) elseif p24[1] == 78 then not is_newline(p25, p26, p28) else p24[1] == 82 and (if p28.newline_seq == 0 then if var94 ~= 10 then var94 == 13 else true elseif var94 ~= 10 then if var94 ~= 11 then if var94 ~= 12 then if var94 ~= 13 then if var94 ~= 133 then if var94 ~= 8232 then var94 == 8233 else true else true else true else true else true else true)
	end
end

local function find_alternation(p29, p30, p31) --[[ line: 449 ]]
	-- upvalues: list_3 (ref)
	while true do
		local var104 = p29[p30]
		local isTable = type(var104) == "table"
		if var104 ~= list_3 then
			if isTable and var104[1] == 40 then
				if p31 then
					p31 += var104.count
				end
				p30 = var104[3]
				p30 += 1
			end
			if isTable and var104[1] == "quantifier" and (type(var104[5]) == "table" and var104[5][1] == 40) then
				if p31 then
					p31 += var104[5].count
				end
				p30 = var104[5][3]
			elseif var104 and (not isTable or var104[1] ~= 41) then
				if p31 then
					p31 = if isTable and var104[1] == "quantifier" then p31 + var104[3] else p31 + 1
				end
			end
			return nil, p31
		end
		return p30, p31
	end
end

local function re_rawfind(p32, p33, p34, p35, p36, p37) --[[ line: 478 ]]
	-- upvalues: find_alternation (ref), tkn_char_match (ref), is_newline (ref)
	local var110, var111, var112, var113, isTable, var115, v, i, substring, v_1
	local var106 = 0
	local var107 = p34
	local var108 = p34
	local t = {}
	while var106 do
		if var106 == 0 then
			var106 += 1
			var110 = find_alternation(p32, var106)
			
			if var110 then
				table.insert(t, 1, { "alternation", var110, var107 })
			end
		else
			var110 = p32[var106]
			var111 = type(var110) == "table" and var110[1]
			
			if not var110 then break end
			if var110 == "ACCEPT" then
				var112 = true
				var113 = var106
				repeat
					var113 += 1
					isTable = type(p32[var113]) == "table"
					var115 = p32[var113]
					if isTable and (var115[1] == 40 or var115[1] == "quantifier" and type(var115[5]) == "table" and var115[5][1] == 40) then
						var113 = if var115[1] == "quantifier" then var115[5][3] else var115[3]
					elseif isTable and var115[1] == 41 and (var115[4] == 33 or var115[4] == 61) then
						var112 = false
						var106 = var113
						break
					elseif var112 then break end
				until not var115
			elseif var110 == "PRUNE" or var110 == "SKIP" then
				table.insert(t, 1, { var110, var107 })
				var106 += 1
			elseif var111 == 40 then
				table.insert(t, 1, {
					"group", var106, var107, nil, var110[2], var110[3], var110[4]
				})
				var106 += 1
				isTable = var106
				
				if var110[4] ~= 33 then
					var115 = var110[4] == 61 and (var110[5] and 0)
				end
				var112, var113 = find_alternation(p32, isTable, var115)
				
				if var112 then
					table.insert(t, 1, { "alternation", var112, var107 })
				end
				if var113 then
					var107 -= var113
				end
			elseif var111 == 41 and var110[4] ~= 33 then
				if var110[4] == 33 or var110[4] == 61 then
					while true do
						var112 = nil
						var113 = table.remove(t, 1)
						if var113[1] ~= "group" or var113[2] ~= var110[3] then
							if var113[1] == "matchStart" and var110[4] == 61 then
								var112 = var113
							end
						end
						if var110[4] ~= 33 and var110[4] ~= 61 or var110[5] then break end
						var107 = var113[3]
						break
					end
				elseif var110[4] == 62 then
					repeat
						var112 = table.remove(t, 1)
					until not (var112 and (var112[1] ~= "group" or var112[2] ~= var110[3]))
				else
					for var115, i in ipairs(t) do
						if i[1] == "group" and i[2] == var110[3] then
							if i.jmp then
								var106 = i.jmp
							end
							i[4] = var107
							
							if i[7] ~= "quantifier" or i[10] + 1 >= i[9] then break end
							if p32[var110[3]][4] ~= "lazy" or i[10] + 1 < i[8] then
								var106 = var110[3]
							end
							v = p32[var110[3]]
							table.insert(t, 1, {
								"group", i[2], var107, nil, v[5][2], v[5][3], "quantifier", v[2], v[3],
								i[10] + 1, i[11], v[4]
							})
							
							if not i[11] then break end
							table.insert(t, 1, { "alternation", i[11], var107 })
							break
						end
					end
				end
				var106 += 1
				continue
			elseif var111 == 75 then
				table.insert(t, 1, { "matchStart", var107 })
				var106 += 1
			elseif var111 == 124 then
				var112 = var106
				repeat
					var112 += 1
					var113 = type(p32[var112]) == "table"
					isTable = p32[var112]
					if var113 and (isTable[1] == 40 or isTable[1] == "quantifier" and type(isTable[5]) == "table" and isTable[5][1] == 40) then
						var112 = if isTable[1] == "quantifier" then isTable[5][3] else isTable[3]
					end
				until not (var113 and isTable[1] == 41 or not isTable)
				if p32[var112] then
					for i, v in ipairs(t) do
						if v[1] == "group" and v[6] == var112 then
							var106 = v[6]
							continue
						end
					end
				else
					var106 = var112
				end
			elseif var111 == "recurmatch" then
				table.insert(t, 1, {
					"group",
					var110[3],
					var107,
					nil,
					nil,
					p32[var110[3]][3],
					nil,
					jmp = var106
				})
				var106 = var110[3] + 1
				var112, var113 = find_alternation(p32, var106)
				
				if var112 then
					table.insert(t, 1, { "alternation", var112, var107 })
				end
			else
				local var117, i_1
				var112 = nil
				
				if var110 == "FAIL" then
					var112 = false
				elseif var111 == 41 then
					repeat
						var113 = table.remove(t, 1)
					until not (var113[1] == "group" and var113[2] == var110[3])
				elseif var111 == "quantifier" then
					if type(var110[5]) == "table" and var110[5][1] == 40 then
						var113 = find_alternation(p32, var106 + 1)
						
						if var113 then
							table.insert(t, 1, { "alternation", var113, var107 })
						end
						table.insert(t, if var113 then 2 else 1, {
							"group", var106, var107, nil, var110[5][2], var110[5][3], "quantifier",
							var110[2], var110[3], 0, var113, var110[4]
						})
						
						if var110[4] == "lazy" and var110[2] == 0 then
							var106 = var110[5][3]
						end
						var112 = true
					else
						var113 = nil
						isTable = nil
						var115 = 1
						i = type(var110[5]) == "table" and var110[5][1] == "backref"
						
						if i then
							var115 = 0
							v = var110[5][2]
							
							for i_1, v_1 in ipairs(t) do
								if v_1[1] == "group" and v_1[5] == v then
									var113 = v_1[3]
									isTable = v_1[4]
									var115 = isTable - var113
									break
								end
							end
						end
						v = var107 + var110[2] * var115
						local var116 = 0
						while var116 < var110[3] do
							if i then
								if not var113 or not isTable then break end
								var117 = var107
								i_1 = p33.s
								local byteOffset = utf8.offset(i_1, isTable)
								substring = string.sub(i_1, utf8.offset(i_1, var113), byteOffset and byteOffset - 1)
								v_1 = p33.s
								local byteOffset_1 = utf8.offset(v_1, var107 + var115)
								
								if substring ~= string.sub(v_1, utf8.offset(v_1, var117), byteOffset_1 and byteOffset_1 - 1) then break end
								var107 += var115
								var116 += 1
							elseif tkn_char_match(var110[5], p33, var107, p35, p36) then
								continue
							else
								break
							end
						end
						var112 = var110[2] <= var116
						
						if var112 and var110[4] ~= "possessive" then
							if var110[4] == "lazy" then
								var117 = var107
								var107 = v
								v = var117
							end
							table.insert(t, 1, {
								"quantifier",
								var106,
								var107,
								math.min(v, p33.n + 1),
								(if var110[4] == "lazy" then 1 else -1) * var115
							})
						end
					end
				elseif var111 == "backref" then
					var113 = nil
					isTable = nil
					var115 = var110[2]
					
					for var117, substring in ipairs(t) do
						if substring[1] == "group" and substring[5] == var115 then
							var113 = substring[3]
							isTable = substring[4]
							break
						end
					end
					if var113 and isTable then
						i = var107
						var107 += isTable - var113
						local s = p33.s
						i_1 = utf8.offset(s, isTable)
						v = string.sub(s, utf8.offset(s, var113), i_1 and i_1 - 1)
						var117 = p33.s
						substring = utf8.offset(var117, var107)
						var112 = v == string.sub(var117, utf8.offset(var117, i), substring and substring - 1)
						var112 = nil
					end
				else
					var113 = p33[var107]
					
					if var111 == 36 or var111 == 90 or var111 == 122 then
						isTable = true
						
						if var107 ~= p33.n + 1 then
							if var111 == 36 and p35.multiline then
								isTable = is_newline(p33, var107 + 1, p36)
								
								if not isTable then
									isTable = var111 == 90 and (var107 == p33.n and is_newline(p33, var107, p36))
								end
							end
						end
						var112 = isTable
					elseif var111 == 94 or var111 == 65 or var111 == 71 then
						isTable = true
						
						if var107 ~= 1 then
							if var111 == 94 and p35.multiline then
								isTable = is_newline(p33, var107 - 1, p36)
								
								if not isTable then
									isTable = var111 == 71 and var107 == p34
								end
							end
						end
						var112 = isTable
					elseif var111 == 66 or var111 == 98 then
						isTable = if var107 ~= 1 then p35.multiline and is_newline(p33, var107 - 1, p36) else true
						var115 = if var107 ~= p33.n + 1 then p35.multiline and is_newline(p33, var107, p36) else true
						i = if tkn_char_match(var110[2], p33[var107 - 1], p35) then 0 else tkn_char_match(var110[2], var113, p35) and 1
						
						if i == 0 then
							v = var115 or not tkn_char_match(var110[2], var113, p35)
							var112 = v
						elseif i then
							v = isTable or not tkn_char_match(var110[2], p33[var107 - 1], p35)
							var112 = v
						end
						if var111 == 66 then
							var112 = not var112
						end
					else
						var112 = tkn_char_match(var110, p33, var107, p35, p36)
						var107 += 1
					end
				end
				if not var112 then
					while true do
						var113 = t[1] and t[1][1]
						isTable = t[1]
						if var113 and var113 ~= "PRUNE" and var113 ~= "SKIP" then
							if var113 ~= "alternation" then
								if var113 ~= "group" then
									if var113 ~= "quantifier" or math.sign(isTable[4] - isTable[3]) ~= math.sign(isTable[5]) then
										table.remove(t, 1)
										continue
									end
									isTable[3] += isTable[5]
									var106 = isTable[2]
									var107 = isTable[3]
									break
								elseif isTable[7] ~= "quantifier" then
									if isTable[7] ~= 33 then
										continue
									end
									table.remove(t, 1)
									var106 = isTable[6]
									var107 = isTable[3]
									break
								elseif isTable[12] == "greedy" and isTable[8] <= isTable[10] or isTable[12] == "lazy" and isTable[10] < isTable[9] and not isTable[13] then
									var106 = if isTable[12] == "greedy" then isTable[6] else isTable[2]
									var107 = isTable[3]
									
									if isTable[12] == "greedy" then
										table.remove(t, 1)
										break
									elseif isTable[8] > isTable[10] then
										continue
									else
										isTable[13] = true
										break
									end
								end
							end
							var106 = isTable[2]
							var107 = isTable[3]
							var115, i = find_alternation(p32, var106 + 1)
							
							if var115 then
								isTable[2] = var115
							else
								table.remove(t, 1)
							end
							if not i then break end
							var107 -= i
							break
						end
						if var113 then
							table.clear(t)
						end
						if p33.n >= var108 then
							var108 = if var113 == "SKIP" then isTable[2] else var108 + 1
							var106 = 0
							var107 = var108
							break
						end
						return if p37 then false else nil
					end
				end
				var106 += 1
			end
		end
	end
	if p37 then
		return true
	end
	var110 = false
	var111 = table.create(p32.group_n)
	isTable = p32.group_n
	var111[0] = { var108, var107 }
	var111.n = isTable
	
	for var115, i in ipairs(t) do
		if i[1] == "matchStart" and not var110 then
			var110 = true
			var111[0][1] = i[2]
		elseif i[1] == "group" and i[5] and not var111[i[5]] then
			var111[i[5]] = { i[3], i[4] }
		end
	end
	return var111
end

local var33 = function(p38, p39, p40) --[[ line: 775 ]]
	-- upvalues: re_rawfind (ref), to_str_arr (ref)
	return re_rawfind(p38.token, to_str_arr(p39, p40), 1, p38.flags, p38.verb_flags, true)
end

local var34 = "test"

function t_1.test(...) --[[ line: 171 ]]
	-- upvalues: tbl (ref), var34 (ref), t (ref), var33 (ref)
	local var64 = select("#", ...)
	
	if var64 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var64 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var65, var66, var67, var68, var69, var70 = ...
	
	if not tbl[var65] or tbl[var65].name ~= "RegEx" then
		if type(var65) ~= "string" and type(var65) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var34, typeof(var65)), 2)
		end
		var65 = t.fromstring(var65)
	elseif var34 == "sub" then
		if type(var67) == "number" then
			var67 ..= ""
		elseif type(var67) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var67)), 2)
		end
	elseif type(var66) == "number" then
		var66 ..= ""
	elseif type(var66) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var34, typeof(var66)), 2)
	end
	if var34 ~= "sub" and var34 ~= "split" then
		local var71 = typeof(var67)
		
		if var71 ~= "nil" then
			var67 = tonumber(var67)
			
			if var67 then
				var67 = if var67 < 0 then #var66 + math.floor(var67 + 0.5) + 1 else math.max(math.floor(var67 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var34, var71), 2)
			end
		end
	end
	var65 = tbl[var65]
	
	if var34 == "match" or var34 == "matchiter" then
		var68 = ...
	elseif var34 == "sub" then
		var70 = ...
	end
	return var33(var65, var66, var67, var68, var69, var70)
end

local var35 = function(p41, p42, p43, p44) --[[ line: 779 ]]
	-- upvalues: re_rawfind (ref), to_str_arr (ref), new_match (ref)
	local var121 = re_rawfind(p41.token, to_str_arr(p42, p43), 1, p41.flags, p41.verb_flags, false)
	
	return if var121 then new_match(var121, p41.group_id, p44, p42) else nil
end

local var36 = "match"

function t_1.match(...) --[[ line: 171 ]]
	-- upvalues: tbl (ref), var36 (ref), t (ref), var35 (ref)
	local var64 = select("#", ...)
	
	if var64 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var64 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var65, var66, var67, var68, var69, var70 = ...
	
	if not tbl[var65] or tbl[var65].name ~= "RegEx" then
		if type(var65) ~= "string" and type(var65) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var36, typeof(var65)), 2)
		end
		var65 = t.fromstring(var65)
	elseif var36 == "sub" then
		if type(var67) == "number" then
			var67 ..= ""
		elseif type(var67) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var67)), 2)
		end
	elseif type(var66) == "number" then
		var66 ..= ""
	elseif type(var66) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var36, typeof(var66)), 2)
	end
	if var36 ~= "sub" and var36 ~= "split" then
		local var71 = typeof(var67)
		
		if var71 ~= "nil" then
			var67 = tonumber(var67)
			
			if var67 then
				var67 = if var67 < 0 then #var66 + math.floor(var67 + 0.5) + 1 else math.max(math.floor(var67 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var36, var71), 2)
			end
		end
	end
	var65 = tbl[var65]
	
	if var36 == "match" or var36 == "matchiter" then
		var68 = ...
	elseif var36 == "sub" then
		var70 = ...
	end
	return var35(var65, var66, var67, var68, var69, var70)
end

local var37 = function(p45, p46, p47, p48) --[[ line: 787 ]]
	-- upvalues: to_str_arr (ref), re_rawfind (ref), new_match (ref)
	p46 = to_str_arr(p46, p47)
	local var122 = 1
	
	return function() --[[ line: 790 ]]
		-- upvalues: var122 (write), p46 (write), re_rawfind (copy), p45 (ref), new_match (copy), p48 (ref)
		local var123 = var122 <= p46.n + 1 and re_rawfind(p45.token, p46, var122, p45.flags, p45.verb_flags, false)
		
		if var123 then
			var122 = var123[0][2] + (if var123[0][2] <= var123[0][1] then 1 else 0)
			
			return new_match(var123, p45.group_id, p48, p46.s)
		end
		return nil
	end
end

local var38 = "matchall"

function t_1.matchall(...) --[[ line: 171 ]]
	-- upvalues: tbl (ref), var38 (ref), t (ref), var37 (ref)
	local var64 = select("#", ...)
	
	if var64 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var64 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var65, var66, var67, var68, var69, var70 = ...
	
	if not tbl[var65] or tbl[var65].name ~= "RegEx" then
		if type(var65) ~= "string" and type(var65) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var38, typeof(var65)), 2)
		end
		var65 = t.fromstring(var65)
	elseif var38 == "sub" then
		if type(var67) == "number" then
			var67 ..= ""
		elseif type(var67) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var67)), 2)
		end
	elseif type(var66) == "number" then
		var66 ..= ""
	elseif type(var66) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var38, typeof(var66)), 2)
	end
	if var38 ~= "sub" and var38 ~= "split" then
		local var71 = typeof(var67)
		
		if var71 ~= "nil" then
			var67 = tonumber(var67)
			
			if var67 then
				var67 = if var67 < 0 then #var66 + math.floor(var67 + 0.5) + 1 else math.max(math.floor(var67 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var38, var71), 2)
			end
		end
	end
	var65 = tbl[var65]
	
	if var38 == "match" or var38 == "matchiter" then
		var68 = ...
	elseif var38 == "sub" then
		var70 = ...
	end
	return var37(var65, var66, var67, var68, var69, var70)
end

local function insert_tokenized_sub(p49, p50, p51, p52) --[[ line: 800 ]]
	-- upvalues: insert_tokenized_sub (ref)
	for i, v in ipairs(p52) do
		if type(v) == "table" then
			if v[1] ~= "condition" then
				table.move(v, 1, #v, #p49 + 1, p49)
			elseif p51[v[2]] then
				if v[3] then
					insert_tokenized_sub(p49, p50, p51, v[3])
				else
					table.move(p50, p51[v[2]][1], p51[v[2]][2] - 1, #p49 + 1, p49)
				end
			elseif v[4] then
				insert_tokenized_sub(p49, p50, p51, v[4])
			end
		elseif p51[v] then
			table.move(p50, p51[v][1], p51[v][2] - 1, #p49 + 1, p49)
		end
	end
	p49.n = #p49
	
	return p49
end

local var40 = function(p53, p54, p55, p56, p57, p58) --[[ line: 824 ]]
	-- upvalues: to_str_arr (ref), t_5 (ref), re_rawfind (ref), insert_tokenized_sub (ref), new_match (ref), from_str_arr (ref)
	if p57 ~= nil and type(p57) ~= "number" and type(p57) ~= "string" then
		error(string.format("invalid argument #5 to 'sub' (string expected, got %s)", typeof(p57)), 3)
	end
	local t = { l = false, o = false, u = false }
	
	for i in string.gmatch(p57 or "", utf8.charpattern) do
		if t[i] ~= false then
			error("invalid regular expression substitution flag " .. i, 3)
		end
		t[i] = true
	end
	local var125 = type(p54)
	
	if var125 == "number" then
		p54 ..= ""
	elseif var125 ~= "string" and var125 ~= "function" and (not t.o or var125 ~= "table") then
		error(string.format("invalid argument #2 to 'sub' (string/function%s expected, got %s)", if t.o then "/table" else "", typeof(p54)), 3)
	end
	if tonumber(p56) then
		p56 = tonumber(p56)
		
		if p56 <= -1 or p56 ~= p56 then
			p56 = 1e999
		end
	elseif p56 == nil then
		p56 = 1e999
	else
		error(string.format("invalid argument #4 to 'sub' (number expected, got %s)", typeof(p56)), 3)
	end
	if p56 < 1 then
		return p55, 0
	end
	local list, var130, var131, var132, var136
	local var126 = 0
	
	if var125 == "string" then
		p54 = to_str_arr(p54)
		
		if not t.l then
			local var127 = 0
			list = table.create(3)
			local groupN = p53.token.group_n
			local t_1 = {}
			while var127 < p54.n do
				var130 = var127
				repeat
					var130 += 1
				until not (p54[var130] and (p54[var130] ~= 36 and p54[var130] ~= 92) and (p54[var130] ~= 58 and p54[var130] ~= 125 or not t_1[1]))
				local i_1
				var126 += var130 - var127 - 1
				
				if var130 - var127 > 1 then
					table.insert(list, table.move(p54, var127 + 1, var130 - 1, 1, table.create(var130 - var127 - 1)))
				end
				if p54[var130] == 58 then
					var131 = t_1[1]
					
					if var131[2] then
						error("malformed substitution pattern", 3)
					end
					var131[2] = table.move(list, var131[3], #list, 1, table.create(#list + 1 - var131[3]))
					
					for i_1 = #list, var131[3], -1 do
						list[i_1] = nil
					end
				elseif p54[var130] == 125 then
					local i_2
					var131 = table.remove(t_1, 1)
					var132 = table.move(list, var131[3], #list, 1, table.create(#list + 1 - var131[3]))
					
					for i_2 = #list, var131[3], -1 do
						list[i_2] = nil
					end
					i_2 = {}
					local var133 = "condition"
					local var134 = var131[1]
					local _ = false
					local var135 = var131[2]
					local _ = var135 == true and ((if var135 == true then var131[2] else nil) or var132)
					-- Unknown statement at pc 6: <SetList>
					table.insert(list, i_2)
				elseif p54[var130] then
					var130 += 1
					var131 = p54[var130]
					
					if not var131 then
						if p54[var130 - 1] == 92 then
							error("replacement string must not end with a trailing backslash", 3)
						end
						var132 = list[#list]
						
						if type(var132) == "table" then
							table.insert(var132, p54[var130 - 1])
						else
							table.insert(list, { p54[var130 - 1] })
						end
					elseif var131 == 92 and p54[var130 - 1] == 36 then
						var132 = list[#list]
						
						if type(var132) == "table" then
							table.insert(var132, 36)
						else
							table.insert(list, { 36 })
						end
						var130 -= 1
						var126 += 1
					elseif var131 == 48 then
						table.insert(list, 0)
					elseif var131 > 48 and var131 <= 57 then
						var132 = var130
						var136 = var131 - 48
						while p54[var130 + 1] and (p54[var130 + 1] >= 48 and p54[var130 + 1] <= 57) do
							var136 ..= p54[var130 + 1] - 48
							var130 += 1
						end
						var136 = tonumber(var136)
						
						if not t.u and groupN < var136 then
							error("reference to non-existent subpattern", 3)
						end
						table.insert(list, var136)
					elseif var131 == 123 and p54[var130 - 1] == 36 then
						var130 += 1
						var132 = var130
						while p54[var130] and (p54[var130] >= 48 and p54[var130] <= 57 or p54[var130] >= 65 and p54[var130] <= 90 or (p54[var130] >= 97 and p54[var130] <= 122 or p54[var130] == 95)) do
							var130 += 1
						end
						if (p54[var130] == 125 or p54[var130] == 58 and (p54[var130 + 1] == 43 or p54[var130 + 1] == 45)) and var130 ~= var132 then
							i_1 = p54.s
							local byteOffset = utf8.offset(i_1, var130)
							byteOffset = string.sub(i_1, utf8.offset(i_1, var132), byteOffset and byteOffset - 1)
							
							if p54[var132] >= 48 and p54[var132] <= 57 then
								var136 = tonumber(byteOffset)
								
								if not t.u and groupN < var136 then
									error("reference to non-existent subpattern", 3)
								end
							else
								var136 = p53.group_id[byteOffset]
								
								if not t.u and (not var136 or groupN < var136) then
									error("reference to non-existent subpattern", 3)
								end
							end
							if p54[var130] == 58 then
								var130 += 1
								table.insert(t_1, { var136, p54[var130] == 45, #list + 1 })
							else
								table.insert(list, var136)
							end
						else
							error("malformed substitution pattern", 3)
						end
					else
						var132 = nil
						
						if p54[var130 - 1] ~= 36 then
							var132 = t_5[p54[var130]]
							
							if type(var132) ~= "number" then
								var132 = nil
							end
						elseif var131 ~= 36 then
							var136 = list[#list]
							
							if type(var136) == "table" then
								table.insert(var136, 36)
							else
								table.insert(list, { 36 })
							end
						end
						var136 = list[#list]
						
						if type(var136) == "table" then
							table.insert(var136, var132 or p54[var130])
						else
							table.insert(list, { var132 or p54[var130] })
						end
						var126 += 1
					end
				end
				var127 = var130
			end
			if t_1[1] then
				error("malformed substitution pattern", 3)
			end
			if list[2] or type(list[1]) ~= "table" or list[1][1] == "condition" then
				p54 = list
				var125 = "subst_string"
			else
				var130 = list[1]
				p54.n = #list[1]
				p54 = var130
			end
		end
	end
	local var138 = to_str_arr(p55)
	var138 = 0
	list = 1
	local var139 = 0
	repeat
		if list > var138.n + var138 + 1 then break end
		local var140 = re_rawfind(p53.token, var138, list, p53.flags, p53.verb_flags, false)
		
		if not var140 then break end
		local byteOffset
		var130 = nil
		
		if var125 == "string" then
			var130 = p54
		elseif var125 == "subst_string" then
			var130 = insert_tokenized_sub(table.create(var126), var138, var140, p54)
		else
			var131 = nil
			var132 = nil
			
			if var125 == "table" then
				var136 = var138.s
				byteOffset = utf8.offset(var136, var140[0][2])
				var131 = string.sub(var136, utf8.offset(var136, var140[0][1]), byteOffset and byteOffset - 1)
				var132 = p54[var131]
			else
				var131 = new_match(var140, p53.group_id, p58, var138.s)
				var132 = p54(var131)
			end
			if var132 == var131 or t.o and not var132 then
				var136 = var140[0][2] - var140[0][1]
				var130 = table.move(var138, var140[0][1], var140[0][2] - 1, 1, table.create(var136))
				var130.n = var136
			elseif type(var132) == "string" then
				var130 = to_str_arr(var132)
			elseif type(var132) == "number" then
				var130 = to_str_arr(var132 .. "")
			elseif t.o then
				error(string.format("invalid replacement value (a %s)", type(var132)), 3)
			else
				var130 = { n = 0 }
			end
		end
		var131 = var140[0][2] - var140[0][1]
		var132 = math.min(var130.n, var131)
		
		for byteOffset = 0, var132 - 1 do
			var138[var140[0][1] + byteOffset] = var130[byteOffset + 1]
		end
		var136 = var140[0][1] + var132
		list = var140[0][2]
		
		if var130.n < var131 then
			for _ = 1, var131 - var130.n do
				table.remove(var138, var136)
				var138 -= 1
				list -= 1
			end
		elseif var131 < var130.n then
			for i_3 = 1, var130.n - var131 do
				table.insert(var138, var136 + i_3 - 1, var130[var132 + i_3])
				var138 += 1
				list += 1
			end
		end
		if var131 <= 0 then
			list += 1
		end
		var139 += 1
	until p56 < var139 + 1
	return from_str_arr(var138), var139
end

local var41 = "sub"

function t_1.sub(...) --[[ line: 171 ]]
	-- upvalues: tbl (ref), var41 (ref), t (ref), var40 (ref)
	local var64 = select("#", ...)
	
	if var64 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var64 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var65, var66, var67, var68, var69, var70 = ...
	
	if not tbl[var65] or tbl[var65].name ~= "RegEx" then
		if type(var65) ~= "string" and type(var65) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var41, typeof(var65)), 2)
		end
		var65 = t.fromstring(var65)
	elseif var41 == "sub" then
		if type(var67) == "number" then
			var67 ..= ""
		elseif type(var67) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var67)), 2)
		end
	elseif type(var66) == "number" then
		var66 ..= ""
	elseif type(var66) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var41, typeof(var66)), 2)
	end
	if var41 ~= "sub" and var41 ~= "split" then
		local var71 = typeof(var67)
		
		if var71 ~= "nil" then
			var67 = tonumber(var67)
			
			if var67 then
				var67 = if var67 < 0 then #var66 + math.floor(var67 + 0.5) + 1 else math.max(math.floor(var67 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var41, var71), 2)
			end
		end
	end
	var65 = tbl[var65]
	
	if var41 == "match" or var41 == "matchiter" then
		var68 = ...
	elseif var41 == "sub" then
		var70 = ...
	end
	return var40(var65, var66, var67, var68, var69, var70)
end

local var42 = function(p59, p60, p61) --[[ line: 1062 ]]
	-- upvalues: to_str_arr (ref), re_rawfind (ref)
	if tonumber(p61) then
		p61 = tonumber(p61)
		
		if p61 <= -1 or p61 ~= p61 then
			p61 = 1e999
		end
	elseif p61 == nil then
		p61 = 1e999
	else
		error(string.format("invalid argument #3 to 'split' (number expected, got %s)", typeof(p61)), 3)
	end
	local var142 = to_str_arr(p60)
	var142 = 1
	local var143 = 0
	local t = {}
	local var145 = 0
	while var142 <= var142.n + 1 do
		var143 += 1
		local var146 = var143 <= p61 and re_rawfind(p59.token, var142, var142, p59.flags, p59.verb_flags, false)
		
		if not var146 then break end
		local s = var142.s
		local byteOffset = utf8.offset(s, var146[0][1])
		table.insert(t, string.sub(s, utf8.offset(s, var142 - var145), byteOffset and byteOffset - 1))
		var145 = if var146[0][2] <= var146[0][1] then 1 else 0
		var142 = var146[0][2] + var145
	end
	table.insert(t, string.sub(var142.s, utf8.offset(var142.s, var142 - var145)))
	
	return t
end

local var43 = "split"

function t_1.split(...) --[[ line: 171 ]]
	-- upvalues: tbl (ref), var43 (ref), t (ref), var42 (ref)
	local var64 = select("#", ...)
	
	if var64 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var64 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var65, var66, var67, var68, var69, var70 = ...
	
	if not tbl[var65] or tbl[var65].name ~= "RegEx" then
		if type(var65) ~= "string" and type(var65) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var43, typeof(var65)), 2)
		end
		var65 = t.fromstring(var65)
	elseif var43 == "sub" then
		if type(var67) == "number" then
			var67 ..= ""
		elseif type(var67) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var67)), 2)
		end
	elseif type(var66) == "number" then
		var66 ..= ""
	elseif type(var66) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var43, typeof(var66)), 2)
	end
	if var43 ~= "sub" and var43 ~= "split" then
		local var71 = typeof(var67)
		
		if var71 ~= "nil" then
			var67 = tonumber(var67)
			
			if var67 then
				var67 = if var67 < 0 then #var66 + math.floor(var67 + 0.5) + 1 else math.max(math.floor(var67 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var43, var71), 2)
			end
		end
	end
	var65 = tbl[var65]
	
	if var43 == "match" or var43 == "matchiter" then
		var68 = ...
	elseif var43 == "sub" then
		var70 = ...
	end
	return var42(var65, var66, var67, var68, var69, var70)
end

local _ = function(p62, p63) --[[ line: 1092 | named "re_index" ]]
	-- upvalues: t_1 (write), tbl (ref)
	return t_1[p63] or tbl[p62].flags[p63]
end

local function re_tostr(p64) --[[ line: 1096 ]]
	-- upvalues: tbl (ref)
	return tbl[p64].pattern_repr .. tbl[p64].flag_repr
end

local t_9 = {
	[58] = true,
	[33] = true,
	[61] = true,
	[62] = true,
	[124] = true
}

local function tokenize_ptn(p65, p66) --[[ line: 1112 ]]
	-- upvalues: t_8 (ref), t_9 (ref), list_3 (ref), list_1 (ref), t_5 (ref), t_4 (ref), t_6 (ref), list_2 (ref), list (ref)
	if p66.unicode then
		return "options.unicodeData cannot be turned off while having unicode flag"
	end
	local var148 = 1
	local n = p65.n
	local var149 = 0
	local t = {}
	local t_1 = {}
	local t_2 = { newline = 1, newline_seq = 1, not_empty = 0 }
	local var153, byteOffset, v
	while var148 <= n do
		local var154, var155, s, substring, s_1, byteOffset_1, i
		var153 = p65[var148]
		
		if var153 ~= 40 then
			if var153 ~= 41 then
				if var153 == 46 then
					table.insert(t, list_1)
				elseif var153 ~= 91 then
					if var153 == 92 then
						var148 += 1
						var154 = p65[var148]
						
						if var154 then
							if var154 >= 48 and var154 <= 57 then
								var155 = var148
								while p65[var148 + 1] and (p65[var148 + 1] >= 48 and p65[var148 + 1] <= 57) do
									var148 += 1
								end
								byteOffset = p65.s
								byteOffset_1 = utf8.offset(byteOffset, var148 + 1)
								substring = tonumber(string.sub(byteOffset, utf8.offset(byteOffset, var155), byteOffset_1 and byteOffset_1 - 1))
								
								if var149 < substring and var148 ~= var155 then
									var148 = var155
									s = nil
									byteOffset = nil
									s_1 = nil
									
									if p65[var148] <= 55 then
										s = p65[var148] - 48
										var148 += 1
										
										if p65[var148] and p65[var148] >= 48 and p65[var148] <= 55 then
											byteOffset = p65[var148] - 48
											var148 += 1
											
											if p65[var148] and p65[var148] >= 48 and p65[var148] <= 55 then
												s_1 = p65[var148] - 48
											else
												var148 -= 1
											end
										else
											var148 -= 1
										end
									end
									if s and byteOffset then
										v = if s_1 then 64 * s + 8 * byteOffset + s_1 else 8 * s + byteOffset or (s or p65[var155])
									end
									table.insert(t, v)
								else
									table.insert(t, { "backref", substring })
								end
							elseif var154 ~= 69 then
								if var154 == 81 then
									var155 = var148 + 1
									repeat
										var148 = table.find(p65, 92, var148 + 1)
									until not (var148 and p65[var148 + 1] ~= 69)
									table.move(p65, var155, if var148 then var148 - 1 else #p65, #t + 1, t)
									
									if not var148 then break end
									var148 += 1
								elseif var154 ~= 78 then
									if var154 ~= 80 and var154 ~= 112 then
										if var154 == 103 and (p65[var148 + 1] == 123 or p65[var148 + 1] >= 48 and p65[var148 + 1] <= 57) then
											var155 = false
											var148 += 1
											
											if p65[var148] == 123 then
												var148 += 1
												var155 = true
											elseif p65[var148] >= 48 and p65[var148] <= 57 then
												substring = var148
												while p65[var148] and (p65[var148] >= 48 and p65[var148] <= 57 or p65[var148] >= 65 and p65[var148] <= 70 or p65[var148] >= 97 and p65[var148] <= 102) do
													var148 += 1
												end
												if not var155 or p65[var148] == 125 then
													s_1 = p65.s
													i = utf8.offset(s_1, var148 + (if var155 then 0 else 1))
													table.insert(t, {
														"backref",
														tonumber(string.sub(s_1, utf8.offset(s_1, substring), i and i - 1))
													})
													
													if not var155 then
														var148 -= 1
													end
												end
												return "malformed reference code"
											end
											return "malformed reference code"
										elseif var154 == 111 then
											var148 += 1
											
											if p65[var148 + 1] == 123 then
												var148 += 1
												var155 = var148
												while p65[var148] and (p65[var148] >= 48 and p65[var148] <= 55) do
													var148 += 1
												end
												if p65[var148] == 125 and var148 ~= var155 then
													byteOffset = p65.s
													byteOffset_1 = utf8.offset(byteOffset, var148)
													substring = tonumber(string.sub(byteOffset, utf8.offset(byteOffset, var155), byteOffset_1 and byteOffset_1 - 1), 8)
													
													if substring <= 65535 then
														table.insert(t, substring)
													end
													return "character offset too large"
												end
												return "malformed octal code"
											end
											return "malformed octal code"
										elseif var154 == 120 then
											var155 = nil
											substring = nil
											var148 += 1
											
											if p65[var148] == 123 then
												var148 += 1
												s = var148
												while p65[var148] and (p65[var148] >= 48 and p65[var148] <= 57 or p65[var148] >= 65 and p65[var148] <= 70 or p65[var148] >= 97 and p65[var148] <= 102) do
													var148 += 1
												end
												if p65[var148] == 125 and var148 ~= s then
													if var148 - s <= 4 then
														v = p65.s
														local byteOffset_2 = utf8.offset(v, var148)
														table.insert(t, tonumber(string.sub(v, utf8.offset(v, s), byteOffset_2 and byteOffset_2 - 1), 16))
													end
													return "character offset too large"
												end
												return "malformed hexadecimal code"
											elseif p65[var148] and (p65[var148] >= 48 and p65[var148] <= 57 or p65[var148] >= 65 and p65[var148] <= 70 or p65[var148] >= 97 and p65[var148] <= 102) then
												s = p65[var148]
												byteOffset = if p65[var148] >= 65 and p65[var148] <= 90 then 55 elseif p65[var148] >= 97 and p65[var148] <= 122 then 87 else 48
												var155 = s - byteOffset
												var148 += 1
												
												if p65[var148] and (p65[var148] >= 48 and p65[var148] <= 57 or p65[var148] >= 65 and p65[var148] <= 70 or p65[var148] >= 97 and p65[var148] <= 102) then
													s = p65[var148]
													byteOffset = if p65[var148] >= 65 and p65[var148] <= 90 then 55 elseif p65[var148] >= 97 and p65[var148] <= 122 then 87 else 48
													substring = s - byteOffset
												else
													var148 -= 1
												end
											else
												var148 -= 1
											end
											if var155 then
												s_1 = if substring then 16 * var155 + substring else var155 or 0
											end
											table.insert(t, s_1)
										else
											table.insert(t, t_6[var154] or t_5[var154] or var154)
										end
									end
									return "options.unicodeData cannot be turned off when using \\p"
								elseif p65[var148 + 1] == 123 and p65[var148 + 2] == 85 and (p65[var148 + 3] == 43 and p66.unicode) then
									var148 += 4
									var155 = var148
									while p65[var148] and (p65[var148] >= 48 and p65[var148] <= 57 or p65[var148] >= 65 and p65[var148] <= 70 or p65[var148] >= 97 and p65[var148] <= 102) do
										var148 += 1
									end
									if p65[var148] == 125 and var148 ~= var155 then
										byteOffset = p65.s
										byteOffset_1 = utf8.offset(byteOffset, var148)
										table.insert(t, tonumber(string.sub(byteOffset, utf8.offset(byteOffset, var155), byteOffset_1 and byteOffset_1 - 1)))
									end
									return "malformed Unicode code point"
								else
									table.insert(t, t_5[78])
								end
							end
						end
						return "pattern may not end with a trailing backslash"
					elseif var153 == 42 or var153 == 43 or (var153 == 63 or var153 == 123) then
						var154 = nil
						var155 = nil
						
						if var153 == 123 then
							substring = var148 + 1
							s = nil
							while p65[var148 + 1] and (p65[var148 + 1] >= 48 and p65[var148 + 1] <= 57 or p65[var148 + 1] == 44 and not s and var148 + 1 ~= substring) do
								var148 += 1
								
								if p65[var148] == 44 then
									s = var148
								end
							end
							if p65[var148 + 1] == 125 then
								var148 += 1
								
								if s then
									byteOffset_1 = p65.s
									i = utf8.offset(byteOffset_1, s)
									var154 = tonumber(string.sub(byteOffset_1, utf8.offset(byteOffset_1, substring), i and i - 1))
									
									if s + 1 == var148 then
										byteOffset = 1e999
									else
										byteOffset_1 = p65.s
										v = utf8.offset(byteOffset_1, var148)
										byteOffset = tonumber(string.sub(byteOffset_1, utf8.offset(byteOffset_1, s + 1), v and v - 1))
									end
									var155 = byteOffset
									
									if var155 >= var154 then
										if var154 then
											substring = if p66.ungreedy then "lazy" else "greedy"
											
											if p65[var148 + 1] == 43 or p65[var148 + 1] == 63 then
												var148 += 1
												substring = if p65[var148] == 43 then "possessive" elseif p66.ungreedy then "greedy" else "lazy"
											end
											s = #t
											byteOffset = t[s]
											
											if byteOffset and (type(byteOffset) ~= "table" or byteOffset[1] ~= "quantifier" and byteOffset[1] ~= 40 and not t_6[byteOffset[1]]) and (byteOffset ~= list_3 and type(byteOffset) ~= "string") then
												if var155 == 0 then
													table.remove(t)
												elseif var154 ~= 1 or var155 ~= 1 then
													if type(byteOffset) == "table" and byteOffset[1] == 41 then
														s = byteOffset[3]
													end
													t[s] = {
														"quantifier",
														var154,
														var155,
														substring,
														t[s]
													}
												end
											end
											return "quantifier doesn't follow a repeatable pattern"
										end
									end
									return "numbers out of order in {} quantifier"
								else
									byteOffset_1 = p65.s
									i = utf8.offset(byteOffset_1, var148)
									var154 = tonumber(string.sub(byteOffset_1, utf8.offset(byteOffset_1, substring), i and i - 1))
									var155 = var154
								end
							else
								table.move(p65, substring - 1, var148, #t + 1, t)
							end
						else
							var154 = if var153 == 43 then 1 else 0
							var155 = if var153 == 63 then 1 else 1e999
						end
					elseif var153 == 124 then
						table.insert(t, list_3)
						var154 = #t
						repeat
							var154 -= 1
							var155 = t[var154]
							substring = type(t[var154]) == "table"
							if substring and var155[1] == 41 then
								var154 = t[var154][3]
							elseif substring and var155[1] == 40 then
								if var155[4] ~= 124 then break end
								var149 = var155[5]
								break
						until not var155
					elseif var153 == 36 or var153 == 94 then
						table.insert(t, if var153 == 94 then list_2 else list)
					elseif p66.ignoreCase and var153 >= 97 and var153 <= 122 then
						table.insert(t, var153 - 32)
					elseif not p66.extended or (var153 < 9 or var153 > 13) and (var153 ~= 32 and var153 ~= 35) then
						table.insert(t, var153)
					elseif var153 == 35 then
						repeat
							var148 += 1
						until not (p65[var148] and p65[var148] ~= 10 and p65[var148] ~= 13)
					end
				end
				var154 = false
				var155 = nil
				var148 += 1
				substring = var148
				
				if p65[var148] == 94 then
					var154 = true
					var148 += 1
				elseif p65[var148] == 46 or p65[var148] == 58 or p65[var148] == 61 then
					var155 = p65[var148]
				end
				s = nil
				
				if p65[var148] == 91 or p65[var148] == 92 then
					s = {}
				else
					s = { p65[var148] }
					var148 += 1
				end
				while p65[var148] ~= 93 do
					if p65[var148] then
						if p65[var148] == 45 and s[1] and type(s[1]) == "number" then
							if p65[var148 + 1] == 93 then
								table.insert(s, 1, 45)
							else
								var148 += 1
								byteOffset = p65[var148]
								
								if byteOffset == 91 then
									if p65[var148 + 1] == 46 or p65[var148 + 1] == 58 or p65[var148 + 1] == 61 then
										s_1 = var148 + 2
										repeat
											s_1 = table.find(p65, 93, s_1)
										until not (s_1 and p65[s_1 - 1] == 92)
										if s_1 then
											if p65[s_1 - 1] ~= p65[var148 + 1] or s_1 - 1 == var148 + 1 then
												if s[1] <= 91 then
													s[1] = { "range", s[1], byteOffset }
													continue
												end
												return "invalid range in character class"
											end
											return "invalid range in character class"
										end
										return "unterminated character class"
									end
								elseif byteOffset == 92 then
									var148 += 1
									
									if p65[var148] == 120 then
										s_1 = nil
										byteOffset_1 = nil
										var148 += 1
										
										if p65[var148] and p65[var148] >= 48 and p65[var148] <= 57 or (p65[var148] >= 65 and p65[var148] <= 70 or p65[var148] >= 97 and p65[var148] <= 102) then
											i = p65[var148]
											v = if p65[var148] >= 65 and p65[var148] <= 90 then 55 elseif p65[var148] >= 97 and p65[var148] <= 122 then 87 else 48
											s_1 = i - v
											var148 += 1
											
											if p65[var148] and p65[var148] >= 48 and p65[var148] <= 57 or (p65[var148] >= 65 and p65[var148] <= 70 or p65[var148] >= 97 and p65[var148] <= 102) then
												i = p65[var148]
												v = if p65[var148] >= 65 and p65[var148] <= 90 then 55 elseif p65[var148] >= 97 and p65[var148] <= 122 then 87 else 48
												byteOffset_1 = i - v
											else
												var148 -= 1
											end
										else
											var148 -= 1
										end
										if s_1 then
											if byteOffset_1 then
												i = 16 * s_1 + byteOffset_1
												
												if not i then
													i = s_1
													
													if not i then
														i = 0
													end
												end
												byteOffset = i
											end
										end
									elseif p65[var148] >= 48 and p65[var148] <= 55 then
										s_1 = p65[var148] - 48
										byteOffset_1 = nil
										i = nil
										var148 += 1
										
										if p65[var148] and p65[var148] >= 48 and p65[var148] <= 55 then
											byteOffset_1 = p65[var148] - 48
											var148 += 1
											
											if p65[var148] and p65[var148] >= 48 and p65[var148] <= 55 then
												i = p65[var148] - 48
											else
												var148 -= 1
											end
										else
											var148 -= 1
										end
										if byteOffset_1 then
											if i then
												v = 64 * s_1 + 8 * byteOffset_1 + i
												
												if not v then
													v = 8 * s_1 + byteOffset_1
													
													if not v then
														v = s_1
													end
												end
												byteOffset = v
											end
										end
									else
										byteOffset = t_5[p65[var148]] or p65[var148]
										
										if type(byteOffset) == "number" then
										end
										return "invalid range in character class"
									end
								elseif byteOffset >= s[1] then
								end
								return "invalid range in character class"
							end
						elseif p65[var148] == 91 then
							if p65[var148 + 1] == 46 or p65[var148 + 1] == 58 or p65[var148 + 1] == 61 then
								byteOffset = var148 + 2
								repeat
									byteOffset = table.find(p65, 93, byteOffset)
								until not (byteOffset and p65[byteOffset - 1] == 92)
								if byteOffset then
									if p65[byteOffset - 1] == p65[var148 + 1] and byteOffset - 1 ~= var148 + 1 then
										if p65[byteOffset - 1] ~= 46 and p65[byteOffset - 1] ~= 61 then
											if p65[byteOffset - 1] == 58 then
												s_1 = p65[var148 + 3] == 94
												i = p65.s
												local byteOffset_2 = utf8.offset(i, byteOffset - 1)
												byteOffset_1 = string.sub(i, utf8.offset(i, var148 + (if s_1 then 3 else 2)), byteOffset_2 and byteOffset_2 - 1)
												
												if t_4[byteOffset_1] then
													table.insert(s, 1, { "class", byteOffset_1, s_1 })
													var148 = byteOffset
													continue
												end
												return "unknown POSIX class name"
											end
										end
										return "POSIX collating elements aren't supported"
									else
										table.insert(s, 1, 91)
									end
								end
								return "unterminated character class"
							else
								table.insert(s, 1, 91)
							end
						elseif p65[var148] == 92 then
							var148 += 1
							
							if p65[var148] == 120 then
								byteOffset = nil
								s_1 = nil
								var148 += 1
								
								if p65[var148] == 123 then
									var148 += 1
									byteOffset_1 = var148
									while p65[var148] and (p65[var148] >= 48 and p65[var148] <= 57 or p65[var148] >= 65 and p65[var148] <= 70 or p65[var148] >= 97 and p65[var148] <= 102) do
										var148 += 1
									end
									if p65[var148] == 125 and var148 ~= byteOffset_1 then
										if var148 - byteOffset_1 <= 4 then
											local var160 = 1
											local s_2 = p65.s
											local byteOffset_2 = utf8.offset(s_2, var148)
											table.insert(s, var160, tonumber(string.sub(s_2, utf8.offset(s_2, byteOffset_1), byteOffset_2 and byteOffset_2 - 1), 16))
											continue
										end
										return "character offset too large"
									end
									return "malformed hexadecimal character"
								elseif p65[var148] and p65[var148] >= 48 and p65[var148] <= 57 or (p65[var148] >= 65 and p65[var148] <= 70 or p65[var148] >= 97 and p65[var148] <= 102) then
									byteOffset_1 = p65[var148]
									i = if p65[var148] >= 65 and p65[var148] <= 90 then 55 elseif p65[var148] >= 97 and p65[var148] <= 122 then 87 else 48
									byteOffset = byteOffset_1 - i
									var148 += 1
									
									if p65[var148] and p65[var148] >= 48 and p65[var148] <= 57 or (p65[var148] >= 65 and p65[var148] <= 70 or p65[var148] >= 97 and p65[var148] <= 102) then
										byteOffset_1 = p65[var148]
										i = if p65[var148] >= 65 and p65[var148] <= 90 then 55 elseif p65[var148] >= 97 and p65[var148] <= 122 then 87 else 48
										s_1 = byteOffset_1 - i
									else
										var148 -= 1
									end
								else
									var148 -= 1
								end
								local var162
								v = 1
								
								if byteOffset then
									var162 = if s_1 then 16 * byteOffset + s_1 else byteOffset or 0
								end
								table.insert(s, v, var162)
							elseif p65[var148] >= 48 and p65[var148] <= 55 then
								byteOffset = p65[var148] - 48
								s_1 = nil
								byteOffset_1 = nil
								var148 += 1
								
								if p65[var148] and p65[var148] >= 48 and p65[var148] <= 55 then
									s_1 = p65[var148] - 48
									var148 += 1
									
									if p65[var148] and p65[var148] >= 48 and p65[var148] <= 55 then
										byteOffset_1 = p65[var148] - 48
									else
										var148 -= 1
									end
								else
									var148 -= 1
								end
								local var166
								local var165 = 1
								
								if s_1 then
									var166 = if byteOffset_1 then 64 * byteOffset + 8 * s_1 + byteOffset_1 else 8 * byteOffset + s_1 or byteOffset
								end
								table.insert(s, var165, var166)
							elseif p65[var148] == 69 then
								var148 += 1
								continue
							elseif p65[var148] == 81 then
								byteOffset = var148 + 1
								repeat
									var148 = table.find(p65, 92, var148 + 1)
								until not (var148 and p65[var148 + 1] ~= 69)
								table.move(p65, byteOffset, if var148 then var148 - 1 else #p65, #t + 1, t)
								
								if not var148 then break end
								var148 += 1
							elseif p65[var148] == 78 then
								if p65[var148 + 1] == 123 and p65[var148 + 2] == 85 and (p65[var148 + 3] == 43 and p66.unicode) then
									var148 += 4
									byteOffset = var148
									while p65[var148] and (p65[var148] >= 48 and p65[var148] <= 57 or p65[var148] >= 65 and p65[var148] <= 70 or p65[var148] >= 97 and p65[var148] <= 102) do
										var148 += 1
									end
									if p65[var148] == 125 and var148 ~= byteOffset then
										i = p65.s
										local byteOffset_2 = utf8.offset(i, var148)
										table.insert(s, 1, tonumber(string.sub(i, utf8.offset(i, byteOffset), byteOffset_2 and byteOffset_2 - 1)))
										continue
									end
									return "malformed Unicode code point"
								end
								return "invalid escape sequence"
							elseif p65[var148] ~= 80 and p65[var148] ~= 112 then
								if p65[var148] == 111 then
									var148 += 1
									
									if p65[var148] == 123 then
										var148 += 1
										byteOffset = var148
										while p65[var148] and (p65[var148] >= 48 and p65[var148] <= 55) do
											var148 += 1
										end
										if p65[var148] == 125 and var148 ~= byteOffset then
											i = p65.s
											local byteOffset_2 = utf8.offset(i, var148)
											s_1 = tonumber(string.sub(i, utf8.offset(i, byteOffset), byteOffset_2 and byteOffset_2 - 1), 8)
											
											if s_1 <= 65535 then
												table.insert(s, 1, s_1)
												continue
											end
											return "character offset too large"
										end
										return "malformed octal code"
									end
									return "malformed octal code"
								else
									byteOffset = t_5[p65[var148]]
									table.insert(s, 1, if type(byteOffset) == "string" then { "class", byteOffset, false } else byteOffset or p65[var148])
								end
							end
							return "options.unicodeData cannot be turned off when using \\p"
						elseif p66.ignoreCase and p65[var148] >= 97 and p65[var148] <= 122 then
							table.insert(s, 1, p65[var148] - 32)
						else
							table.insert(s, 1, p65[var148])
						end
					end
					return "unterminated character class"
				end
				if p65[var148 - 1] ~= var155 or var148 - 1 == substring then
					if s[2] or var154 then
						table.insert(t, { "charset", var154, s })
					else
						table.insert(t, s[1])
					end
				end
				return if var155 == 58 then "POSIX named classes are only support within a character set" else "POSIX collating elements aren't supported"
				var148 += 1
				continue
			end
			var154 = #t + 1
			var155 = -1
			substring = 0
			s = 0
			byteOffset = 0
			repeat
				var154 -= 1
				s_1 = t[var154]
				byteOffset_1 = type(t[var154]) == "table"
				if byteOffset_1 and s_1[1] == 40 then
					byteOffset += 1
					
					if substring and s_1.count then
						substring += s_1.count
					end
					if not s_1[3] then
						if s_1[4] == 124 then
							var149 = s_1[5] + math.max(s, byteOffset)
						end
						if substring == var155 or var155 == -1 then
							var155 = substring
							break
						end
						var155 = nil
						break
				elseif s_1 == list_3 then
					if substring == var155 or var155 == -1 then
						var155 = substring
						substring = 0
					else
						var155 = nil
						substring = nil
					end
					s = math.max(s, byteOffset)
					byteOffset = 0
				elseif substring then
					substring = if byteOffset_1 and s_1[1] == "quantifier" then if s_1[2] == s_1[3] then substring + s_1[2] else nil else substring + 1
				end
			until var154 < 1
			if var154 >= 1 then
				s_1 = t[var154]
				byteOffset_1 = #t + 1
				i = {
					41,
					s_1[2],
					var154,
					s_1[4],
					s_1[5],
					count = var155
				}
				
				if s_1[4] ~= 33 and s_1[4] ~= 61 or (not s_1[5] or var155) then
					s_1[3] = byteOffset_1
					table.insert(t, i)
				end
				return "lookbehind assertion is not fixed width"
			end
			return "unmatched ) in regular expression"
		end
		var154 = nil
		
		if p65[var148 + 1] == 42 then
			var148 += 2
			var155 = var148
			while p65[var148] and (p65[var148] >= 48 and p65[var148] <= 57 or p65[var148] >= 65 and p65[var148] <= 90 or (p65[var148] >= 97 and p65[var148] <= 122 or (p65[var148] == 95 or p65[var148] == 58))) do
				var148 += 1
			end
			if p65[var148] == 41 or p65[var148 - 1] == 58 then
				s = p65.s
				byteOffset = utf8.offset(s, var148)
				substring = string.sub(s, utf8.offset(s, var155), byteOffset and byteOffset - 1)
				
				if substring == "positive_lookahead:" or substring == "negative_lookhead:" or (substring == "positive_lookbehind:" or substring == "negative_lookbehind:") or substring:find("^[pn]l[ab]:$") then
					var154 = {
						40,
						nil,
						nil,
						if substring:find("^n") then 33 else 61,
						substring:find("b", 3, true) and 1
					}
				elseif substring == "atomic:" then
					var154 = {
						40,
						nil,
						nil,
						62,
						nil
					}
				elseif substring == "ACCEPT" or substring == "FAIL" or (substring == "F" or substring == "PRUNE") or substring == "SKIP" then
					var154 = if substring == "F" then "FAIL" else substring
				elseif t_8[substring] then
					t_2.newline = substring
				elseif substring == "BSR_ANYCRLF" or substring == "BSR_UNICODE" then
					t_2.newline_seq = if substring == "BSR_UNICODE" then 1 else 0
				elseif substring == "NOTEMPTY" or substring == "NOTEMPTY_ATSTART" then
					t_2.not_empty = if substring == "NOTEMPTY" then 1 else 2
				end
				return "unknown or malformed verb"
				if not t[1] then
					if var154 then
						table.insert(t, var154)
					end
				end
				return "this verb must be placed at the beginning of the regex"
			end
			return "quantifier doesn't follow a repeatable pattern"
		elseif p65[var148 + 1] == 63 then
			var148 += 2
			
			if p65[var148] == 35 then
				var155 = table.find(p65, 41, var148)
				
				if var155 then
					var148 = var155 + 1
					continue
				end
				return "unterminated parenthetical"
			elseif p65[var148] then
				var154 = {
					40,
					nil,
					nil,
					p65[var148],
					nil
				}
				
				if p65[var148] == 48 and p65[var148 + 1] == 41 then
					var155 = "recurmatch"
					substring = 0
					s = 0
					byteOffset = nil
					var154[1] = var155
					var154[2] = substring
					var154[3] = s
					var154[5] = byteOffset
				elseif p65[var148] > 48 and p65[var148] <= 57 then
					var155 = var148
					var148 += 1
					while p65[var148] >= 48 and p65[var148] <= 48 do
						var148 += 1
					end
					if p65[var148] == 41 then
						substring = "recurmatch"
						s_1 = p65.s
						byteOffset_1 = utf8.offset(s_1, var148)
						s = tonumber(string.sub(s_1, utf8.offset(s_1, var155), byteOffset_1 and byteOffset_1 - 1))
						byteOffset = nil
						var154[1] = substring
						var154[2] = s
						var154[4] = byteOffset
					end
					return "invalid group structure"
				elseif p65[var148] == 60 and p65[var148 + 1] == 33 or p65[var148 + 1] == 61 then
					var148 += 1
					substring = 1
					var154[4] = p65[var148]
					var154[5] = substring
				elseif p65[var148] == 124 then
					var154[5] = var149
				elseif p65[var148] == 80 or p65[var148] == 60 or p65[var148] == 39 then
					if p65[var148] == 80 then
						var148 += 1
					end
					if p65[var148] == 61 then
						var155 = var148 + 1
						while p65[var148] and (p65[var148] >= 48 and p65[var148] <= 57 or p65[var148] >= 65 and p65[var148] <= 90 or (p65[var148] >= 97 and p65[var148] <= 122 or p65[var148] == 95)) do
							var148 += 1
						end
						if p65[var148] then
							if p65[var148] == 41 and var148 ~= var155 then
								substring = {}
								s = "backref"
								s_1 = p65.s
								byteOffset_1 = utf8.offset(s_1, var148)
								-- Unknown statement at pc 4: <SetList>
								var154 = substring
							end
							return "invalid group structure"
						end
						return "unterminated parenthetical"
					elseif p65[var148] == 60 or p65[var148 - 1] ~= 80 and p65[var148] == 39 then
						var155 = if p65[var148] == 39 then 39 else 62
						substring = var148 + 1
						var148 += 1
						
						if p65[var148] ~= 41 then
							if p65[var148] < 48 or p65[var148] > 57 then
								if p65[var148] >= 65 and p65[var148] <= 90 or p65[var148] >= 97 and p65[var148] <= 122 or p65[var148] == 95 then
									var148 += 1
									while p65[var148] and (p65[var148] >= 48 and p65[var148] <= 57 or p65[var148] >= 65 and p65[var148] <= 90 or (p65[var148] >= 97 and p65[var148] <= 122 or p65[var148] == 95)) do
										var148 += 1
									end
									if p65[var148] then
										if p65[var148] == var155 then
											byteOffset = p65.s
											byteOffset_1 = utf8.offset(byteOffset, var148)
											s = string.sub(byteOffset, utf8.offset(byteOffset, substring), byteOffset_1 and byteOffset_1 - 1)
											var149 += 1
											
											if (t_1[s] or var149) == var149 then
												for i, v in pairs(t_1) do
													if s ~= i and var149 == v then
														return "different names for subpatterns of the same number aren't permitted"
													end
												end
												t_1[s] = var149
												byteOffset = nil
												var154[2] = var149
												var154[4] = byteOffset
											end
											return "subpattern name already exists"
										end
										return "invalid character in subpattern"
									end
									return "unterminated parenthetical"
								end
								return "invalid character in subpattern"
							end
							return "subpattern name must not begin with a digit"
						end
						return "missing character in subpattern"
					end
					return "invalid group structure"
				elseif t_9[p65[var148]] then
				end
				return "invalid group structure"
			end
			return "unterminated parenthetical"
		else
			var149 += 1
			var154 = { 40, var149, nil, nil }
		end
	end
	var153 = 0
	
	for s, byteOffset in ipairs(t) do
		if type(byteOffset) ~= "table" or byteOffset[1] ~= 40 and (byteOffset[1] ~= "quantifier" or type(byteOffset[5]) ~= "table" or byteOffset[5][1] ~= 40) then
			if type(byteOffset) == "table" and (byteOffset[1] == "backref" or byteOffset[1] == "recurmatch") then
				if t_1[byteOffset[2]] or type(byteOffset[2]) == "number" and var149 >= byteOffset[2] then
					if byteOffset[1] == "recurmatch" and byteOffset[2] ~= 0 then
						for v, v_2 in ipairs(t) do
							if type(v_2) == "table" and v_2[1] == 40 and v_2[2] == byteOffset[2] then
								byteOffset[3] = v
								continue
							end
						end
					elseif type(byteOffset[2]) == "string" then
						byteOffset[2] = t_1[byteOffset[2]]
					end
				end
				return "reference to a non-existent or invalid subpattern"
			end
		end
		if byteOffset[1] == "quantifier" then
			byteOffset = byteOffset[5]
		end
		if byteOffset[3] then
			if byteOffset[2] then
				var153 = math.max(var153, byteOffset[2])
			end
		end
		return "unterminated parenthetical"
	end
	t.group_n = var153
	
	return t, t_1, t_2
end

if not tonumber(256) then
	error(string.format("expected number for options.cacheSize, got %s", "number"), 2)
end
local var47 = tonumber(256)
local list_4 = nil
local list_5 = nil

if var47 then
	if var47 < 0 or var47 ~= var47 then
		error("cache size cannot be a negative number or a NaN", 2)
	elseif var47 == 1e999 then
		list_4 = { nil }
		list_5 = { nil }
	elseif var47 >= 4294967296 then
		error("cache size too large", 2)
	else
		list_4 = table.create(256)
		list_5 = table.create(256)
	end
end
if var47 then
	function t.pruge() --[[ line: 1902 ]]
		-- upvalues: list_5 (write), list_4 (write)
		table.clear(list_5)
		table.clear(list_4)
	end
end
local function new_re(p67, p68, p69, p70) --[[ line: 1908 ]]
	-- upvalues: var47 (ref), list_4 (write), list_5 (write), tokenize_ptn (ref), tbl (ref), t_1 (write), re_tostr (ref), var4 (write)
	local var173, var174, var175
	local _ = nil
	local _ = nil
	local _ = nil
	local var168 = var47 and string.format("%s|%s", p67.s, p69)
	local var169 = var47 and list_4[table.find(list_5, var168)]
	
	if var169 then
		local unpacked, unpacked_1, unpacked_2 = table.unpack(var169, 1, 3)
		var173 = unpacked
		var174 = unpacked_1
		var175 = unpacked_2
	else
		local var170, var171, var172 = tokenize_ptn(p67, p68)
		var173 = var170
		var174 = var171
		var175 = var172
		
		if type(var173) == "string" then
			error(var173, 2)
		end
		if var47 and var173[1] then
			table.insert(list_5, 1, var168)
			table.insert(list_4, 1, { var173, var174, var175 })
			
			if var47 ~= 1e999 then
				table.remove(list_5, var47 + 1)
				table.remove(list_4, var47 + 1)
			end
		end
	end
	local var179 = newproxy(true)
	tbl[var179] = {
		name = "RegEx",
		flags = p68,
		flag_repr = p69,
		pattern_repr = p70,
		token = var173,
		group_id = var174,
		verb_flags = var175
	}
	local var180 = getmetatable(var179)
	var180.__index = setmetatable(p68, t_1)
	var180.__tostring = re_tostr
	var180.__metatable = var4
	
	return var179
end

local function escape_fslash(p71) --[[ line: 1939 ]]
	return (if #p71 % 2 == 0 then "\\" else "") .. p71 .. "."
end

local function sort_flag_chr(p72, p73) --[[ line: 1943 ]]
	return p72:lower() < p73:lower()
end

function t.new(...) --[[ line: 1947 ]]
	-- upvalues: t_3 (ref), sort_flag_chr (ref), new_re (ref), to_str_arr (ref), escape_fslash (ref)
	if select("#", ...) == 0 then
		error("missing argument #1 (string expected)", 2)
	end
	local var181, var182 = ...
	
	if type(var181) == "number" then
		var181 ..= ""
	elseif type(var181) ~= "string" then
		error(string.format("invalid argument #1 (string expected, got %s)", typeof(var181)), 2)
	end
	if type(var182) ~= "string" and type(var182) ~= "number" and var182 ~= nil then
		error(string.format("invalid argument #2 (string expected, got %s)", typeof(var182)), 2)
	end
	local t = {
		anchored = false,
		caseless = false,
		multiline = false,
		dotall = false,
		unicode = false,
		ungreedy = false,
		extended = false
	}
	local t_1 = {}
	
	for i in string.gmatch(var182 or "", utf8.charpattern) do
		if t[t_3[i]] ~= false then
			error("invalid regular expression flag " .. i, 3)
		end
		t[t_3[i]] = true
		table.insert(t_1, i)
	end
	table.sort(t_1, sort_flag_chr)
	
	return new_re(to_str_arr(var181), t, table.concat(t_1), string.format("/%s/", var181:gsub("(\\*)/", escape_fslash)))
end

function t.fromstring(...) --[[ line: 1977 ]]
	-- upvalues: to_str_arr (ref), t_3 (ref), sort_flag_chr (ref), new_re (ref)
	if select("#", ...) == 0 then
		error("missing argument #1 (string expected)", 2)
	end
	local var185 = ...
	
	if type(var185) == "number" then
		var185 ..= ""
	elseif type(var185) ~= "string" then
		error(string.format("invalid argument #1 (string expected, got %s)", typeof(var185), 2))
	end
	local var186 = to_str_arr(var185)
	local var187 = var186[1]
	
	if not var187 then
		error("empty regex", 2)
	elseif var187 == 92 or var187 >= 48 and var187 <= 57 or (var187 >= 65 and var187 <= 90 or var187 >= 97 and var187 <= 122) then
		error("delimiter must not be alphanumeric or a backslash", 2)
	end
	local var188 = 1
	local var189
	repeat
		var188 = table.find(var186, var187, var188 + 1)
		if not var188 then
			error(string.format("no ending delimiter ('%s') found", utf8.char(var187)), 2)
		end
		var189 = 1
		while var186[var188 - var189] == 92 do
			var189 += 1
		end
	until var189 % 2 == 1
	local t = {
		anchored = false,
		caseless = false,
		multiline = false,
		dotall = false,
		unicode = false,
		ungreedy = false,
		extended = false
	}
	local t_1 = {}
	while var188 < var186.n do
		local char = utf8.char(table.remove(var186))
		var186.n -= 1
		
		if t[t_3[char]] ~= false then
			error("invalid regular expression flag " .. char, 3)
		end
		t[t_3[char]] = true
		table.insert(t_1, char)
	end
	table.sort(t_1, sort_flag_chr)
	local joined = table.concat(t_1)
	table.remove(var186, 1)
	table.remove(var186)
	var186.n -= 2
	var186.s = string.sub(var186.s, 2, 1 + var186.n)
	
	return new_re(var186, t, joined, string.sub(var185, 1, 2 + var186.n))
end

local t_10 = {
	["\0"] = "\\x00",
	["\n"] = "\\n",
	["\t"] = "\\t",
	["\r"] = "\\r",
	["\f"] = "\\f"
}

function t.escape(...) --[[ line: 2033 ]]
	-- upvalues: t_10 (ref)
	if select("#", ...) == 0 then
		error("missing argument #1 (string expected)", 2)
	end
	local var194, var195, var196 = ...
	
	if type(var194) == "number" then
		var194 ..= ""
	elseif type(var194) ~= "string" then
		error(string.format("invalid argument #1 to 'escape' (string expected, got %s)", typeof(var194)), 2)
	end
	if var196 == nil then
		var196 = ""
	elseif type(var196) == "number" then
		var196 ..= ""
	elseif type(var196) ~= "string" then
		error(string.format("invalid argument #3 to 'escape' (string expected, got %s)", typeof(var196)), 2)
	end
	if utf8.len(var196) > 1 or var196:match("^[%a\\]$") then
		error("delimiter have not be alphanumeric", 2)
	end
	return string.gsub(var194, "[\0\f\n\r\t]", t_10):gsub(string.format("[\\%s#()%%%%*+.?[%%]^{|%s]", if var195 then "%s" else "", (if var196:find("^[%%%]]$") then "%" else "") .. var196), "\\%1")
end

function t.type(...) --[[ line: 2056 ]]
	-- upvalues: tbl (ref)
	if select("#", ...) == 0 then
		error("missing argument #1", 2)
	end
	return tbl[...] and tbl[...].name
end

for i, v in pairs(t_1) do
	t[i] = v
end
t_1 = { __index = t_1 }
var4 = t.fromstring("/The\\s*metatable\\s*is\\s*(?:locked|inaccessible)(?#Nice try :])/i")
getmetatable(var4).__metatable = var4

local function readonly_table() --[[ line: 2072 ]]
	error("Attempt to modify a readonly table", 2)
end

t.Match = setmetatable({}, {
	__index = t_2,
	__metatable = var4,
	__newindex = readonly_table
})

return setmetatable({}, {
	__index = t,
	__metatable = var4,
	__newindex = readonly_table
})