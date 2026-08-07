-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:58 2026 Pacific Standard Time.

local t = { cacheSize = 256, unicodeData = false }
local unicodecharCategory = t.unicodeData and require(script:WaitForChild("_unicodechar_category"))
local scripts = t.unicodeData and require(script:WaitForChild("_scripts"))
local xuc = t.unicodeData and require(script:WaitForChild("_xuc"))
local tbl = setmetatable({}, { __mode = "k" })
local t_1 = {}
local t_2 = {}
local t_3 = {}
local var8 = nil

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
	local var63 = 1
	
	for i = 1, ceiled do
		local packed = table.pack(utf8.codepoint(p0, utf8.offset(p0, i * 1999 - 1998), utf8.offset(p0, i * 1999 - (if i == ceiled then 1998 - ((charCount - 1) % 1999 + 1) else -1)) - 1))
		table.move(packed, 1, packed.n, var63, list)
		var63 += packed.n
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

local t_4 = {
	a = "anchored",
	i = "caseless",
	m = "multiline",
	s = "dotall",
	u = "unicode",
	U = "ungreedy",
	x = "extended"
}
local t_5 = {
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
local t_6 = {
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
local t_7 = {
	[98] = { 98, { "class", "word", false } },
	[66] = { 66, { "class", "word", false } },
	[75] = { 75 },
	[71] = { 71 },
	[74] = { 74 },
	[90] = { 90 },
	[122] = { 122 }
}
local t_8 = {
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
local t_9 = {
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
	-- upvalues: tbl (ref), t_1 (ref)
	return if p6 == "Match" then function(...) --[[ line: 152 ]]
		-- upvalues: tbl (copy), p7 (ref), p8 (ref)
		if select("#", ...) < 1 then
			error("missing argument #1 (Match expected)", 2)
		end
		local var77, var78 = ...
		
		if tbl[var77] and tbl[var77].name == "Match" then
			var77 = tbl[var77]
		else
			error(string.format("invalid argument #1 to %q (Match expected, got %s)", p7, typeof(var77)), 2)
		end
		if (p7 == "group" or p7 == "span") and var78 == nil then
			var78 = 0
		end
		return p8(var77, var78)
	end else function(...) --[[ line: 171 ]]
		-- upvalues: tbl (copy), p7 (ref), t_1 (copy), p8 (ref)
		local var69 = select("#", ...)
		
		if var69 < 1 then
			error("missing argument #1 (RegEx expected)", 2)
		elseif var69 < 2 then
			error("missing argument #2 (string expected)", 2)
		end
		local var70, var71, var72, var73, var74, var75 = ...
		
		if not tbl[var70] or tbl[var70].name ~= "RegEx" then
			if type(var70) ~= "string" and type(var70) ~= "number" then
				error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", p7, typeof(var70)), 2)
			end
			var70 = t_1.fromstring(var70)
		elseif p7 == "sub" then
			if type(var72) == "number" then
				var72 ..= ""
			elseif type(var72) ~= "string" then
				error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var72)), 2)
			end
		elseif type(var71) == "number" then
			var71 ..= ""
		elseif type(var71) ~= "string" then
			error(string.format("invalid argument #2 to %q (string expected, got %s)", p7, typeof(var71)), 2)
		end
		if p7 ~= "sub" and p7 ~= "split" then
			local var76 = typeof(var72)
			
			if var76 ~= "nil" then
				var72 = tonumber(var72)
				
				if var72 then
					var72 = if var72 < 0 then #var71 + math.floor(var72 + 0.5) + 1 else math.max(math.floor(var72 + 0.5), 1)
				else
					error(string.format("invalid argument #3 to %q (number expected, got %s)", p7, var76), 2)
				end
			end
		end
		var70 = tbl[var70]
		
		if p7 == "match" or p7 == "matchiter" then
			var73 = ...
		elseif p7 == "sub" then
			var75 = ...
		end
		return p8(var70, var71, var72, var73, var74, var75)
	end
end

local function match_tostr(p9) --[[ line: 219 ]]
	-- upvalues: tbl (ref)
	local spans = tbl[p9].spans
	local var79 = spans[0][1]
	local var80 = spans[0][2]
	
	if var80 <= var79 then
		return string.format("Match (%d..%d, empty)", var79, var80 - 1)
	end
	local format = string.format
	local var81 = "Match (%d..%d): %s"
	local var82 = var80 - 1
	local input = spans.input
	local byteOffset = utf8.offset(input, var80)
	
	return format(var81, var79, var82, string.sub(input, utf8.offset(input, var79), byteOffset and byteOffset - 1))
end

local function new_match(p10, p11, p12, p13) --[[ line: 228 ]]
	-- upvalues: var8 (write), t_3 (write), match_tostr (ref), tbl (ref)
	p10.source = p12
	p10.input = p13
	local var84 = newproxy(true)
	local var85 = getmetatable(var84)
	var85.__metatable = var8
	var85.__index = setmetatable(p10, t_3)
	var85.__tostring = match_tostr
	tbl[var84] = { name = "Match", spans = p10, group_id = p11 }
	
	return var84
end

local var23 = function(p14, p15) --[[ line: 240 ]]
	local var86 = p14.spans[if type(p15) == "number" then p15 else p14.group_id[p15]]
	
	if var86 then
		local input = p14.spans.input
		local byteOffset = utf8.offset(input, var86[2])
		
		return string.sub(input, utf8.offset(input, var86[1]), byteOffset and byteOffset - 1)
	end
	return nil
end

local var24 = "group"

function t_3.group(...) --[[ line: 152 ]]
	-- upvalues: tbl (ref), var24 (ref), var23 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var77, var78 = ...
	
	if tbl[var77] and tbl[var77].name == "Match" then
		var77 = tbl[var77]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var24, typeof(var77)), 2)
	end
	if (var24 == "group" or var24 == "span") and var78 == nil then
		var78 = 0
	end
	return var23(var77, var78)
end

local var25 = function(p16, p17) --[[ line: 248 ]]
	local var88 = p16.spans[if type(p17) == "number" then p17 else p16.group_id[p17]]
	
	if var88 then
		return var88[1], var88[2] - 1
	end
	return nil
end

local var26 = "span"

function t_3.span(...) --[[ line: 152 ]]
	-- upvalues: tbl (ref), var26 (ref), var25 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var77, var78 = ...
	
	if tbl[var77] and tbl[var77].name == "Match" then
		var77 = tbl[var77]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var26, typeof(var77)), 2)
	end
	if (var26 == "group" or var26 == "span") and var78 == nil then
		var78 = 0
	end
	return var25(var77, var78)
end

local var27 = function(p18) --[[ line: 256 ]]
	local spans = p18.spans
	
	if spans.n <= 0 then
		local input = spans.input
		local byteOffset = utf8.offset(input, spans[0][2])
		
		return string.sub(input, utf8.offset(input, spans[0][1]), byteOffset and byteOffset - 1)
	end
	local list = table.create(spans.n)
	
	for i = 0, spans.n do
		local var90 = spans[i]
		
		if var90 then
			local input = spans.input
			local byteOffset = utf8.offset(input, var90[2])
			list[i] = string.sub(input, utf8.offset(input, var90[1]), byteOffset and byteOffset - 1)
		end
	end
	return table.unpack(list, 1, spans.n)
end

local var28 = "groups"

function t_3.groups(...) --[[ line: 152 ]]
	-- upvalues: tbl (ref), var28 (ref), var27 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var77, var78 = ...
	
	if tbl[var77] and tbl[var77].name == "Match" then
		var77 = tbl[var77]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var28, typeof(var77)), 2)
	end
	if (var28 == "group" or var28 == "span") and var78 == nil then
		var78 = 0
	end
	return var27(var77, var78)
end

local var29 = function(p19) --[[ line: 271 ]]
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

local var30 = "groupdict"

function t_3.groupdict(...) --[[ line: 152 ]]
	-- upvalues: tbl (ref), var30 (ref), var29 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var77, var78 = ...
	
	if tbl[var77] and tbl[var77].name == "Match" then
		var77 = tbl[var77]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var30, typeof(var77)), 2)
	end
	if (var30 == "group" or var30 == "span") and var78 == nil then
		var78 = 0
	end
	return var29(var77, var78)
end

local var31 = function(p20) --[[ line: 283 ]]
	local spans = p20.spans
	local list = table.create(spans.n)
	
	for i = 0, spans.n do
		local var96 = spans[i]
		
		if var96 then
			local input = spans.input
			local byteOffset = utf8.offset(input, var96[2])
			list[i] = string.sub(input, utf8.offset(input, var96[1]), byteOffset and byteOffset - 1)
		end
	end
	list.n = spans.n
	
	return list
end

local var32 = "groupdict"

function t_3.grouparr(...) --[[ line: 152 ]]
	-- upvalues: tbl (ref), var32 (ref), var31 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var77, var78 = ...
	
	if tbl[var77] and tbl[var77].name == "Match" then
		var77 = tbl[var77]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var32, typeof(var77)), 2)
	end
	if (var32 == "group" or var32 == "span") and var78 == nil then
		var78 = 0
	end
	return var31(var77, var78)
end

local t_10 = {
	CR = 0,
	LF = 1,
	CRLF = 2,
	ANYRLF = 3,
	ANY = 4,
	NUL = 5
}

local function is_newline(p21, p22, p23) --[[ line: 300 ]]
	local newline = p23.newline
	local var98 = p21[p22]
	
	return if newline == 0 then var98 == 13 elseif newline == 2 then var98 == 10 and p21[p22 - 1] == 32 elseif newline == 3 then if var98 ~= 10 then var98 == 13 else true elseif newline == 4 then if var98 ~= 10 then if var98 ~= 11 then if var98 ~= 12 then if var98 ~= 13 then if var98 ~= 133 then if var98 ~= 8232 then var98 == 8233 else true else true else true else true else true else true elseif newline == 5 then var98 == 0 else var98 == 10
end

local function tkn_char_match(p24, p25, p26, p27, p28) --[[ line: 324 ]]
	-- upvalues: tkn_char_match (ref), unicodecharCategory (ref), t_9 (ref), xuc (ref), is_newline (ref)
	local v
	local var99 = p25[p26]
	
	if not var99 then
		return false
	elseif p27.ignoreCase and var99 >= 97 and var99 <= 122 then
		var99 -= 32
	end
	if type(p24) == "number" then
		return p24 == var99
	elseif p24[1] == "charset" then
		for i, v in ipairs(p24[3]) do
			if tkn_char_match(v, p25, p26, p27, p28) then
				return not p24[2]
			end
		end
		return p24[2]
	elseif p24[1] == "range" then
		return p24[2] <= var99 or p27.ignoreCase and (var99 >= 65 and (var99 <= 90 and (p24[2] <= var99 + 32 and var99 + 32 <= p24[3])))
	elseif p24[1] == "class" then
		local var100 = p24[2]
		local var101 = p24[3]
		local var102 = false
		
		if var100 == "xdigit" then
			var102 = var99 >= 48 or (var99 >= 65 or (var99 >= 97 and var99 <= 102))
		elseif var100 == "ascii" then
			local _ = var99 <= 127
		elseif var100 == "vertical_tab" then
			local var103
			if var99 >= 10 then
				var103 = true
				
				if var99 > 13 then
					var103 = if var99 ~= 8232 then var99 == 8233 else true
				end
				var102 = var103
			end
		elseif p27.unicode then
			local var104 = unicodecharCategory[var99] or "Cn"
			v = var104:sub(1, 1)
			
			if var100 == "alnum" then
				var102 = if v ~= "L" then if var104 ~= "Nl" then var104 == "Nd" else true else true
			elseif var100 == "alpha" then
				var102 = if v ~= "L" then var104 == "Nl" else true
			elseif var100 == "blank" then
				var102 = if var104 ~= "Zs" then var99 == 9 else true
			elseif var100 == "cntrl" then
				local _ = var104 == "Cc"
			elseif var100 == "digit" then
				local _ = var104 == "Nd"
			elseif var100 == "graph" then
				var102 = v ~= "P" and v ~= "C"
			elseif var100 == "lower" then
				local _ = var104 == "Ll"
			elseif var100 == "print" then
				local _ = v ~= "C"
			elseif var100 == "punct" then
				local _ = v == "P"
			elseif var100 == "space" then
				var102 = if v ~= "Z" then var99 >= 9 and var99 <= 13 else true
			elseif var100 == "upper" then
				local _ = var104 == "Lu"
			elseif var100 == "word" then
				var102 = if v ~= "L" then if var104 ~= "Nl" then if var104 ~= "Nd" then var104 == "Pc" else true else true else true
			end
		elseif var100 == "alnum" then
			var102 = var99 >= 48 or (var99 >= 65 or (var99 >= 97 and var99 <= 122))
		elseif var100 == "alpha" then
			var102 = var99 >= 65 or (var99 >= 97 and var99 <= 122)
		elseif var100 == "blank" then
			var102 = if var99 ~= 9 then var99 == 32 else true
		elseif var100 == "cntrl" then
			var102 = if var99 > 31 then var99 == 127 else true
		elseif var100 == "digit" then
			var102 = var99 >= 48 and var99 <= 57
		elseif var100 == "graph" then
			var102 = var99 >= 33 and var99 <= 126
		elseif var100 == "lower" then
			var102 = var99 >= 97 and var99 <= 122
		elseif var100 == "print" then
			var102 = var99 >= 32 and var99 <= 126
		elseif var100 == "punct" then
			var102 = t_9[var99]
		elseif var100 == "space" then
			var102 = var99 >= 9 or var99 == 32
		elseif var100 == "upper" then
			var102 = var99 >= 65 and var99 <= 90
		elseif var100 == "word" then
			var102 = var99 >= 48 or (var99 >= 65 or (var99 >= 97 or var99 == 95))
		end
		return if var101 then not var102 else var102
	elseif p24[1] == "category" then
		local var105 = unicodecharCategory[var99] or "Cn"
		local var106 = p24[3]
		local var106Count = #var106
		
		if var106Count == 3 then
			local var108 = false
			
			if var106 == "Xan" or var106 == "Xwd" then
				v = var105:find("^[LN]") or (var106 == "Xwd" and var99 == 95)
				var108 = v
			elseif var106 == "Xps" or var106 == "Xsp" then
				v = if var105:sub(1, 1) ~= "Z" then var99 >= 9 and var99 <= 13 else true
				var108 = v
			elseif var106 == "Xuc" then
				var108 = tkn_char_match(xuc, p25, p26, p27, p28)
			end
			return if p24[2] then not var108 else var108
		else
			return if var105:sub(1, var106Count) == var106 then not p24[2] else p24[2]
		end
	else
		return if p24[1] == 46 then p27.dotAll or not is_newline(p25, p26, p28) elseif p24[1] == 78 then not is_newline(p25, p26, p28) else p24[1] == 82 and (if p28.newline_seq == 0 then if var99 ~= 10 then var99 == 13 else true elseif var99 ~= 10 then if var99 ~= 11 then if var99 ~= 12 then if var99 ~= 13 then if var99 ~= 133 then if var99 ~= 8232 then var99 == 8233 else true else true else true else true else true else true)
	end
end

local function find_alternation(p29, p30, p31) --[[ line: 449 ]]
	-- upvalues: list_3 (ref)
	while true do
		local var109 = p29[p30]
		local isTable = type(var109) == "table"
		if var109 ~= list_3 then
			if isTable and var109[1] == 40 then
				if p31 then
					p31 += var109.count
				end
				p30 = var109[3]
				p30 += 1
			end
			if isTable and var109[1] == "quantifier" and (type(var109[5]) == "table" and var109[5][1] == 40) then
				if p31 then
					p31 += var109[5].count
				end
				p30 = var109[5][3]
			elseif var109 and (not isTable or var109[1] ~= 41) then
				if p31 then
					p31 = if isTable and var109[1] == "quantifier" then p31 + var109[3] else p31 + 1
				end
			end
			return nil, p31
		end
		return p30, p31
	end
end

local function re_rawfind(p32, p33, p34, p35, p36, p37) --[[ line: 478 ]]
	-- upvalues: find_alternation (ref), tkn_char_match (ref), is_newline (ref)
	local var115, var116, var117, var118, isTable, var120, v, i, substring, v_1
	local var111 = 0
	local var112 = p34
	local var113 = p34
	local t = {}
	while var111 do
		if var111 == 0 then
			var111 += 1
			var115 = find_alternation(p32, var111)
			
			if var115 then
				table.insert(t, 1, { "alternation", var115, var112 })
			end
		else
			var115 = p32[var111]
			var116 = type(var115) == "table" and var115[1]
			
			if not var115 then break end
			if var115 == "ACCEPT" then
				var117 = true
				var118 = var111
				repeat
					var118 += 1
					isTable = type(p32[var118]) == "table"
					var120 = p32[var118]
					if isTable and (var120[1] == 40 or var120[1] == "quantifier" and type(var120[5]) == "table" and var120[5][1] == 40) then
						var118 = if var120[1] == "quantifier" then var120[5][3] else var120[3]
					elseif isTable and var120[1] == 41 and (var120[4] == 33 or var120[4] == 61) then
						var117 = false
						var111 = var118
						break
					elseif var117 then break end
				until not var120
			elseif var115 == "PRUNE" or var115 == "SKIP" then
				table.insert(t, 1, { var115, var112 })
				var111 += 1
			elseif var116 == 40 then
				table.insert(t, 1, {
					"group", var111, var112, nil, var115[2], var115[3], var115[4]
				})
				var111 += 1
				isTable = var111
				
				if var115[4] ~= 33 then
					var120 = var115[4] == 61 and (var115[5] and 0)
				end
				var117, var118 = find_alternation(p32, isTable, var120)
				
				if var117 then
					table.insert(t, 1, { "alternation", var117, var112 })
				end
				if var118 then
					var112 -= var118
				end
			elseif var116 == 41 and var115[4] ~= 33 then
				if var115[4] == 33 or var115[4] == 61 then
					while true do
						var117 = nil
						var118 = table.remove(t, 1)
						if var118[1] ~= "group" or var118[2] ~= var115[3] then
							if var118[1] == "matchStart" and var115[4] == 61 then
								var117 = var118
							end
						end
						if var115[4] ~= 33 and var115[4] ~= 61 or var115[5] then break end
						var112 = var118[3]
						break
					end
				elseif var115[4] == 62 then
					repeat
						var117 = table.remove(t, 1)
					until not (var117 and (var117[1] ~= "group" or var117[2] ~= var115[3]))
				else
					for var120, i in ipairs(t) do
						if i[1] == "group" and i[2] == var115[3] then
							if i.jmp then
								var111 = i.jmp
							end
							i[4] = var112
							
							if i[7] ~= "quantifier" or i[10] + 1 >= i[9] then break end
							if p32[var115[3]][4] ~= "lazy" or i[10] + 1 < i[8] then
								var111 = var115[3]
							end
							v = p32[var115[3]]
							table.insert(t, 1, {
								"group", i[2], var112, nil, v[5][2], v[5][3], "quantifier", v[2], v[3],
								i[10] + 1, i[11], v[4]
							})
							
							if not i[11] then break end
							table.insert(t, 1, { "alternation", i[11], var112 })
							break
						end
					end
				end
				var111 += 1
				continue
			elseif var116 == 75 then
				table.insert(t, 1, { "matchStart", var112 })
				var111 += 1
			elseif var116 == 124 then
				var117 = var111
				repeat
					var117 += 1
					var118 = type(p32[var117]) == "table"
					isTable = p32[var117]
					if var118 and (isTable[1] == 40 or isTable[1] == "quantifier" and type(isTable[5]) == "table" and isTable[5][1] == 40) then
						var117 = if isTable[1] == "quantifier" then isTable[5][3] else isTable[3]
					end
				until not (var118 and isTable[1] == 41 or not isTable)
				if p32[var117] then
					for i, v in ipairs(t) do
						if v[1] == "group" and v[6] == var117 then
							var111 = v[6]
							continue
						end
					end
				else
					var111 = var117
				end
			elseif var116 == "recurmatch" then
				table.insert(t, 1, {
					"group",
					var115[3],
					var112,
					nil,
					nil,
					p32[var115[3]][3],
					nil,
					jmp = var111
				})
				var111 = var115[3] + 1
				var117, var118 = find_alternation(p32, var111)
				
				if var117 then
					table.insert(t, 1, { "alternation", var117, var112 })
				end
			else
				local var122, i_1
				var117 = nil
				
				if var115 == "FAIL" then
					var117 = false
				elseif var116 == 41 then
					repeat
						var118 = table.remove(t, 1)
					until not (var118[1] == "group" and var118[2] == var115[3])
				elseif var116 == "quantifier" then
					if type(var115[5]) == "table" and var115[5][1] == 40 then
						var118 = find_alternation(p32, var111 + 1)
						
						if var118 then
							table.insert(t, 1, { "alternation", var118, var112 })
						end
						table.insert(t, if var118 then 2 else 1, {
							"group", var111, var112, nil, var115[5][2], var115[5][3], "quantifier",
							var115[2], var115[3], 0, var118, var115[4]
						})
						
						if var115[4] == "lazy" and var115[2] == 0 then
							var111 = var115[5][3]
						end
						var117 = true
					else
						var118 = nil
						isTable = nil
						var120 = 1
						i = type(var115[5]) == "table" and var115[5][1] == "backref"
						
						if i then
							var120 = 0
							v = var115[5][2]
							
							for i_1, v_1 in ipairs(t) do
								if v_1[1] == "group" and v_1[5] == v then
									var118 = v_1[3]
									isTable = v_1[4]
									var120 = isTable - var118
									break
								end
							end
						end
						v = var112 + var115[2] * var120
						local var121 = 0
						while var121 < var115[3] do
							if i then
								if not var118 or not isTable then break end
								var122 = var112
								i_1 = p33.s
								local byteOffset = utf8.offset(i_1, isTable)
								substring = string.sub(i_1, utf8.offset(i_1, var118), byteOffset and byteOffset - 1)
								v_1 = p33.s
								local byteOffset_1 = utf8.offset(v_1, var112 + var120)
								
								if substring ~= string.sub(v_1, utf8.offset(v_1, var122), byteOffset_1 and byteOffset_1 - 1) then break end
								var112 += var120
								var121 += 1
							elseif tkn_char_match(var115[5], p33, var112, p35, p36) then
								continue
							else
								break
							end
						end
						var117 = var115[2] <= var121
						
						if var117 and var115[4] ~= "possessive" then
							if var115[4] == "lazy" then
								var122 = var112
								var112 = v
								v = var122
							end
							table.insert(t, 1, {
								"quantifier",
								var111,
								var112,
								math.min(v, p33.n + 1),
								(if var115[4] == "lazy" then 1 else -1) * var120
							})
						end
					end
				elseif var116 == "backref" then
					var118 = nil
					isTable = nil
					var120 = var115[2]
					
					for var122, substring in ipairs(t) do
						if substring[1] == "group" and substring[5] == var120 then
							var118 = substring[3]
							isTable = substring[4]
							break
						end
					end
					if var118 and isTable then
						i = var112
						var112 += isTable - var118
						local s = p33.s
						i_1 = utf8.offset(s, isTable)
						v = string.sub(s, utf8.offset(s, var118), i_1 and i_1 - 1)
						var122 = p33.s
						substring = utf8.offset(var122, var112)
						var117 = v == string.sub(var122, utf8.offset(var122, i), substring and substring - 1)
						var117 = nil
					end
				else
					var118 = p33[var112]
					
					if var116 == 36 or var116 == 90 or var116 == 122 then
						isTable = true
						
						if var112 ~= p33.n + 1 then
							if var116 == 36 and p35.multiline then
								isTable = is_newline(p33, var112 + 1, p36)
								
								if not isTable then
									isTable = var116 == 90 and (var112 == p33.n and is_newline(p33, var112, p36))
								end
							end
						end
						var117 = isTable
					elseif var116 == 94 or var116 == 65 or var116 == 71 then
						isTable = true
						
						if var112 ~= 1 then
							if var116 == 94 and p35.multiline then
								isTable = is_newline(p33, var112 - 1, p36)
								
								if not isTable then
									isTable = var116 == 71 and var112 == p34
								end
							end
						end
						var117 = isTable
					elseif var116 == 66 or var116 == 98 then
						isTable = if var112 ~= 1 then p35.multiline and is_newline(p33, var112 - 1, p36) else true
						var120 = if var112 ~= p33.n + 1 then p35.multiline and is_newline(p33, var112, p36) else true
						i = if tkn_char_match(var115[2], p33[var112 - 1], p35) then 0 else tkn_char_match(var115[2], var118, p35) and 1
						
						if i == 0 then
							v = var120 or not tkn_char_match(var115[2], var118, p35)
							var117 = v
						elseif i then
							v = isTable or not tkn_char_match(var115[2], p33[var112 - 1], p35)
							var117 = v
						end
						if var116 == 66 then
							var117 = not var117
						end
					else
						var117 = tkn_char_match(var115, p33, var112, p35, p36)
						var112 += 1
					end
				end
				if not var117 then
					while true do
						var118 = t[1] and t[1][1]
						isTable = t[1]
						if var118 and var118 ~= "PRUNE" and var118 ~= "SKIP" then
							if var118 ~= "alternation" then
								if var118 ~= "group" then
									if var118 ~= "quantifier" or math.sign(isTable[4] - isTable[3]) ~= math.sign(isTable[5]) then
										table.remove(t, 1)
										continue
									end
									isTable[3] += isTable[5]
									var111 = isTable[2]
									var112 = isTable[3]
									break
								elseif isTable[7] ~= "quantifier" then
									if isTable[7] ~= 33 then
										continue
									end
									table.remove(t, 1)
									var111 = isTable[6]
									var112 = isTable[3]
									break
								elseif isTable[12] == "greedy" and isTable[8] <= isTable[10] or isTable[12] == "lazy" and isTable[10] < isTable[9] and not isTable[13] then
									var111 = if isTable[12] == "greedy" then isTable[6] else isTable[2]
									var112 = isTable[3]
									
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
							var111 = isTable[2]
							var112 = isTable[3]
							var120, i = find_alternation(p32, var111 + 1)
							
							if var120 then
								isTable[2] = var120
							else
								table.remove(t, 1)
							end
							if not i then break end
							var112 -= i
							break
						end
						if var118 then
							table.clear(t)
						end
						if p33.n >= var113 then
							var113 = if var118 == "SKIP" then isTable[2] else var113 + 1
							var111 = 0
							var112 = var113
							break
						end
						return if p37 then false else nil
					end
				end
				var111 += 1
			end
		end
	end
	if p37 then
		return true
	end
	var115 = false
	var116 = table.create(p32.group_n)
	isTable = p32.group_n
	var116[0] = { var113, var112 }
	var116.n = isTable
	
	for var120, i in ipairs(t) do
		if i[1] == "matchStart" and not var115 then
			var115 = true
			var116[0][1] = i[2]
		elseif i[1] == "group" and i[5] and not var116[i[5]] then
			var116[i[5]] = { i[3], i[4] }
		end
	end
	return var116
end

local var38 = function(p38, p39, p40) --[[ line: 775 ]]
	-- upvalues: re_rawfind (ref), to_str_arr (ref)
	return re_rawfind(p38.token, to_str_arr(p39, p40), 1, p38.flags, p38.verb_flags, true)
end

local var39 = "test"

function t_2.test(...) --[[ line: 171 ]]
	-- upvalues: tbl (ref), var39 (ref), t_1 (ref), var38 (ref)
	local var69 = select("#", ...)
	
	if var69 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var69 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var70, var71, var72, var73, var74, var75 = ...
	
	if not tbl[var70] or tbl[var70].name ~= "RegEx" then
		if type(var70) ~= "string" and type(var70) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var39, typeof(var70)), 2)
		end
		var70 = t_1.fromstring(var70)
	elseif var39 == "sub" then
		if type(var72) == "number" then
			var72 ..= ""
		elseif type(var72) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var72)), 2)
		end
	elseif type(var71) == "number" then
		var71 ..= ""
	elseif type(var71) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var39, typeof(var71)), 2)
	end
	if var39 ~= "sub" and var39 ~= "split" then
		local var76 = typeof(var72)
		
		if var76 ~= "nil" then
			var72 = tonumber(var72)
			
			if var72 then
				var72 = if var72 < 0 then #var71 + math.floor(var72 + 0.5) + 1 else math.max(math.floor(var72 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var39, var76), 2)
			end
		end
	end
	var70 = tbl[var70]
	
	if var39 == "match" or var39 == "matchiter" then
		var73 = ...
	elseif var39 == "sub" then
		var75 = ...
	end
	return var38(var70, var71, var72, var73, var74, var75)
end

local var40 = function(p41, p42, p43, p44) --[[ line: 779 ]]
	-- upvalues: re_rawfind (ref), to_str_arr (ref), new_match (ref)
	local var126 = re_rawfind(p41.token, to_str_arr(p42, p43), 1, p41.flags, p41.verb_flags, false)
	
	return if var126 then new_match(var126, p41.group_id, p44, p42) else nil
end

local var41 = "match"

function t_2.match(...) --[[ line: 171 ]]
	-- upvalues: tbl (ref), var41 (ref), t_1 (ref), var40 (ref)
	local var69 = select("#", ...)
	
	if var69 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var69 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var70, var71, var72, var73, var74, var75 = ...
	
	if not tbl[var70] or tbl[var70].name ~= "RegEx" then
		if type(var70) ~= "string" and type(var70) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var41, typeof(var70)), 2)
		end
		var70 = t_1.fromstring(var70)
	elseif var41 == "sub" then
		if type(var72) == "number" then
			var72 ..= ""
		elseif type(var72) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var72)), 2)
		end
	elseif type(var71) == "number" then
		var71 ..= ""
	elseif type(var71) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var41, typeof(var71)), 2)
	end
	if var41 ~= "sub" and var41 ~= "split" then
		local var76 = typeof(var72)
		
		if var76 ~= "nil" then
			var72 = tonumber(var72)
			
			if var72 then
				var72 = if var72 < 0 then #var71 + math.floor(var72 + 0.5) + 1 else math.max(math.floor(var72 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var41, var76), 2)
			end
		end
	end
	var70 = tbl[var70]
	
	if var41 == "match" or var41 == "matchiter" then
		var73 = ...
	elseif var41 == "sub" then
		var75 = ...
	end
	return var40(var70, var71, var72, var73, var74, var75)
end

local var42 = function(p45, p46, p47, p48) --[[ line: 787 ]]
	-- upvalues: to_str_arr (ref), re_rawfind (ref), new_match (ref)
	p46 = to_str_arr(p46, p47)
	local var127 = 1
	
	return function() --[[ line: 790 ]]
		-- upvalues: var127 (write), p46 (write), re_rawfind (copy), p45 (ref), new_match (copy), p48 (ref)
		local var128 = var127 <= p46.n + 1 and re_rawfind(p45.token, p46, var127, p45.flags, p45.verb_flags, false)
		
		if var128 then
			var127 = var128[0][2] + (if var128[0][2] <= var128[0][1] then 1 else 0)
			
			return new_match(var128, p45.group_id, p48, p46.s)
		end
		return nil
	end
end

local var43 = "matchall"

function t_2.matchall(...) --[[ line: 171 ]]
	-- upvalues: tbl (ref), var43 (ref), t_1 (ref), var42 (ref)
	local var69 = select("#", ...)
	
	if var69 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var69 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var70, var71, var72, var73, var74, var75 = ...
	
	if not tbl[var70] or tbl[var70].name ~= "RegEx" then
		if type(var70) ~= "string" and type(var70) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var43, typeof(var70)), 2)
		end
		var70 = t_1.fromstring(var70)
	elseif var43 == "sub" then
		if type(var72) == "number" then
			var72 ..= ""
		elseif type(var72) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var72)), 2)
		end
	elseif type(var71) == "number" then
		var71 ..= ""
	elseif type(var71) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var43, typeof(var71)), 2)
	end
	if var43 ~= "sub" and var43 ~= "split" then
		local var76 = typeof(var72)
		
		if var76 ~= "nil" then
			var72 = tonumber(var72)
			
			if var72 then
				var72 = if var72 < 0 then #var71 + math.floor(var72 + 0.5) + 1 else math.max(math.floor(var72 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var43, var76), 2)
			end
		end
	end
	var70 = tbl[var70]
	
	if var43 == "match" or var43 == "matchiter" then
		var73 = ...
	elseif var43 == "sub" then
		var75 = ...
	end
	return var42(var70, var71, var72, var73, var74, var75)
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

local var45 = function(p53, p54, p55, p56, p57, p58) --[[ line: 824 ]]
	-- upvalues: to_str_arr (ref), t_6 (ref), re_rawfind (ref), insert_tokenized_sub (ref), new_match (ref), from_str_arr (ref)
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
	local var130 = type(p54)
	
	if var130 == "number" then
		p54 ..= ""
	elseif var130 ~= "string" and var130 ~= "function" and (not t.o or var130 ~= "table") then
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
	local list, var135, var136, var137, var141
	local var131 = 0
	
	if var130 == "string" then
		p54 = to_str_arr(p54)
		
		if not t.l then
			local var132 = 0
			list = table.create(3)
			local groupN = p53.token.group_n
			local t_1 = {}
			while var132 < p54.n do
				var135 = var132
				repeat
					var135 += 1
				until not (p54[var135] and (p54[var135] ~= 36 and p54[var135] ~= 92) and (p54[var135] ~= 58 and p54[var135] ~= 125 or not t_1[1]))
				local i_1
				var131 += var135 - var132 - 1
				
				if var135 - var132 > 1 then
					table.insert(list, table.move(p54, var132 + 1, var135 - 1, 1, table.create(var135 - var132 - 1)))
				end
				if p54[var135] == 58 then
					var136 = t_1[1]
					
					if var136[2] then
						error("malformed substitution pattern", 3)
					end
					var136[2] = table.move(list, var136[3], #list, 1, table.create(#list + 1 - var136[3]))
					
					for i_1 = #list, var136[3], -1 do
						list[i_1] = nil
					end
				elseif p54[var135] == 125 then
					local i_2
					var136 = table.remove(t_1, 1)
					var137 = table.move(list, var136[3], #list, 1, table.create(#list + 1 - var136[3]))
					
					for i_2 = #list, var136[3], -1 do
						list[i_2] = nil
					end
					i_2 = {}
					local var138 = "condition"
					local var139 = var136[1]
					local _ = false
					local var140 = var136[2]
					local _ = var140 == true and ((if var140 == true then var136[2] else nil) or var137)
					-- Unknown statement at pc 6: <SetList>
					table.insert(list, i_2)
				elseif p54[var135] then
					var135 += 1
					var136 = p54[var135]
					
					if not var136 then
						if p54[var135 - 1] == 92 then
							error("replacement string must not end with a trailing backslash", 3)
						end
						var137 = list[#list]
						
						if type(var137) == "table" then
							table.insert(var137, p54[var135 - 1])
						else
							table.insert(list, { p54[var135 - 1] })
						end
					elseif var136 == 92 and p54[var135 - 1] == 36 then
						var137 = list[#list]
						
						if type(var137) == "table" then
							table.insert(var137, 36)
						else
							table.insert(list, { 36 })
						end
						var135 -= 1
						var131 += 1
					elseif var136 == 48 then
						table.insert(list, 0)
					elseif var136 > 48 and var136 <= 57 then
						var137 = var135
						var141 = var136 - 48
						while p54[var135 + 1] and (p54[var135 + 1] >= 48 and p54[var135 + 1] <= 57) do
							var141 ..= p54[var135 + 1] - 48
							var135 += 1
						end
						var141 = tonumber(var141)
						
						if not t.u and groupN < var141 then
							error("reference to non-existent subpattern", 3)
						end
						table.insert(list, var141)
					elseif var136 == 123 and p54[var135 - 1] == 36 then
						var135 += 1
						var137 = var135
						while p54[var135] and (p54[var135] >= 48 and p54[var135] <= 57 or p54[var135] >= 65 and p54[var135] <= 90 or (p54[var135] >= 97 and p54[var135] <= 122 or p54[var135] == 95)) do
							var135 += 1
						end
						if (p54[var135] == 125 or p54[var135] == 58 and (p54[var135 + 1] == 43 or p54[var135 + 1] == 45)) and var135 ~= var137 then
							i_1 = p54.s
							local byteOffset = utf8.offset(i_1, var135)
							byteOffset = string.sub(i_1, utf8.offset(i_1, var137), byteOffset and byteOffset - 1)
							
							if p54[var137] >= 48 and p54[var137] <= 57 then
								var141 = tonumber(byteOffset)
								
								if not t.u and groupN < var141 then
									error("reference to non-existent subpattern", 3)
								end
							else
								var141 = p53.group_id[byteOffset]
								
								if not t.u and (not var141 or groupN < var141) then
									error("reference to non-existent subpattern", 3)
								end
							end
							if p54[var135] == 58 then
								var135 += 1
								table.insert(t_1, { var141, p54[var135] == 45, #list + 1 })
							else
								table.insert(list, var141)
							end
						else
							error("malformed substitution pattern", 3)
						end
					else
						var137 = nil
						
						if p54[var135 - 1] ~= 36 then
							var137 = t_6[p54[var135]]
							
							if type(var137) ~= "number" then
								var137 = nil
							end
						elseif var136 ~= 36 then
							var141 = list[#list]
							
							if type(var141) == "table" then
								table.insert(var141, 36)
							else
								table.insert(list, { 36 })
							end
						end
						var141 = list[#list]
						
						if type(var141) == "table" then
							table.insert(var141, var137 or p54[var135])
						else
							table.insert(list, { var137 or p54[var135] })
						end
						var131 += 1
					end
				end
				var132 = var135
			end
			if t_1[1] then
				error("malformed substitution pattern", 3)
			end
			if list[2] or type(list[1]) ~= "table" or list[1][1] == "condition" then
				p54 = list
				var130 = "subst_string"
			else
				var135 = list[1]
				p54.n = #list[1]
				p54 = var135
			end
		end
	end
	local var143 = to_str_arr(p55)
	var143 = 0
	list = 1
	local var144 = 0
	repeat
		if list > var143.n + var143 + 1 then break end
		local var145 = re_rawfind(p53.token, var143, list, p53.flags, p53.verb_flags, false)
		
		if not var145 then break end
		local byteOffset
		var135 = nil
		
		if var130 == "string" then
			var135 = p54
		elseif var130 == "subst_string" then
			var135 = insert_tokenized_sub(table.create(var131), var143, var145, p54)
		else
			var136 = nil
			var137 = nil
			
			if var130 == "table" then
				var141 = var143.s
				byteOffset = utf8.offset(var141, var145[0][2])
				var136 = string.sub(var141, utf8.offset(var141, var145[0][1]), byteOffset and byteOffset - 1)
				var137 = p54[var136]
			else
				var136 = new_match(var145, p53.group_id, p58, var143.s)
				var137 = p54(var136)
			end
			if var137 == var136 or t.o and not var137 then
				var141 = var145[0][2] - var145[0][1]
				var135 = table.move(var143, var145[0][1], var145[0][2] - 1, 1, table.create(var141))
				var135.n = var141
			elseif type(var137) == "string" then
				var135 = to_str_arr(var137)
			elseif type(var137) == "number" then
				var135 = to_str_arr(var137 .. "")
			elseif t.o then
				error(string.format("invalid replacement value (a %s)", type(var137)), 3)
			else
				var135 = { n = 0 }
			end
		end
		var136 = var145[0][2] - var145[0][1]
		var137 = math.min(var135.n, var136)
		
		for byteOffset = 0, var137 - 1 do
			var143[var145[0][1] + byteOffset] = var135[byteOffset + 1]
		end
		var141 = var145[0][1] + var137
		list = var145[0][2]
		
		if var135.n < var136 then
			for _ = 1, var136 - var135.n do
				table.remove(var143, var141)
				var143 -= 1
				list -= 1
			end
		elseif var136 < var135.n then
			for i_3 = 1, var135.n - var136 do
				table.insert(var143, var141 + i_3 - 1, var135[var137 + i_3])
				var143 += 1
				list += 1
			end
		end
		if var136 <= 0 then
			list += 1
		end
		var144 += 1
	until p56 < var144 + 1
	return from_str_arr(var143), var144
end

local var46 = "sub"

function t_2.sub(...) --[[ line: 171 ]]
	-- upvalues: tbl (ref), var46 (ref), t_1 (ref), var45 (ref)
	local var69 = select("#", ...)
	
	if var69 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var69 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var70, var71, var72, var73, var74, var75 = ...
	
	if not tbl[var70] or tbl[var70].name ~= "RegEx" then
		if type(var70) ~= "string" and type(var70) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var46, typeof(var70)), 2)
		end
		var70 = t_1.fromstring(var70)
	elseif var46 == "sub" then
		if type(var72) == "number" then
			var72 ..= ""
		elseif type(var72) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var72)), 2)
		end
	elseif type(var71) == "number" then
		var71 ..= ""
	elseif type(var71) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var46, typeof(var71)), 2)
	end
	if var46 ~= "sub" and var46 ~= "split" then
		local var76 = typeof(var72)
		
		if var76 ~= "nil" then
			var72 = tonumber(var72)
			
			if var72 then
				var72 = if var72 < 0 then #var71 + math.floor(var72 + 0.5) + 1 else math.max(math.floor(var72 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var46, var76), 2)
			end
		end
	end
	var70 = tbl[var70]
	
	if var46 == "match" or var46 == "matchiter" then
		var73 = ...
	elseif var46 == "sub" then
		var75 = ...
	end
	return var45(var70, var71, var72, var73, var74, var75)
end

local var47 = function(p59, p60, p61) --[[ line: 1062 ]]
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
	local var147 = to_str_arr(p60)
	var147 = 1
	local var148 = 0
	local t = {}
	local var150 = 0
	while var147 <= var147.n + 1 do
		var148 += 1
		local var151 = var148 <= p61 and re_rawfind(p59.token, var147, var147, p59.flags, p59.verb_flags, false)
		
		if not var151 then break end
		local s = var147.s
		local byteOffset = utf8.offset(s, var151[0][1])
		table.insert(t, string.sub(s, utf8.offset(s, var147 - var150), byteOffset and byteOffset - 1))
		var150 = if var151[0][2] <= var151[0][1] then 1 else 0
		var147 = var151[0][2] + var150
	end
	table.insert(t, string.sub(var147.s, utf8.offset(var147.s, var147 - var150)))
	
	return t
end

local var48 = "split"

function t_2.split(...) --[[ line: 171 ]]
	-- upvalues: tbl (ref), var48 (ref), t_1 (ref), var47 (ref)
	local var69 = select("#", ...)
	
	if var69 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var69 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var70, var71, var72, var73, var74, var75 = ...
	
	if not tbl[var70] or tbl[var70].name ~= "RegEx" then
		if type(var70) ~= "string" and type(var70) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var48, typeof(var70)), 2)
		end
		var70 = t_1.fromstring(var70)
	elseif var48 == "sub" then
		if type(var72) == "number" then
			var72 ..= ""
		elseif type(var72) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var72)), 2)
		end
	elseif type(var71) == "number" then
		var71 ..= ""
	elseif type(var71) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var48, typeof(var71)), 2)
	end
	if var48 ~= "sub" and var48 ~= "split" then
		local var76 = typeof(var72)
		
		if var76 ~= "nil" then
			var72 = tonumber(var72)
			
			if var72 then
				var72 = if var72 < 0 then #var71 + math.floor(var72 + 0.5) + 1 else math.max(math.floor(var72 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var48, var76), 2)
			end
		end
	end
	var70 = tbl[var70]
	
	if var48 == "match" or var48 == "matchiter" then
		var73 = ...
	elseif var48 == "sub" then
		var75 = ...
	end
	return var47(var70, var71, var72, var73, var74, var75)
end

local _ = function(p62, p63) --[[ line: 1092 | named "re_index" ]]
	-- upvalues: t_2 (write), tbl (ref)
	return t_2[p63] or tbl[p62].flags[p63]
end

local function re_tostr(p64) --[[ line: 1096 ]]
	-- upvalues: tbl (ref)
	return tbl[p64].pattern_repr .. tbl[p64].flag_repr
end

local t_11 = {
	[58] = true,
	[33] = true,
	[61] = true,
	[62] = true,
	[124] = true
}

local function tokenize_ptn(p65, p66) --[[ line: 1112 ]]
	-- upvalues: t (ref), t_10 (ref), t_11 (ref), list_3 (ref), list_1 (ref), t_6 (ref), t_5 (ref), t_8 (ref), scripts (ref), t_7 (ref), list_2 (ref), list (ref)
	if p66.unicode and not t.unicodeData then
		return "options.unicodeData cannot be turned off while having unicode flag"
	end
	local var153 = 1
	local n = p65.n
	local var154 = 0
	local t_1 = {}
	local t_2 = {}
	local t_3 = { newline = 1, newline_seq = 1, not_empty = 0 }
	local var158, byteOffset, v
	while var153 <= n do
		local var159, var160, s, substring, s_1, byteOffset_1, i
		var158 = p65[var153]
		
		if var158 ~= 40 then
			if var158 ~= 41 then
				if var158 == 46 then
					table.insert(t_1, list_1)
				elseif var158 ~= 91 then
					if var158 == 92 then
						var153 += 1
						var159 = p65[var153]
						
						if var159 then
							if var159 >= 48 and var159 <= 57 then
								var160 = var153
								while p65[var153 + 1] and (p65[var153 + 1] >= 48 and p65[var153 + 1] <= 57) do
									var153 += 1
								end
								byteOffset = p65.s
								byteOffset_1 = utf8.offset(byteOffset, var153 + 1)
								substring = tonumber(string.sub(byteOffset, utf8.offset(byteOffset, var160), byteOffset_1 and byteOffset_1 - 1))
								
								if var154 < substring and var153 ~= var160 then
									var153 = var160
									s = nil
									byteOffset = nil
									s_1 = nil
									
									if p65[var153] <= 55 then
										s = p65[var153] - 48
										var153 += 1
										
										if p65[var153] and p65[var153] >= 48 and p65[var153] <= 55 then
											byteOffset = p65[var153] - 48
											var153 += 1
											
											if p65[var153] and p65[var153] >= 48 and p65[var153] <= 55 then
												s_1 = p65[var153] - 48
											else
												var153 -= 1
											end
										else
											var153 -= 1
										end
									end
									if s and byteOffset then
										v = if s_1 then 64 * s + 8 * byteOffset + s_1 else 8 * s + byteOffset or (s or p65[var160])
									end
									table.insert(t_1, v)
								else
									table.insert(t_1, { "backref", substring })
								end
							elseif var159 ~= 69 then
								if var159 == 81 then
									var160 = var153 + 1
									repeat
										var153 = table.find(p65, 92, var153 + 1)
									until not (var153 and p65[var153 + 1] ~= 69)
									table.move(p65, var160, if var153 then var153 - 1 else #p65, #t_1 + 1, t_1)
									
									if not var153 then break end
									var153 += 1
								elseif var159 == 78 then
									if p65[var153 + 1] == 123 and p65[var153 + 2] == 85 and (p65[var153 + 3] == 43 and p66.unicode) then
										var153 += 4
										var160 = var153
										while p65[var153] and (p65[var153] >= 48 and p65[var153] <= 57 or p65[var153] >= 65 and p65[var153] <= 70 or p65[var153] >= 97 and p65[var153] <= 102) do
											var153 += 1
										end
										if p65[var153] == 125 and var153 ~= var160 then
											byteOffset = p65.s
											byteOffset_1 = utf8.offset(byteOffset, var153)
											table.insert(t_1, tonumber(string.sub(byteOffset, utf8.offset(byteOffset, var160), byteOffset_1 and byteOffset_1 - 1)))
										end
										return "malformed Unicode code point"
									else
										table.insert(t_1, t_6[78])
									end
								elseif var159 == 80 or var159 == 112 then
									if t.unicodeData then
										var153 += 1
										
										if p65[var153] == 123 then
											var160 = var159 == 80
											var153 += 1
											
											if p65[var153] == 94 then
												var153 += 1
												var160 = not var160
											end
											substring = var153
											while p65[var153] and (p65[var153] >= 48 and p65[var153] <= 57 or p65[var153] >= 65 and p65[var153] <= 90 or (p65[var153] >= 97 and p65[var153] <= 122 or p65[var153] == 95)) do
												var153 += 1
											end
											if p65[var153] == 125 then
												byteOffset = p65.s
												byteOffset_1 = utf8.offset(byteOffset, var153)
												s = string.sub(byteOffset, utf8.offset(byteOffset, substring), byteOffset_1 and byteOffset_1 - 1)
												byteOffset = scripts[s]
												
												if byteOffset then
													table.insert(t_1, { "charset", var160, byteOffset })
												elseif t_8[s] then
													table.insert(t_1, { "category", var160, s })
												end
												return "unknown or malformed script name"
											end
											return "unknown or malformed script name"
										else
											var160 = utf8.char(p65[var153] or 0)
											
											if t_8[var160] then
												table.insert(t_1, { "category", false, var160 })
											end
											return "unknown or malformed script name"
										end
									end
									return "options.unicodeData cannot be turned off when using \\p"
								elseif var159 == 103 and (p65[var153 + 1] == 123 or p65[var153 + 1] >= 48 and p65[var153 + 1] <= 57) then
									var160 = false
									var153 += 1
									
									if p65[var153] == 123 then
										var153 += 1
										var160 = true
									elseif p65[var153] >= 48 and p65[var153] <= 57 then
										substring = var153
										while p65[var153] and (p65[var153] >= 48 and p65[var153] <= 57 or p65[var153] >= 65 and p65[var153] <= 70 or p65[var153] >= 97 and p65[var153] <= 102) do
											var153 += 1
										end
										if not var160 or p65[var153] == 125 then
											s_1 = p65.s
											i = utf8.offset(s_1, var153 + (if var160 then 0 else 1))
											table.insert(t_1, {
												"backref",
												tonumber(string.sub(s_1, utf8.offset(s_1, substring), i and i - 1))
											})
											
											if not var160 then
												var153 -= 1
											end
										end
										return "malformed reference code"
									end
									return "malformed reference code"
								elseif var159 == 111 then
									var153 += 1
									
									if p65[var153 + 1] == 123 then
										var153 += 1
										var160 = var153
										while p65[var153] and (p65[var153] >= 48 and p65[var153] <= 55) do
											var153 += 1
										end
										if p65[var153] == 125 and var153 ~= var160 then
											byteOffset = p65.s
											byteOffset_1 = utf8.offset(byteOffset, var153)
											substring = tonumber(string.sub(byteOffset, utf8.offset(byteOffset, var160), byteOffset_1 and byteOffset_1 - 1), 8)
											
											if substring <= 65535 then
												table.insert(t_1, substring)
											end
											return "character offset too large"
										end
										return "malformed octal code"
									end
									return "malformed octal code"
								elseif var159 == 120 then
									var160 = nil
									substring = nil
									var153 += 1
									
									if p65[var153] == 123 then
										var153 += 1
										s = var153
										while p65[var153] and (p65[var153] >= 48 and p65[var153] <= 57 or p65[var153] >= 65 and p65[var153] <= 70 or p65[var153] >= 97 and p65[var153] <= 102) do
											var153 += 1
										end
										if p65[var153] == 125 and var153 ~= s then
											if var153 - s <= 4 then
												v = p65.s
												local byteOffset_2 = utf8.offset(v, var153)
												table.insert(t_1, tonumber(string.sub(v, utf8.offset(v, s), byteOffset_2 and byteOffset_2 - 1), 16))
											end
											return "character offset too large"
										end
										return "malformed hexadecimal code"
									elseif p65[var153] and (p65[var153] >= 48 and p65[var153] <= 57 or p65[var153] >= 65 and p65[var153] <= 70 or p65[var153] >= 97 and p65[var153] <= 102) then
										s = p65[var153]
										byteOffset = if p65[var153] >= 65 and p65[var153] <= 90 then 55 elseif p65[var153] >= 97 and p65[var153] <= 122 then 87 else 48
										var160 = s - byteOffset
										var153 += 1
										
										if p65[var153] and (p65[var153] >= 48 and p65[var153] <= 57 or p65[var153] >= 65 and p65[var153] <= 70 or p65[var153] >= 97 and p65[var153] <= 102) then
											s = p65[var153]
											byteOffset = if p65[var153] >= 65 and p65[var153] <= 90 then 55 elseif p65[var153] >= 97 and p65[var153] <= 122 then 87 else 48
											substring = s - byteOffset
										else
											var153 -= 1
										end
									else
										var153 -= 1
									end
									if var160 then
										s_1 = if substring then 16 * var160 + substring else var160 or 0
									end
									table.insert(t_1, s_1)
								else
									table.insert(t_1, t_7[var159] or t_6[var159] or var159)
								end
							end
						end
						return "pattern may not end with a trailing backslash"
					elseif var158 == 42 or var158 == 43 or (var158 == 63 or var158 == 123) then
						var159 = nil
						var160 = nil
						
						if var158 == 123 then
							substring = var153 + 1
							s = nil
							while p65[var153 + 1] and (p65[var153 + 1] >= 48 and p65[var153 + 1] <= 57 or p65[var153 + 1] == 44 and not s and var153 + 1 ~= substring) do
								var153 += 1
								
								if p65[var153] == 44 then
									s = var153
								end
							end
							if p65[var153 + 1] == 125 then
								var153 += 1
								
								if s then
									byteOffset_1 = p65.s
									i = utf8.offset(byteOffset_1, s)
									var159 = tonumber(string.sub(byteOffset_1, utf8.offset(byteOffset_1, substring), i and i - 1))
									
									if s + 1 == var153 then
										byteOffset = 1e999
									else
										byteOffset_1 = p65.s
										v = utf8.offset(byteOffset_1, var153)
										byteOffset = tonumber(string.sub(byteOffset_1, utf8.offset(byteOffset_1, s + 1), v and v - 1))
									end
									var160 = byteOffset
									
									if var160 >= var159 then
										if var159 then
											substring = if p66.ungreedy then "lazy" else "greedy"
											
											if p65[var153 + 1] == 43 or p65[var153 + 1] == 63 then
												var153 += 1
												substring = if p65[var153] == 43 then "possessive" elseif p66.ungreedy then "greedy" else "lazy"
											end
											s = #t_1
											byteOffset = t_1[s]
											
											if byteOffset and (type(byteOffset) ~= "table" or byteOffset[1] ~= "quantifier" and byteOffset[1] ~= 40 and not t_7[byteOffset[1]]) and (byteOffset ~= list_3 and type(byteOffset) ~= "string") then
												if var160 == 0 then
													table.remove(t_1)
												elseif var159 ~= 1 or var160 ~= 1 then
													if type(byteOffset) == "table" and byteOffset[1] == 41 then
														s = byteOffset[3]
													end
													t_1[s] = {
														"quantifier",
														var159,
														var160,
														substring,
														t_1[s]
													}
												end
											end
											return "quantifier doesn't follow a repeatable pattern"
										end
									end
									return "numbers out of order in {} quantifier"
								else
									byteOffset_1 = p65.s
									i = utf8.offset(byteOffset_1, var153)
									var159 = tonumber(string.sub(byteOffset_1, utf8.offset(byteOffset_1, substring), i and i - 1))
									var160 = var159
								end
							else
								table.move(p65, substring - 1, var153, #t_1 + 1, t_1)
							end
						else
							var159 = if var158 == 43 then 1 else 0
							var160 = if var158 == 63 then 1 else 1e999
						end
					elseif var158 == 124 then
						table.insert(t_1, list_3)
						var159 = #t_1
						repeat
							var159 -= 1
							var160 = t_1[var159]
							substring = type(t_1[var159]) == "table"
							if substring and var160[1] == 41 then
								var159 = t_1[var159][3]
							elseif substring and var160[1] == 40 then
								if var160[4] ~= 124 then break end
								var154 = var160[5]
								break
						until not var160
					elseif var158 == 36 or var158 == 94 then
						table.insert(t_1, if var158 == 94 then list_2 else list)
					elseif p66.ignoreCase and var158 >= 97 and var158 <= 122 then
						table.insert(t_1, var158 - 32)
					elseif not p66.extended or (var158 < 9 or var158 > 13) and (var158 ~= 32 and var158 ~= 35) then
						table.insert(t_1, var158)
					elseif var158 == 35 then
						repeat
							var153 += 1
						until not (p65[var153] and p65[var153] ~= 10 and p65[var153] ~= 13)
					end
				end
				var159 = false
				var160 = nil
				var153 += 1
				substring = var153
				
				if p65[var153] == 94 then
					var159 = true
					var153 += 1
				elseif p65[var153] == 46 or p65[var153] == 58 or p65[var153] == 61 then
					var160 = p65[var153]
				end
				s = nil
				
				if p65[var153] == 91 or p65[var153] == 92 then
					s = {}
				else
					s = { p65[var153] }
					var153 += 1
				end
				while p65[var153] ~= 93 do
					if p65[var153] then
						if p65[var153] == 45 and s[1] and type(s[1]) == "number" then
							if p65[var153 + 1] == 93 then
								table.insert(s, 1, 45)
							else
								var153 += 1
								byteOffset = p65[var153]
								
								if byteOffset == 91 then
									if p65[var153 + 1] == 46 or p65[var153 + 1] == 58 or p65[var153 + 1] == 61 then
										s_1 = var153 + 2
										repeat
											s_1 = table.find(p65, 93, s_1)
										until not (s_1 and p65[s_1 - 1] == 92)
										if s_1 then
											if p65[s_1 - 1] ~= p65[var153 + 1] or s_1 - 1 == var153 + 1 then
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
									var153 += 1
									
									if p65[var153] == 120 then
										s_1 = nil
										byteOffset_1 = nil
										var153 += 1
										
										if p65[var153] and p65[var153] >= 48 and p65[var153] <= 57 or (p65[var153] >= 65 and p65[var153] <= 70 or p65[var153] >= 97 and p65[var153] <= 102) then
											i = p65[var153]
											v = if p65[var153] >= 65 and p65[var153] <= 90 then 55 elseif p65[var153] >= 97 and p65[var153] <= 122 then 87 else 48
											s_1 = i - v
											var153 += 1
											
											if p65[var153] and p65[var153] >= 48 and p65[var153] <= 57 or (p65[var153] >= 65 and p65[var153] <= 70 or p65[var153] >= 97 and p65[var153] <= 102) then
												i = p65[var153]
												v = if p65[var153] >= 65 and p65[var153] <= 90 then 55 elseif p65[var153] >= 97 and p65[var153] <= 122 then 87 else 48
												byteOffset_1 = i - v
											else
												var153 -= 1
											end
										else
											var153 -= 1
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
									elseif p65[var153] >= 48 and p65[var153] <= 55 then
										s_1 = p65[var153] - 48
										byteOffset_1 = nil
										i = nil
										var153 += 1
										
										if p65[var153] and p65[var153] >= 48 and p65[var153] <= 55 then
											byteOffset_1 = p65[var153] - 48
											var153 += 1
											
											if p65[var153] and p65[var153] >= 48 and p65[var153] <= 55 then
												i = p65[var153] - 48
											else
												var153 -= 1
											end
										else
											var153 -= 1
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
										byteOffset = t_6[p65[var153]] or p65[var153]
										
										if type(byteOffset) == "number" then
										end
										return "invalid range in character class"
									end
								elseif byteOffset >= s[1] then
								end
								return "invalid range in character class"
							end
						elseif p65[var153] == 91 then
							if p65[var153 + 1] == 46 or p65[var153 + 1] == 58 or p65[var153 + 1] == 61 then
								byteOffset = var153 + 2
								repeat
									byteOffset = table.find(p65, 93, byteOffset)
								until not (byteOffset and p65[byteOffset - 1] == 92)
								if byteOffset then
									if p65[byteOffset - 1] == p65[var153 + 1] and byteOffset - 1 ~= var153 + 1 then
										if p65[byteOffset - 1] ~= 46 and p65[byteOffset - 1] ~= 61 then
											if p65[byteOffset - 1] == 58 then
												s_1 = p65[var153 + 3] == 94
												i = p65.s
												local byteOffset_2 = utf8.offset(i, byteOffset - 1)
												byteOffset_1 = string.sub(i, utf8.offset(i, var153 + (if s_1 then 3 else 2)), byteOffset_2 and byteOffset_2 - 1)
												
												if t_5[byteOffset_1] then
													table.insert(s, 1, { "class", byteOffset_1, s_1 })
													var153 = byteOffset
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
						elseif p65[var153] == 92 then
							var153 += 1
							
							if p65[var153] == 120 then
								byteOffset = nil
								s_1 = nil
								var153 += 1
								
								if p65[var153] == 123 then
									var153 += 1
									byteOffset_1 = var153
									while p65[var153] and (p65[var153] >= 48 and p65[var153] <= 57 or p65[var153] >= 65 and p65[var153] <= 70 or p65[var153] >= 97 and p65[var153] <= 102) do
										var153 += 1
									end
									if p65[var153] == 125 and var153 ~= byteOffset_1 then
										if var153 - byteOffset_1 <= 4 then
											local var165 = 1
											local s_2 = p65.s
											local byteOffset_2 = utf8.offset(s_2, var153)
											table.insert(s, var165, tonumber(string.sub(s_2, utf8.offset(s_2, byteOffset_1), byteOffset_2 and byteOffset_2 - 1), 16))
											continue
										end
										return "character offset too large"
									end
									return "malformed hexadecimal character"
								elseif p65[var153] and p65[var153] >= 48 and p65[var153] <= 57 or (p65[var153] >= 65 and p65[var153] <= 70 or p65[var153] >= 97 and p65[var153] <= 102) then
									byteOffset_1 = p65[var153]
									i = if p65[var153] >= 65 and p65[var153] <= 90 then 55 elseif p65[var153] >= 97 and p65[var153] <= 122 then 87 else 48
									byteOffset = byteOffset_1 - i
									var153 += 1
									
									if p65[var153] and p65[var153] >= 48 and p65[var153] <= 57 or (p65[var153] >= 65 and p65[var153] <= 70 or p65[var153] >= 97 and p65[var153] <= 102) then
										byteOffset_1 = p65[var153]
										i = if p65[var153] >= 65 and p65[var153] <= 90 then 55 elseif p65[var153] >= 97 and p65[var153] <= 122 then 87 else 48
										s_1 = byteOffset_1 - i
									else
										var153 -= 1
									end
								else
									var153 -= 1
								end
								local var167
								v = 1
								
								if byteOffset then
									var167 = if s_1 then 16 * byteOffset + s_1 else byteOffset or 0
								end
								table.insert(s, v, var167)
							elseif p65[var153] >= 48 and p65[var153] <= 55 then
								byteOffset = p65[var153] - 48
								s_1 = nil
								byteOffset_1 = nil
								var153 += 1
								
								if p65[var153] and p65[var153] >= 48 and p65[var153] <= 55 then
									s_1 = p65[var153] - 48
									var153 += 1
									
									if p65[var153] and p65[var153] >= 48 and p65[var153] <= 55 then
										byteOffset_1 = p65[var153] - 48
									else
										var153 -= 1
									end
								else
									var153 -= 1
								end
								local var172
								local var171 = 1
								
								if s_1 then
									var172 = if byteOffset_1 then 64 * byteOffset + 8 * s_1 + byteOffset_1 else 8 * byteOffset + s_1 or byteOffset
								end
								table.insert(s, var171, var172)
							elseif p65[var153] == 69 then
								var153 += 1
								continue
							elseif p65[var153] == 81 then
								byteOffset = var153 + 1
								repeat
									var153 = table.find(p65, 92, var153 + 1)
								until not (var153 and p65[var153 + 1] ~= 69)
								table.move(p65, byteOffset, if var153 then var153 - 1 else #p65, #t_1 + 1, t_1)
								
								if not var153 then break end
								var153 += 1
							elseif p65[var153] == 78 then
								if p65[var153 + 1] == 123 and p65[var153 + 2] == 85 and (p65[var153 + 3] == 43 and p66.unicode) then
									var153 += 4
									byteOffset = var153
									while p65[var153] and (p65[var153] >= 48 and p65[var153] <= 57 or p65[var153] >= 65 and p65[var153] <= 70 or p65[var153] >= 97 and p65[var153] <= 102) do
										var153 += 1
									end
									if p65[var153] == 125 and var153 ~= byteOffset then
										i = p65.s
										local byteOffset_2 = utf8.offset(i, var153)
										table.insert(s, 1, tonumber(string.sub(i, utf8.offset(i, byteOffset), byteOffset_2 and byteOffset_2 - 1)))
										continue
									end
									return "malformed Unicode code point"
								end
								return "invalid escape sequence"
							elseif p65[var153] == 80 or p65[var153] == 112 then
								if t.unicodeData then
									var153 += 1
									
									if p65[var153] == 123 then
										byteOffset = p65[var153] == 80
										var153 += 1
										
										if p65[var153] == 94 then
											var153 += 1
											byteOffset = not byteOffset
										end
										s_1 = var153
										while p65[var153] and (p65[var153] >= 48 and p65[var153] <= 57 or p65[var153] >= 65 and p65[var153] <= 90 or (p65[var153] >= 97 and p65[var153] <= 122 or p65[var153] == 95)) do
											var153 += 1
										end
										if p65[var153] == 125 then
											i = p65.s
											local byteOffset_2 = utf8.offset(i, var153)
											byteOffset_1 = string.sub(i, utf8.offset(i, s_1), byteOffset_2 and byteOffset_2 - 1)
											i = scripts[byteOffset_1]
											
											if i then
												table.insert(s, 1, { "charset", byteOffset, i })
											elseif t_8[byteOffset_1] then
												table.insert(s, 1, { "category", byteOffset, byteOffset_1 })
												continue
											end
											return "unknown or malformed script name"
										end
										return "unknown or malformed script name"
									else
										byteOffset = utf8.char(p65[var153] or 0)
										
										if t_8[byteOffset] then
											table.insert(s, 1, { "category", false, byteOffset })
											continue
										end
										return "unknown or malformed script name"
									end
								end
								return "options.unicodeData cannot be turned off when using \\p"
							elseif p65[var153] == 111 then
								var153 += 1
								
								if p65[var153] == 123 then
									var153 += 1
									byteOffset = var153
									while p65[var153] and (p65[var153] >= 48 and p65[var153] <= 55) do
										var153 += 1
									end
									if p65[var153] == 125 and var153 ~= byteOffset then
										i = p65.s
										local byteOffset_2 = utf8.offset(i, var153)
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
								byteOffset = t_6[p65[var153]]
								table.insert(s, 1, if type(byteOffset) == "string" then { "class", byteOffset, false } else byteOffset or p65[var153])
							end
						elseif p66.ignoreCase and p65[var153] >= 97 and p65[var153] <= 122 then
							table.insert(s, 1, p65[var153] - 32)
						else
							table.insert(s, 1, p65[var153])
						end
					end
					return "unterminated character class"
				end
				if p65[var153 - 1] ~= var160 or var153 - 1 == substring then
					if s[2] or var159 then
						table.insert(t_1, { "charset", var159, s })
					else
						table.insert(t_1, s[1])
					end
				end
				return if var160 == 58 then "POSIX named classes are only support within a character set" else "POSIX collating elements aren't supported"
				var153 += 1
				continue
			end
			var159 = #t_1 + 1
			var160 = -1
			substring = 0
			s = 0
			byteOffset = 0
			repeat
				var159 -= 1
				s_1 = t_1[var159]
				byteOffset_1 = type(t_1[var159]) == "table"
				if byteOffset_1 and s_1[1] == 40 then
					byteOffset += 1
					
					if substring and s_1.count then
						substring += s_1.count
					end
					if not s_1[3] then
						if s_1[4] == 124 then
							var154 = s_1[5] + math.max(s, byteOffset)
						end
						if substring == var160 or var160 == -1 then
							var160 = substring
							break
						end
						var160 = nil
						break
				elseif s_1 == list_3 then
					if substring == var160 or var160 == -1 then
						var160 = substring
						substring = 0
					else
						var160 = nil
						substring = nil
					end
					s = math.max(s, byteOffset)
					byteOffset = 0
				elseif substring then
					substring = if byteOffset_1 and s_1[1] == "quantifier" then if s_1[2] == s_1[3] then substring + s_1[2] else nil else substring + 1
				end
			until var159 < 1
			if var159 >= 1 then
				s_1 = t_1[var159]
				byteOffset_1 = #t_1 + 1
				i = {
					41,
					s_1[2],
					var159,
					s_1[4],
					s_1[5],
					count = var160
				}
				
				if s_1[4] ~= 33 and s_1[4] ~= 61 or (not s_1[5] or var160) then
					s_1[3] = byteOffset_1
					table.insert(t_1, i)
				end
				return "lookbehind assertion is not fixed width"
			end
			return "unmatched ) in regular expression"
		end
		var159 = nil
		
		if p65[var153 + 1] == 42 then
			var153 += 2
			var160 = var153
			while p65[var153] and (p65[var153] >= 48 and p65[var153] <= 57 or p65[var153] >= 65 and p65[var153] <= 90 or (p65[var153] >= 97 and p65[var153] <= 122 or (p65[var153] == 95 or p65[var153] == 58))) do
				var153 += 1
			end
			if p65[var153] == 41 or p65[var153 - 1] == 58 then
				s = p65.s
				byteOffset = utf8.offset(s, var153)
				substring = string.sub(s, utf8.offset(s, var160), byteOffset and byteOffset - 1)
				
				if substring == "positive_lookahead:" or substring == "negative_lookhead:" or (substring == "positive_lookbehind:" or substring == "negative_lookbehind:") or substring:find("^[pn]l[ab]:$") then
					var159 = {
						40,
						nil,
						nil,
						if substring:find("^n") then 33 else 61,
						substring:find("b", 3, true) and 1
					}
				elseif substring == "atomic:" then
					var159 = {
						40,
						nil,
						nil,
						62,
						nil
					}
				elseif substring == "ACCEPT" or substring == "FAIL" or (substring == "F" or substring == "PRUNE") or substring == "SKIP" then
					var159 = if substring == "F" then "FAIL" else substring
				elseif t_10[substring] then
					t_3.newline = substring
				elseif substring == "BSR_ANYCRLF" or substring == "BSR_UNICODE" then
					t_3.newline_seq = if substring == "BSR_UNICODE" then 1 else 0
				elseif substring == "NOTEMPTY" or substring == "NOTEMPTY_ATSTART" then
					t_3.not_empty = if substring == "NOTEMPTY" then 1 else 2
				end
				return "unknown or malformed verb"
				if not t_1[1] then
					if var159 then
						table.insert(t_1, var159)
					end
				end
				return "this verb must be placed at the beginning of the regex"
			end
			return "quantifier doesn't follow a repeatable pattern"
		elseif p65[var153 + 1] == 63 then
			var153 += 2
			
			if p65[var153] == 35 then
				var160 = table.find(p65, 41, var153)
				
				if var160 then
					var153 = var160 + 1
					continue
				end
				return "unterminated parenthetical"
			elseif p65[var153] then
				var159 = {
					40,
					nil,
					nil,
					p65[var153],
					nil
				}
				
				if p65[var153] == 48 and p65[var153 + 1] == 41 then
					var160 = "recurmatch"
					substring = 0
					s = 0
					byteOffset = nil
					var159[1] = var160
					var159[2] = substring
					var159[3] = s
					var159[5] = byteOffset
				elseif p65[var153] > 48 and p65[var153] <= 57 then
					var160 = var153
					var153 += 1
					while p65[var153] >= 48 and p65[var153] <= 48 do
						var153 += 1
					end
					if p65[var153] == 41 then
						substring = "recurmatch"
						s_1 = p65.s
						byteOffset_1 = utf8.offset(s_1, var153)
						s = tonumber(string.sub(s_1, utf8.offset(s_1, var160), byteOffset_1 and byteOffset_1 - 1))
						byteOffset = nil
						var159[1] = substring
						var159[2] = s
						var159[4] = byteOffset
					end
					return "invalid group structure"
				elseif p65[var153] == 60 and p65[var153 + 1] == 33 or p65[var153 + 1] == 61 then
					var153 += 1
					substring = 1
					var159[4] = p65[var153]
					var159[5] = substring
				elseif p65[var153] == 124 then
					var159[5] = var154
				elseif p65[var153] == 80 or p65[var153] == 60 or p65[var153] == 39 then
					if p65[var153] == 80 then
						var153 += 1
					end
					if p65[var153] == 61 then
						var160 = var153 + 1
						while p65[var153] and (p65[var153] >= 48 and p65[var153] <= 57 or p65[var153] >= 65 and p65[var153] <= 90 or (p65[var153] >= 97 and p65[var153] <= 122 or p65[var153] == 95)) do
							var153 += 1
						end
						if p65[var153] then
							if p65[var153] == 41 and var153 ~= var160 then
								substring = {}
								s = "backref"
								s_1 = p65.s
								byteOffset_1 = utf8.offset(s_1, var153)
								-- Unknown statement at pc 4: <SetList>
								var159 = substring
							end
							return "invalid group structure"
						end
						return "unterminated parenthetical"
					elseif p65[var153] == 60 or p65[var153 - 1] ~= 80 and p65[var153] == 39 then
						var160 = if p65[var153] == 39 then 39 else 62
						substring = var153 + 1
						var153 += 1
						
						if p65[var153] ~= 41 then
							if p65[var153] < 48 or p65[var153] > 57 then
								if p65[var153] >= 65 and p65[var153] <= 90 or p65[var153] >= 97 and p65[var153] <= 122 or p65[var153] == 95 then
									var153 += 1
									while p65[var153] and (p65[var153] >= 48 and p65[var153] <= 57 or p65[var153] >= 65 and p65[var153] <= 90 or (p65[var153] >= 97 and p65[var153] <= 122 or p65[var153] == 95)) do
										var153 += 1
									end
									if p65[var153] then
										if p65[var153] == var160 then
											byteOffset = p65.s
											byteOffset_1 = utf8.offset(byteOffset, var153)
											s = string.sub(byteOffset, utf8.offset(byteOffset, substring), byteOffset_1 and byteOffset_1 - 1)
											var154 += 1
											
											if (t_2[s] or var154) == var154 then
												for i, v in pairs(t_2) do
													if s ~= i and var154 == v then
														return "different names for subpatterns of the same number aren't permitted"
													end
												end
												t_2[s] = var154
												byteOffset = nil
												var159[2] = var154
												var159[4] = byteOffset
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
				elseif t_11[p65[var153]] then
				end
				return "invalid group structure"
			end
			return "unterminated parenthetical"
		else
			var154 += 1
			var159 = { 40, var154, nil, nil }
		end
	end
	var158 = 0
	
	for s, byteOffset in ipairs(t_1) do
		if type(byteOffset) ~= "table" or byteOffset[1] ~= 40 and (byteOffset[1] ~= "quantifier" or type(byteOffset[5]) ~= "table" or byteOffset[5][1] ~= 40) then
			if type(byteOffset) == "table" and (byteOffset[1] == "backref" or byteOffset[1] == "recurmatch") then
				if t_2[byteOffset[2]] or type(byteOffset[2]) == "number" and var154 >= byteOffset[2] then
					if byteOffset[1] == "recurmatch" and byteOffset[2] ~= 0 then
						for v, v_2 in ipairs(t_1) do
							if type(v_2) == "table" and v_2[1] == 40 and v_2[2] == byteOffset[2] then
								byteOffset[3] = v
								continue
							end
						end
					elseif type(byteOffset[2]) == "string" then
						byteOffset[2] = t_2[byteOffset[2]]
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
				var158 = math.max(var158, byteOffset[2])
			end
		end
		return "unterminated parenthetical"
	end
	t_1.group_n = var158
	
	return t_1, t_2, t_3
end

if not tonumber(t.cacheSize) then
	error(string.format("expected number for options.cacheSize, got %s", typeof(t.cacheSize)), 2)
end
local var52 = math.floor(t.cacheSize or 0) ~= 0 and tonumber(t.cacheSize)
local list_4 = nil
local list_5 = nil

if var52 then
	if var52 < 0 or var52 ~= var52 then
		error("cache size cannot be a negative number or a NaN", 2)
	elseif var52 == 1e999 then
		list_4 = { nil }
		list_5 = { nil }
	elseif var52 >= 4294967296 then
		error("cache size too large", 2)
	else
		list_4 = table.create(t.cacheSize)
		list_5 = table.create(t.cacheSize)
	end
end
if var52 then
	function t_1.pruge() --[[ line: 1902 ]]
		-- upvalues: list_5 (write), list_4 (write)
		table.clear(list_5)
		table.clear(list_4)
	end
end
local function new_re(p67, p68, p69, p70) --[[ line: 1908 ]]
	-- upvalues: var52 (ref), list_4 (write), list_5 (write), tokenize_ptn (ref), tbl (ref), t_2 (write), re_tostr (ref), var8 (write)
	local var179, var180, var181
	local _ = nil
	local _ = nil
	local _ = nil
	local var174 = var52 and string.format("%s|%s", p67.s, p69)
	local var175 = var52 and list_4[table.find(list_5, var174)]
	
	if var175 then
		local unpacked, unpacked_1, unpacked_2 = table.unpack(var175, 1, 3)
		var179 = unpacked
		var180 = unpacked_1
		var181 = unpacked_2
	else
		local var176, var177, var178 = tokenize_ptn(p67, p68)
		var179 = var176
		var180 = var177
		var181 = var178
		
		if type(var179) == "string" then
			error(var179, 2)
		end
		if var52 and var179[1] then
			table.insert(list_5, 1, var174)
			table.insert(list_4, 1, { var179, var180, var181 })
			
			if var52 ~= 1e999 then
				table.remove(list_5, var52 + 1)
				table.remove(list_4, var52 + 1)
			end
		end
	end
	local var185 = newproxy(true)
	tbl[var185] = {
		name = "RegEx",
		flags = p68,
		flag_repr = p69,
		pattern_repr = p70,
		token = var179,
		group_id = var180,
		verb_flags = var181
	}
	local var186 = getmetatable(var185)
	var186.__index = setmetatable(p68, t_2)
	var186.__tostring = re_tostr
	var186.__metatable = var8
	
	return var185
end

local function escape_fslash(p71) --[[ line: 1939 ]]
	return (if #p71 % 2 == 0 then "\\" else "") .. p71 .. "."
end

local function sort_flag_chr(p72, p73) --[[ line: 1943 ]]
	return p72:lower() < p73:lower()
end

function t_1.new(...) --[[ line: 1947 ]]
	-- upvalues: t_4 (ref), sort_flag_chr (ref), new_re (ref), to_str_arr (ref), escape_fslash (ref)
	if select("#", ...) == 0 then
		error("missing argument #1 (string expected)", 2)
	end
	local var187, var188 = ...
	
	if type(var187) == "number" then
		var187 ..= ""
	elseif type(var187) ~= "string" then
		error(string.format("invalid argument #1 (string expected, got %s)", typeof(var187)), 2)
	end
	if type(var188) ~= "string" and type(var188) ~= "number" and var188 ~= nil then
		error(string.format("invalid argument #2 (string expected, got %s)", typeof(var188)), 2)
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
	
	for i in string.gmatch(var188 or "", utf8.charpattern) do
		if t[t_4[i]] ~= false then
			error("invalid regular expression flag " .. i, 3)
		end
		t[t_4[i]] = true
		table.insert(t_1, i)
	end
	table.sort(t_1, sort_flag_chr)
	
	return new_re(to_str_arr(var187), t, table.concat(t_1), string.format("/%s/", var187:gsub("(\\*)/", escape_fslash)))
end

function t_1.fromstring(...) --[[ line: 1977 ]]
	-- upvalues: to_str_arr (ref), t_4 (ref), sort_flag_chr (ref), new_re (ref)
	if select("#", ...) == 0 then
		error("missing argument #1 (string expected)", 2)
	end
	local var191 = ...
	
	if type(var191) == "number" then
		var191 ..= ""
	elseif type(var191) ~= "string" then
		error(string.format("invalid argument #1 (string expected, got %s)", typeof(var191), 2))
	end
	local var192 = to_str_arr(var191)
	local var193 = var192[1]
	
	if not var193 then
		error("empty regex", 2)
	elseif var193 == 92 or var193 >= 48 and var193 <= 57 or (var193 >= 65 and var193 <= 90 or var193 >= 97 and var193 <= 122) then
		error("delimiter must not be alphanumeric or a backslash", 2)
	end
	local var194 = 1
	local var195
	repeat
		var194 = table.find(var192, var193, var194 + 1)
		if not var194 then
			error(string.format("no ending delimiter ('%s') found", utf8.char(var193)), 2)
		end
		var195 = 1
		while var192[var194 - var195] == 92 do
			var195 += 1
		end
	until var195 % 2 == 1
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
	while var194 < var192.n do
		local char = utf8.char(table.remove(var192))
		var192.n -= 1
		
		if t[t_4[char]] ~= false then
			error("invalid regular expression flag " .. char, 3)
		end
		t[t_4[char]] = true
		table.insert(t_1, char)
	end
	table.sort(t_1, sort_flag_chr)
	local joined = table.concat(t_1)
	table.remove(var192, 1)
	table.remove(var192)
	var192.n -= 2
	var192.s = string.sub(var192.s, 2, 1 + var192.n)
	
	return new_re(var192, t, joined, string.sub(var191, 1, 2 + var192.n))
end

local t_12 = {
	["\0"] = "\\x00",
	["\n"] = "\\n",
	["\t"] = "\\t",
	["\r"] = "\\r",
	["\f"] = "\\f"
}

function t_1.escape(...) --[[ line: 2033 ]]
	-- upvalues: t_12 (ref)
	if select("#", ...) == 0 then
		error("missing argument #1 (string expected)", 2)
	end
	local var200, var201, var202 = ...
	
	if type(var200) == "number" then
		var200 ..= ""
	elseif type(var200) ~= "string" then
		error(string.format("invalid argument #1 to 'escape' (string expected, got %s)", typeof(var200)), 2)
	end
	if var202 == nil then
		var202 = ""
	elseif type(var202) == "number" then
		var202 ..= ""
	elseif type(var202) ~= "string" then
		error(string.format("invalid argument #3 to 'escape' (string expected, got %s)", typeof(var202)), 2)
	end
	if utf8.len(var202) > 1 or var202:match("^[%a\\]$") then
		error("delimiter have not be alphanumeric", 2)
	end
	return string.gsub(var200, "[\0\f\n\r\t]", t_12):gsub(string.format("[\\%s#()%%%%*+.?[%%]^{|%s]", if var201 then "%s" else "", (if var202:find("^[%%%]]$") then "%" else "") .. var202), "\\%1")
end

function t_1.type(...) --[[ line: 2056 ]]
	-- upvalues: tbl (ref)
	if select("#", ...) == 0 then
		error("missing argument #1", 2)
	end
	return tbl[...] and tbl[...].name
end

for i, v in pairs(t_2) do
	t_1[i] = v
end
t_2 = { __index = t_2 }
var8 = t_1.fromstring("/The\\s*metatable\\s*is\\s*(?:locked|inaccessible)(?#Nice try :])/i")
getmetatable(var8).__metatable = var8

local function readonly_table() --[[ line: 2072 ]]
	error("Attempt to modify a readonly table", 2)
end

t_1.Match = setmetatable({}, {
	__index = t_3,
	__metatable = var8,
	__newindex = readonly_table
})

return setmetatable({}, {
	__index = t_1,
	__metatable = var8,
	__newindex = readonly_table
})