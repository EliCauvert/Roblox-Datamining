local _ = { cacheSize = 256, unicodeData = false }
local tbl = setmetatable({}, { __mode = "k" })
local t = {}
local t_1 = {}
local t_2 = {}
local var1 = nil

local function to_str_arr(p1, p2)
	if p2 then
		p1 = string.sub(p1, utf8.offset(p1, p2))
	end
	local charCount = utf8.len(p1)
	
	if charCount <= 1999 then
		return { n = charCount, s = p1, utf8.codepoint(p1, 1, #p1) }
	end
	local ceiled = math.ceil(charCount / 1999)
	local list = table.create(charCount)
	local var2 = 1
	
	for i = 1, ceiled do
		local packed = table.pack(utf8.codepoint(p1, utf8.offset(p1, i * 1999 - 1998), utf8.offset(p1, i * 1999 - (if i == ceiled then 1998 - ((charCount - 1) % 1999 + 1) else -1)) - 1))
		table.move(packed, 1, packed.n, var2, list)
		var2 += packed.n
	end
	list.s = p1
	list.n = charCount
	
	return list
end

local function from_str_arr(p3)
	local n = p3.n or #p3
	
	if n <= 7997 then
		return utf8.char(table.unpack(p3))
	end
	local ceiled = math.ceil(n / 7997)
	local list = table.create(ceiled)
	
	for i = 1, ceiled do
		list[i] = utf8.char(table.unpack(p3, i * 7997 - 7996, i * 7997 - (if i == ceiled then 7997 - ((n - 1) % 7997 + 1) else 0)))
	end
	return table.concat(list)
end

local function _(p4, p5, p6)
	local byteOffset = utf8.offset(p4, p6)
	
	return string.sub(p4, utf8.offset(p4, p5), byteOffset and byteOffset - 1)
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

local _ = function(p4, p5, p6)
	-- upvalues: tbl (ref), t (ref)
	return if p4 == "Match" then function(...)
		-- upvalues: tbl (copy), p5 (ref), p6 (ref)
		if select("#", ...) < 1 then
			error("missing argument #1 (Match expected)", 2)
		end
		local var3, var4 = ...
		
		if tbl[var3] and tbl[var3].name == "Match" then
			var3 = tbl[var3]
		else
			error(string.format("invalid argument #1 to %q (Match expected, got %s)", p5, typeof(var3)), 2)
		end
		if (p5 == "group" or p5 == "span") and var73 == nil then
			var73 = 0
		end
		return p6(var72, var73)
	end else function(...)
		-- upvalues: tbl (copy), p7 (ref), t (copy), p8 (ref)
		local var3 = select("#", ...)
		
		if var3 < 1 then
			error("missing argument #1 (RegEx expected)", 2)
		elseif var3 < 2 then
			error("missing argument #2 (string expected)", 2)
		end
		local var4, var5, var6, var7, var8, var9 = ...
		
		if not tbl[var4] or tbl[var4].name ~= "RegEx" then
			if type(var4) ~= "string" and type(var4) ~= "number" then
				error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", p7, typeof(var4)), 2)
			end
			var4 = t.fromstring(var4)
		elseif p7 == "sub" then
			if type(var6) == "number" then
				var6 ..= ""
			elseif type(var6) ~= "string" then
				error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var6)), 2)
			end
		elseif type(var5) == "number" then
			var5 ..= ""
		elseif type(var5) ~= "string" then
			error(string.format("invalid argument #2 to %q (string expected, got %s)", p7, typeof(var5)), 2)
		end
		if p7 ~= "sub" and p7 ~= "split" then
			local var3 = typeof(var67)
			
			if var3 ~= "nil" then
				var67 = tonumber(var67)
				
				if var67 then
					var67 = if var67 < 0 then #var66 + math.floor(var67 + 0.5) + 1 else math.max(math.floor(var67 + 0.5), 1)
				else
					error(string.format("invalid argument #3 to %q (number expected, got %s)", p7, var3), 2)
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

local function match_tostr(p3)
	-- upvalues: tbl (ref)
	local spans = tbl[p3].spans
	local var3 = spans[0][1]
	local var4 = spans[0][2]
	
	if var4 <= var3 then
		return string.format("Match (%d..%d, empty)", var3, var4 - 1)
	end
	local format = string.format
	local var5 = "Match (%d..%d): %s"
	local var6 = var4 - 1
	local input = spans.input
	local byteOffset = utf8.offset(input, var4)
	
	return format(var5, var3, var6, string.sub(input, utf8.offset(input, var3), byteOffset and byteOffset - 1))
end

local function new_match(p3, p4, p5, p6)
	-- upvalues: var1 (write), t_2 (write), match_tostr (ref), tbl (ref)
	p3.source = p5
	p3.input = p6
	local var3 = newproxy(true)
	local var4 = getmetatable(var3)
	var4.__metatable = var1
	var4.__index = setmetatable(p3, t_2)
	var4.__tostring = match_tostr
	tbl[var3] = { name = "Match", spans = p3, group_id = p4 }
	
	return var3
end

local var3 = function(p3, p4)
	local var4 = p3.spans[if type(p4) == "number" then p4 else p3.group_id[p4]]
	
	if var4 then
		local input = p3.spans.input
		local byteOffset = utf8.offset(input, var4[2])
		
		return string.sub(input, utf8.offset(input, var4[1]), byteOffset and byteOffset - 1)
	end
	return nil
end

local var5 = "group"

function t_2.group(...)
	-- upvalues: tbl (ref), var5 (ref), var3 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var6, var7 = ...
	
	if tbl[var6] and tbl[var6].name == "Match" then
		var6 = tbl[var6]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var5, typeof(var6)), 2)
	end
	if (var5 == "group" or var5 == "span") and var73 == nil then
		var73 = 0
	end
	return var3(var72, var73)
end

local var4 = function(p3, p4)
	local var5 = p3.spans[if type(p4) == "number" then p4 else p3.group_id[p4]]
	
	if var5 then
		return var5[1], var5[2] - 1
	end
	return nil
end

local var6 = "span"

function t_2.span(...)
	-- upvalues: tbl (ref), var6 (ref), var4 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var7, var8 = ...
	
	if tbl[var7] and tbl[var7].name == "Match" then
		var7 = tbl[var7]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var6, typeof(var7)), 2)
	end
	if (var6 == "group" or var6 == "span") and var73 == nil then
		var73 = 0
	end
	return var4(var72, var73)
end

local var5 = function(p3)
	local spans = p3.spans
	
	if spans.n <= 0 then
		local input = spans.input
		local byteOffset = utf8.offset(input, spans[0][2])
		
		return string.sub(input, utf8.offset(input, spans[0][1]), byteOffset and byteOffset - 1)
	end
	local list = table.create(spans.n)
	
	for i = 0, spans.n do
		local var6 = spans[i]
		
		if var6 then
			local input = spans.input
			local byteOffset = utf8.offset(input, var6[2])
			list[i] = string.sub(input, utf8.offset(input, var6[1]), byteOffset and byteOffset - 1)
		end
	end
	return table.unpack(list, 1, spans.n)
end

local var7 = "groups"

function t_2.groups(...)
	-- upvalues: tbl (ref), var7 (ref), var5 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var8, var9 = ...
	
	if tbl[var8] and tbl[var8].name == "Match" then
		var8 = tbl[var8]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var7, typeof(var8)), 2)
	end
	if (var7 == "group" or var7 == "span") and var73 == nil then
		var73 = 0
	end
	return var5(var72, var73)
end

local var6 = function(p3)
	local spans = p3.spans
	local t = {}
	
	for i, v in pairs(p3.group_id) do
		v = spans[v]
		
		if v then
			local input = spans.input
			local byteOffset = utf8.offset(input, v[2])
			t[i] = string.sub(input, utf8.offset(input, v[1]), byteOffset and byteOffset - 1)
		end
	end
	return t
end

local var7 = "groupdict"

function t_2.groupdict(...)
	-- upvalues: tbl (ref), var7 (ref), var6 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var8, var9 = ...
	
	if tbl[var8] and tbl[var8].name == "Match" then
		var8 = tbl[var8]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var7, typeof(var8)), 2)
	end
	if (var7 == "group" or var7 == "span") and var73 == nil then
		var73 = 0
	end
	return var6(var72, var73)
end

local var7 = function(p3)
	local spans = p3.spans
	local list = table.create(spans.n)
	
	for i = 0, spans.n do
		local var8 = spans[i]
		
		if var8 then
			local input = spans.input
			local byteOffset = utf8.offset(input, var8[2])
			list[i] = string.sub(input, utf8.offset(input, var8[1]), byteOffset and byteOffset - 1)
		end
	end
	list.n = spans.n
	
	return list
end

local var9 = "groupdict"

function t_2.grouparr(...)
	-- upvalues: tbl (ref), var9 (ref), var7 (ref)
	if select("#", ...) < 1 then
		error("missing argument #1 (Match expected)", 2)
	end
	local var10, var11 = ...
	
	if tbl[var10] and tbl[var10].name == "Match" then
		var10 = tbl[var10]
	else
		error(string.format("invalid argument #1 to %q (Match expected, got %s)", var9, typeof(var10)), 2)
	end
	if (var9 == "group" or var9 == "span") and var73 == nil then
		var73 = 0
	end
	return var7(var72, var73)
end

local t_8 = {
	CR = 0,
	LF = 1,
	CRLF = 2,
	ANYRLF = 3,
	ANY = 4,
	NUL = 5
}

local function is_newline(p3, p4, p5)
	local newline = p5.newline
	local var8 = p3[p4]
	
	return if newline == 0 then var8 == 13 elseif newline == 2 then var8 == 10 and p3[p4 - 1] == 32 elseif newline == 3 then if var8 ~= 10 then var8 == 13 else true elseif newline == 4 then if var8 ~= 10 then if var8 ~= 11 then if var8 ~= 12 then if var8 ~= 13 then if var8 ~= 133 then if var8 ~= 8232 then var8 == 8233 else true else true else true else true else true else true elseif newline == 5 then var8 == 0 else var8 == 10
end

local function tkn_char_match(p3, p4, p5, p6, p7)
	-- upvalues: tkn_char_match (ref), t_7 (ref), is_newline (ref)
	local v
	local var8 = p4[p5]
	
	if not var8 then
		return false
	elseif p6.ignoreCase and var8 >= 97 and var8 <= 122 then
		var8 -= 32
	end
	if type(p3) == "number" then
		return p3 == var8
	elseif p3[1] == "charset" then
		for i, v in ipairs(p3[3]) do
			if tkn_char_match(v, p4, p5, p6, p7) then
				return not p3[2]
			end
		end
		return p3[2]
	elseif p3[1] == "range" then
		return p3[2] <= var8 or p6.ignoreCase and (var8 >= 65 and (var8 <= 90 and (p3[2] <= var8 + 32 and var8 + 32 <= p3[3])))
	elseif p3[1] == "class" then
		local var9 = p3[2]
		local var10 = p3[3]
		local var11 = false
		
		if var9 == "xdigit" then
			var11 = var8 >= 48 or (var8 >= 65 or (var8 >= 97 and var8 <= 102))
		elseif var9 == "ascii" then
			local _ = var8 <= 127
		elseif var9 == "vertical_tab" then
			local var12
			if var8 >= 10 then
				var12 = true
				
				if var8 > 13 then
					var12 = if var8 ~= 8232 then var8 == 8233 else true
				end
				var11 = var12
			end
		elseif p6.unicode then
			local var13 = (false)[var8] or "Cn"
			v = var13:sub(1, 1)
			
			if var9 == "alnum" then
				var11 = if v ~= "L" then if var13 ~= "Nl" then var13 == "Nd" else true else true
			elseif var9 == "alpha" then
				var11 = if v ~= "L" then var13 == "Nl" else true
			elseif var9 == "blank" then
				var11 = if var13 ~= "Zs" then var8 == 9 else true
			elseif var9 == "cntrl" then
				local _ = var13 == "Cc"
			elseif var9 == "digit" then
				local _ = var13 == "Nd"
			elseif var9 == "graph" then
				var11 = v ~= "P" and v ~= "C"
			elseif var9 == "lower" then
				local _ = var13 == "Ll"
			elseif var9 == "print" then
				local _ = v ~= "C"
			elseif var9 == "punct" then
				local _ = v == "P"
			elseif var9 == "space" then
				var11 = if v ~= "Z" then var8 >= 9 and var8 <= 13 else true
			elseif var9 == "upper" then
				local _ = var13 == "Lu"
			elseif var9 == "word" then
				var11 = if v ~= "L" then if var13 ~= "Nl" then if var13 ~= "Nd" then var13 == "Pc" else true else true else true
			end
		elseif var9 == "alnum" then
			var11 = var8 >= 48 or (var8 >= 65 or (var8 >= 97 and var8 <= 122))
		elseif var9 == "alpha" then
			var11 = var8 >= 65 or (var8 >= 97 and var8 <= 122)
		elseif var9 == "blank" then
			var11 = if var8 ~= 9 then var8 == 32 else true
		elseif var9 == "cntrl" then
			var11 = if var8 > 31 then var8 == 127 else true
		elseif var9 == "digit" then
			var11 = var8 >= 48 and var8 <= 57
		elseif var9 == "graph" then
			var11 = var8 >= 33 and var8 <= 126
		elseif var9 == "lower" then
			var11 = var8 >= 97 and var8 <= 122
		elseif var9 == "print" then
			var11 = var8 >= 32 and var8 <= 126
		elseif var9 == "punct" then
			var11 = t_7[var8]
		elseif var9 == "space" then
			var11 = var8 >= 9 or var8 == 32
		elseif var9 == "upper" then
			var11 = var8 >= 65 and var8 <= 90
		elseif var9 == "word" then
			var11 = var8 >= 48 or (var8 >= 65 or (var8 >= 97 or var8 == 95))
		end
		return if var10 then not var11 else var11
	elseif p3[1] == "category" then
		local var14 = (false)[var8] or "Cn"
		local var15 = p3[3]
		local var101Count = #var15
		
		if var101Count == 3 then
			local var16 = false
			
			if var15 == "Xan" or var15 == "Xwd" then
				v = var14:find("^[LN]") or (var15 == "Xwd" and var8 == 95)
				var16 = v
			elseif var15 == "Xps" or var15 == "Xsp" then
				v = if var14:sub(1, 1) ~= "Z" then var8 >= 9 and var8 <= 13 else true
				var16 = v
			elseif var15 == "Xuc" then
				var16 = tkn_char_match(false, p4, p5, p6, p7)
			end
			return if p3[2] then not var16 else var16
		else
			return if var14:sub(1, var101Count) == var15 then not p3[2] else p3[2]
		end
	else
		return if p3[1] == 46 then p6.dotAll or not is_newline(p4, p5, p7) elseif p3[1] == 78 then not is_newline(p4, p5, p7) else p3[1] == 82 and (if p7.newline_seq == 0 then if var8 ~= 10 then var8 == 13 else true elseif var8 ~= 10 then if var8 ~= 11 then if var8 ~= 12 then if var8 ~= 13 then if var8 ~= 133 then if var8 ~= 8232 then var8 == 8233 else true else true else true else true else true else true)
	end
end

local function find_alternation(p8, p9, p10)
	-- upvalues: list_3 (ref)
	while true do
		local var17 = p8[p9]
		local isTable = type(var17) == "table"
		if var17 ~= list_3 then
			if isTable and var17[1] == 40 then
				if p10 then
					p10 += var17.count
				end
				p9 = var17[3]
				p9 += 1
			end
			if isTable and var17[1] == "quantifier" and (type(var17[5]) == "table" and var17[5][1] == 40) then
				if p10 then
					p10 += var17[5].count
				end
				p9 = var17[5][3]
			elseif var17 and (not isTable or var17[1] ~= 41) then
				if p10 then
					p10 = if isTable and var17[1] == "quantifier" then p10 + var17[3] else p10 + 1
				end
			end
			return nil, p10
		end
		return p9, p10
	end
end

local function re_rawfind(p11, p12, p13, p14, p15, p16)
	-- upvalues: find_alternation (ref), tkn_char_match (ref), is_newline (ref)
	local var18, var19, var20, var21, isTable, var22, v, i, substring, v_1
	local var23 = 0
	local var24 = p13
	local var25 = p13
	local t = {}
	while var23 do
		if var23 == 0 then
			var23 += 1
			var18 = find_alternation(p11, var23)
			
			if var18 then
				table.insert(t, 1, { "alternation", var18, var24 })
			end
		else
			var18 = p11[var23]
			var19 = type(var18) == "table" and var18[1]
			
			if not var18 then break end
			if var18 == "ACCEPT" then
				var20 = true
				var21 = var23
				repeat
					var21 += 1
					isTable = type(p11[var21]) == "table"
					var22 = p11[var21]
					if isTable and (var22[1] == 40 or var22[1] == "quantifier" and type(var22[5]) == "table" and var22[5][1] == 40) then
						var21 = if var22[1] == "quantifier" then var22[5][3] else var22[3]
					elseif isTable and var22[1] == 41 and (var22[4] == 33 or var22[4] == 61) then
						var20 = false
						var23 = var21
						break
					elseif var20 then break end
				until not var22
			elseif var18 == "PRUNE" or var18 == "SKIP" then
				table.insert(t, 1, { var18, var24 })
				var23 += 1
			elseif var19 == 40 then
				table.insert(t, 1, {
					"group", var23, var24, nil, var18[2], var18[3], var18[4]
				})
				var23 += 1
				isTable = var23
				
				if var18[4] ~= 33 then
					var22 = var18[4] == 61 and (var18[5] and 0)
				end
				var20, var113 = find_alternation(p11, isTable, var22)
				
				if var20 then
					table.insert(t, 1, { "alternation", var20, var24 })
				end
				if var21 then
					var24 -= var21
				end
			elseif var19 == 41 and var18[4] ~= 33 then
				if var18[4] == 33 or var18[4] == 61 then
					while true do
						var20 = nil
						var21 = table.remove(t, 1)
						if var21[1] ~= "group" or var21[2] ~= var18[3] then
							if var21[1] == "matchStart" and var18[4] == 61 then
								var20 = var21
							end
						end
						if var18[4] ~= 33 and var18[4] ~= 61 or var18[5] then break end
						var24 = var21[3]
						break
					end
				elseif var18[4] == 62 then
					repeat
						var20 = table.remove(t, 1)
					until not (var20 and (var20[1] ~= "group" or var20[2] ~= var18[3]))
				else
					for var22, i in ipairs(t) do
						if i[1] == "group" and i[2] == var18[3] then
							if i.jmp then
								var23 = i.jmp
							end
							i[4] = var24
							
							if i[7] ~= "quantifier" or i[10] + 1 >= i[9] then break end
							if p11[var18[3]][4] ~= "lazy" or i[10] + 1 < i[8] then
								var23 = var18[3]
							end
							v = p11[var18[3]]
							table.insert(t, 1, {
								"group", i[2], var24, nil, v[5][2], v[5][3], "quantifier", v[2], v[3],
								i[10] + 1, i[11], v[4]
							})
							
							if not i[11] then break end
							table.insert(t, 1, { "alternation", i[11], var24 })
							break
						end
					end
				end
				var23 += 1
				continue
			elseif var19 == 75 then
				table.insert(t, 1, { "matchStart", var24 })
				var23 += 1
			elseif var19 == 124 then
				var20 = var23
				repeat
					var20 += 1
					var21 = type(p11[var20]) == "table"
					isTable = p11[var20]
					if var21 and (isTable[1] == 40 or isTable[1] == "quantifier" and type(isTable[5]) == "table" and isTable[5][1] == 40) then
						var20 = if isTable[1] == "quantifier" then isTable[5][3] else isTable[3]
					end
				until not (var21 and isTable[1] == 41 or not isTable)
				if p11[var20] then
					for i, v in ipairs(t) do
						if v[1] == "group" and v[6] == var20 then
							var23 = v[6]
							continue
						end
					end
				else
					var23 = var20
				end
			elseif var19 == "recurmatch" then
				table.insert(t, 1, {
					"group",
					var18[3],
					var24,
					nil,
					nil,
					p11[var18[3]][3],
					nil,
					jmp = var23
				})
				var23 = var18[3] + 1
				var20, var113 = find_alternation(p11, var23)
				
				if var20 then
					table.insert(t, 1, { "alternation", var20, var24 })
				end
			else
				local var26, i_1
				var20 = nil
				
				if var18 == "FAIL" then
					var20 = false
				elseif var19 == 41 then
					repeat
						var21 = table.remove(t, 1)
					until not (var21[1] == "group" and var21[2] == var18[3])
				elseif var19 == "quantifier" then
					if type(var18[5]) == "table" and var18[5][1] == 40 then
						var21 = find_alternation(p11, var23 + 1)
						
						if var21 then
							table.insert(t, 1, { "alternation", var21, var24 })
						end
						table.insert(t, if var21 then 2 else 1, {
							"group", var23, var24, nil, var18[5][2], var18[5][3], "quantifier",
							var18[2], var18[3], 0, var21, var18[4]
						})
						
						if var18[4] == "lazy" and var18[2] == 0 then
							var23 = var18[5][3]
						end
						var20 = true
					else
						var21 = nil
						isTable = nil
						var22 = 1
						i = type(var18[5]) == "table" and var18[5][1] == "backref"
						
						if i then
							var22 = 0
							v = var18[5][2]
							
							for i_1, v_1 in ipairs(t) do
								if v_1[1] == "group" and v_1[5] == v then
									var21 = v_1[3]
									isTable = v_1[4]
									var22 = isTable - var21
									break
								end
							end
						end
						v = var24 + var18[2] * var22
						local var27 = 0
						while var27 < var18[3] do
							if i then
								if not var21 or not isTable then break end
								var26 = var24
								i_1 = p12.s
								local byteOffset = utf8.offset(i_1, isTable)
								substring = string.sub(i_1, utf8.offset(i_1, var21), byteOffset and byteOffset - 1)
								v_1 = p12.s
								local byteOffset_1 = utf8.offset(v_1, var24 + var22)
								
								if substring ~= string.sub(v_1, utf8.offset(v_1, var26), byteOffset_1 and byteOffset_1 - 1) then break end
								var24 += var22
								var27 += 1
							elseif tkn_char_match(var18[5], p12, var24, p14, p15) then
								continue
							else
								break
							end
						end
						var20 = var18[2] <= var27
						
						if var20 and var18[4] ~= "possessive" then
							if var18[4] == "lazy" then
								var26 = var24
								var24 = v
								v = var26
							end
							table.insert(t, 1, {
								"quantifier",
								var23,
								var24,
								math.min(v, p12.n + 1),
								(if var18[4] == "lazy" then 1 else -1) * var22
							})
						end
					end
				elseif var19 == "backref" then
					var21 = nil
					isTable = nil
					var22 = var18[2]
					
					for var26, substring in ipairs(t) do
						if substring[1] == "group" and substring[5] == var22 then
							var21 = substring[3]
							isTable = substring[4]
							break
						end
					end
					if var21 and isTable then
						i = var24
						var24 += isTable - var21
						local s = p12.s
						i_1 = utf8.offset(s, isTable)
						v = string.sub(s, utf8.offset(s, var21), i_1 and i_1 - 1)
						var26 = p12.s
						substring = utf8.offset(var26, var24)
						var20 = v == string.sub(var26, utf8.offset(var26, i), substring and substring - 1)
						var20 = nil
					end
				else
					var21 = p12[var24]
					
					if var19 == 36 or var19 == 90 or var19 == 122 then
						isTable = true
						
						if var24 ~= p12.n + 1 then
							if var19 == 36 and p14.multiline then
								isTable = is_newline(p12, var24 + 1, p15)
								
								if not isTable then
									isTable = var19 == 90 and (var24 == p12.n and is_newline(p12, var24, p15))
								end
							end
						end
						var20 = isTable
					elseif var19 == 94 or var19 == 65 or var19 == 71 then
						isTable = true
						
						if var24 ~= 1 then
							if var19 == 94 and p14.multiline then
								isTable = is_newline(p12, var24 - 1, p15)
								
								if not isTable then
									isTable = var19 == 71 and var24 == p13
								end
							end
						end
						var20 = isTable
					elseif var19 == 66 or var19 == 98 then
						isTable = if var24 ~= 1 then p14.multiline and is_newline(p12, var24 - 1, p15) else true
						var22 = if var24 ~= p12.n + 1 then p14.multiline and is_newline(p12, var24, p15) else true
						i = if tkn_char_match(var18[2], p12[var24 - 1], p14) then 0 else tkn_char_match(var18[2], var21, p14) and 1
						
						if i == 0 then
							v = var22 or not tkn_char_match(var18[2], var21, p14)
							var20 = v
						elseif i then
							v = isTable or not tkn_char_match(var18[2], p12[var24 - 1], p14)
							var20 = v
						end
						if var19 == 66 then
							var20 = not var20
						end
					else
						var20 = tkn_char_match(var18, p12, var24, p14, p15)
						var24 += 1
					end
				end
				if not var20 then
					while true do
						var21 = t[1] and t[1][1]
						isTable = t[1]
						if var21 and var21 ~= "PRUNE" and var21 ~= "SKIP" then
							if var21 ~= "alternation" then
								if var21 ~= "group" then
									if var21 ~= "quantifier" or math.sign(isTable[4] - isTable[3]) ~= math.sign(isTable[5]) then
										table.remove(t, 1)
										continue
									end
									isTable[3] += isTable[5]
									var23 = isTable[2]
									var24 = isTable[3]
									break
								elseif isTable[7] ~= "quantifier" then
									if isTable[7] ~= 33 then
										continue
									end
									table.remove(t, 1)
									var23 = isTable[6]
									var24 = isTable[3]
									break
								elseif isTable[12] == "greedy" and isTable[8] <= isTable[10] or isTable[12] == "lazy" and isTable[10] < isTable[9] and not isTable[13] then
									var23 = if isTable[12] == "greedy" then isTable[6] else isTable[2]
									var24 = isTable[3]
									
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
							var23 = isTable[2]
							var24 = isTable[3]
							var22, i = find_alternation(p11, var23 + 1)
							
							if var22 then
								isTable[2] = var22
							else
								table.remove(t, 1)
							end
							if not i then break end
							var24 -= i
							break
						end
						if var21 then
							table.clear(t)
						end
						if p12.n >= var25 then
							var25 = if var21 == "SKIP" then isTable[2] else var25 + 1
							var23 = 0
							var24 = var25
							break
						end
						return if p16 then false else nil
					end
				end
				var23 += 1
			end
		end
	end
	if p16 then
		return true
	end
	var18 = false
	var19 = table.create(p11.group_n)
	isTable = p11.group_n
	var19[0] = { var25, var24 }
	var19.n = isTable
	
	for var22, i in ipairs(t) do
		if i[1] == "matchStart" and not var18 then
			var18 = true
			var19[0][1] = i[2]
		elseif i[1] == "group" and i[5] and not var19[i[5]] then
			var19[i[5]] = { i[3], i[4] }
		end
	end
	return var19
end

local var28 = function(p17, p18, p19)
	-- upvalues: re_rawfind (ref), to_str_arr (ref)
	return re_rawfind(p17.token, to_str_arr(p18, p19), 1, p17.flags, p17.verb_flags, true)
end

local var29 = "test"

function t_1.test(...)
	-- upvalues: tbl (ref), var29 (ref), t (ref), var28 (ref)
	local var30 = select("#", ...)
	
	if var30 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var30 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var31, var32, var33, var34, var35, var36 = ...
	
	if not tbl[var31] or tbl[var31].name ~= "RegEx" then
		if type(var31) ~= "string" and type(var31) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var29, typeof(var31)), 2)
		end
		var31 = t.fromstring(var31)
	elseif var29 == "sub" then
		if type(var33) == "number" then
			var33 ..= ""
		elseif type(var33) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var33)), 2)
		end
	elseif type(var32) == "number" then
		var32 ..= ""
	elseif type(var32) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var29, typeof(var32)), 2)
	end
	if var29 ~= "sub" and var29 ~= "split" then
		local var30 = typeof(var67)
		
		if var30 ~= "nil" then
			var67 = tonumber(var67)
			
			if var67 then
				var67 = if var67 < 0 then #var66 + math.floor(var67 + 0.5) + 1 else math.max(math.floor(var67 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var29, var30), 2)
			end
		end
	end
	var65 = tbl[var65]
	
	if var29 == "match" or var29 == "matchiter" then
		var68 = ...
	elseif var29 == "sub" then
		var70 = ...
	end
	return var28(var65, var66, var67, var68, var69, var70)
end

local var31 = function(p17, p18, p19, p20)
	-- upvalues: re_rawfind (ref), to_str_arr (ref), new_match (ref)
	local var32 = re_rawfind(p17.token, to_str_arr(p18, p19), 1, p17.flags, p17.verb_flags, false)
	
	return if var32 then new_match(var32, p17.group_id, p20, p18) else nil
end

local var32 = "match"

function t_1.match(...)
	-- upvalues: tbl (ref), var32 (ref), t (ref), var31 (ref)
	local var33 = select("#", ...)
	
	if var33 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var33 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var34, var35, var36, var37, var38, var39 = ...
	
	if not tbl[var34] or tbl[var34].name ~= "RegEx" then
		if type(var34) ~= "string" and type(var34) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var32, typeof(var34)), 2)
		end
		var34 = t.fromstring(var34)
	elseif var32 == "sub" then
		if type(var36) == "number" then
			var36 ..= ""
		elseif type(var36) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var36)), 2)
		end
	elseif type(var35) == "number" then
		var35 ..= ""
	elseif type(var35) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var32, typeof(var35)), 2)
	end
	if var32 ~= "sub" and var32 ~= "split" then
		local var30 = typeof(var67)
		
		if var30 ~= "nil" then
			var67 = tonumber(var67)
			
			if var67 then
				var67 = if var67 < 0 then #var66 + math.floor(var67 + 0.5) + 1 else math.max(math.floor(var67 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var32, var30), 2)
			end
		end
	end
	var65 = tbl[var65]
	
	if var32 == "match" or var32 == "matchiter" then
		var68 = ...
	elseif var32 == "sub" then
		var70 = ...
	end
	return var31(var65, var66, var67, var68, var69, var70)
end

local var33 = function(p17, p18, p19, p20)
	-- upvalues: to_str_arr (ref), re_rawfind (ref), new_match (ref)
	p18 = to_str_arr(p18, p19)
	local var34 = 1
	
	return function()
		-- upvalues: var34 (write), p18 (write), re_rawfind (copy), p17 (ref), new_match (copy), p20 (ref)
		local var35 = var34 <= p18.n + 1 and re_rawfind(p17.token, p18, var34, p17.flags, p17.verb_flags, false)
		
		if var35 then
			var34 = var35[0][2] + (if var35[0][2] <= var35[0][1] then 1 else 0)
			
			return new_match(var35, p17.group_id, p20, p18.s)
		end
		return nil
	end
end

local var34 = "matchall"

function t_1.matchall(...)
	-- upvalues: tbl (ref), var34 (ref), t (ref), var33 (ref)
	local var35 = select("#", ...)
	
	if var35 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var35 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var36, var37, var38, var39, var40, var41 = ...
	
	if not tbl[var36] or tbl[var36].name ~= "RegEx" then
		if type(var36) ~= "string" and type(var36) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var34, typeof(var36)), 2)
		end
		var36 = t.fromstring(var36)
	elseif var34 == "sub" then
		if type(var38) == "number" then
			var38 ..= ""
		elseif type(var38) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var38)), 2)
		end
	elseif type(var37) == "number" then
		var37 ..= ""
	elseif type(var37) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var34, typeof(var37)), 2)
	end
	if var34 ~= "sub" and var34 ~= "split" then
		local var30 = typeof(var67)
		
		if var30 ~= "nil" then
			var67 = tonumber(var67)
			
			if var67 then
				var67 = if var67 < 0 then #var66 + math.floor(var67 + 0.5) + 1 else math.max(math.floor(var67 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var34, var30), 2)
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

local function insert_tokenized_sub(p17, p18, p19, p20)
	-- upvalues: insert_tokenized_sub (ref)
	for i, v in ipairs(p20) do
		if type(v) == "table" then
			if v[1] ~= "condition" then
				table.move(v, 1, #v, #p17 + 1, p17)
			elseif p19[v[2]] then
				if v[3] then
					insert_tokenized_sub(p17, p18, p19, v[3])
				else
					table.move(p18, p19[v[2]][1], p19[v[2]][2] - 1, #p17 + 1, p17)
				end
			elseif v[4] then
				insert_tokenized_sub(p17, p18, p19, v[4])
			end
		elseif p19[v] then
			table.move(p18, p19[v][1], p19[v][2] - 1, #p17 + 1, p17)
		end
	end
	p17.n = #p17
	
	return p17
end

local var35 = function(p21, p22, p23, p24, p25, p26)
	-- upvalues: to_str_arr (ref), t_5 (ref), re_rawfind (ref), insert_tokenized_sub (ref), new_match (ref), from_str_arr (ref)
	if p25 ~= nil and type(p25) ~= "number" and type(p25) ~= "string" then
		error(string.format("invalid argument #5 to 'sub' (string expected, got %s)", typeof(p25)), 3)
	end
	local t = { l = false, o = false, u = false }
	
	for i in string.gmatch(p25 or "", utf8.charpattern) do
		if t[i] ~= false then
			error("invalid regular expression substitution flag " .. i, 3)
		end
		t[i] = true
	end
	local var36 = type(p22)
	
	if var36 == "number" then
		p22 ..= ""
	elseif var36 ~= "string" and var36 ~= "function" and (not t.o or var36 ~= "table") then
		error(string.format("invalid argument #2 to 'sub' (string/function%s expected, got %s)", if t.o then "/table" else "", typeof(p22)), 3)
	end
	if tonumber(p24) then
		p24 = tonumber(p24)
		
		if p24 <= -1 or p24 ~= p24 then
			p24 = 1e999
		end
	elseif p24 == nil then
		p24 = 1e999
	else
		error(string.format("invalid argument #4 to 'sub' (number expected, got %s)", typeof(p24)), 3)
	end
	if p24 < 1 then
		return p23, 0
	end
	local list, var37, var38, var39, var40
	local var41 = 0
	
	if var36 == "string" then
		p22 = to_str_arr(p22)
		
		if not t.l then
			local var42 = 0
			list = table.create(3)
			local groupN = p21.token.group_n
			local t_1 = {}
			while var42 < p22.n do
				var37 = var42
				repeat
					var37 += 1
				until not (p22[var37] and (p22[var37] ~= 36 and p22[var37] ~= 92) and (p22[var37] ~= 58 and p22[var37] ~= 125 or not t_1[1]))
				local i_1
				var41 += var37 - var42 - 1
				
				if var37 - var42 > 1 then
					table.insert(list, table.move(p22, var42 + 1, var37 - 1, 1, table.create(var37 - var42 - 1)))
				end
				if p22[var37] == 58 then
					var38 = t_1[1]
					
					if var38[2] then
						error("malformed substitution pattern", 3)
					end
					var38[2] = table.move(list, var38[3], #list, 1, table.create(#list + 1 - var38[3]))
					
					for i_1 = #list, var38[3], -1 do
						list[i_1] = nil
					end
				elseif p22[var37] == 125 then
					local i_2
					var38 = table.remove(t_1, 1)
					var39 = table.move(list, var38[3], #list, 1, table.create(#list + 1 - var38[3]))
					
					for i_2 = #list, var38[3], -1 do
						list[i_2] = nil
					end
					i_2 = {}
					local var43 = "condition"
					local var44 = var38[1]
					local _ = false
					local var45 = var38[2]
					local _ = var45 == true and ((if var45 == true then var38[2] else nil) or var39)
					-- Unknown statement at pc 6: <SetList>
					table.insert(list, i_2)
				elseif p22[var37] then
					var37 += 1
					var38 = p22[var37]
					
					if not var38 then
						if p22[var37 - 1] == 92 then
							error("replacement string must not end with a trailing backslash", 3)
						end
						var39 = list[#list]
						
						if type(var39) == "table" then
							table.insert(var39, p22[var37 - 1])
						else
							table.insert(list, { p22[var37 - 1] })
						end
					elseif var38 == 92 and p22[var37 - 1] == 36 then
						var39 = list[#list]
						
						if type(var39) == "table" then
							table.insert(var39, 36)
						else
							table.insert(list, { 36 })
						end
						var37 -= 1
						var41 += 1
					elseif var38 == 48 then
						table.insert(list, 0)
					elseif var38 > 48 and var38 <= 57 then
						var39 = var37
						var40 = var38 - 48
						while p22[var37 + 1] and (p22[var37 + 1] >= 48 and p22[var37 + 1] <= 57) do
							var40 ..= p22[var37 + 1] - 48
							var37 += 1
						end
						var40 = tonumber(var40)
						
						if not t.u and groupN < var40 then
							error("reference to non-existent subpattern", 3)
						end
						table.insert(list, var40)
					elseif var38 == 123 and p22[var37 - 1] == 36 then
						var37 += 1
						var39 = var37
						while p22[var37] and (p22[var37] >= 48 and p22[var37] <= 57 or p22[var37] >= 65 and p22[var37] <= 90 or (p22[var37] >= 97 and p22[var37] <= 122 or p22[var37] == 95)) do
							var37 += 1
						end
						if (p22[var37] == 125 or p22[var37] == 58 and (p22[var37 + 1] == 43 or p22[var37 + 1] == 45)) and var37 ~= var39 then
							i_1 = p22.s
							local byteOffset = utf8.offset(i_1, var37)
							byteOffset = string.sub(i_1, utf8.offset(i_1, var39), byteOffset and byteOffset - 1)
							
							if p22[var39] >= 48 and p22[var39] <= 57 then
								var40 = tonumber(byteOffset)
								
								if not t.u and groupN < var40 then
									error("reference to non-existent subpattern", 3)
								end
							else
								var40 = p21.group_id[byteOffset]
								
								if not t.u and (not var40 or groupN < var40) then
									error("reference to non-existent subpattern", 3)
								end
							end
							if p22[var37] == 58 then
								var37 += 1
								table.insert(t_1, { var40, p22[var37] == 45, #list + 1 })
							else
								table.insert(list, var40)
							end
						else
							error("malformed substitution pattern", 3)
						end
					else
						var39 = nil
						
						if p22[var37 - 1] ~= 36 then
							var39 = t_5[p22[var37]]
							
							if type(var39) ~= "number" then
								var39 = nil
							end
						elseif var38 ~= 36 then
							var40 = list[#list]
							
							if type(var40) == "table" then
								table.insert(var40, 36)
							else
								table.insert(list, { 36 })
							end
						end
						var40 = list[#list]
						
						if type(var40) == "table" then
							table.insert(var40, var39 or p22[var37])
						else
							table.insert(list, { var39 or p22[var37] })
						end
						var41 += 1
					end
				end
				var42 = var37
			end
			if t_1[1] then
				error("malformed substitution pattern", 3)
			end
			if list[2] or type(list[1]) ~= "table" or list[1][1] == "condition" then
				p22 = list
				var36 = "subst_string"
			else
				var37 = list[1]
				p22.n = #list[1]
				p22 = var37
			end
		end
	end
	local var46 = to_str_arr(p23)
	var46 = 0
	list = 1
	local var47 = 0
	repeat
		if list > var46.n + var46 + 1 then break end
		local var48 = re_rawfind(p21.token, var46, list, p21.flags, p21.verb_flags, false)
		
		if not var48 then break end
		local byteOffset
		var37 = nil
		
		if var36 == "string" then
			var37 = p22
		elseif var36 == "subst_string" then
			var37 = insert_tokenized_sub(table.create(var41), var46, var48, p22)
		else
			var38 = nil
			var39 = nil
			
			if var36 == "table" then
				var40 = var46.s
				byteOffset = utf8.offset(var40, var48[0][2])
				var38 = string.sub(var40, utf8.offset(var40, var48[0][1]), byteOffset and byteOffset - 1)
				var39 = p22[var38]
			else
				var38 = new_match(var48, p21.group_id, p26, var46.s)
				var39 = p22(var38)
			end
			if var39 == var38 or t.o and not var39 then
				var40 = var48[0][2] - var48[0][1]
				var37 = table.move(var46, var48[0][1], var48[0][2] - 1, 1, table.create(var40))
				var37.n = var40
			elseif type(var39) == "string" then
				var37 = to_str_arr(var39)
			elseif type(var39) == "number" then
				var37 = to_str_arr(var39 .. "")
			elseif t.o then
				error(string.format("invalid replacement value (a %s)", type(var39)), 3)
			else
				var37 = { n = 0 }
			end
		end
		var38 = var48[0][2] - var48[0][1]
		var39 = math.min(var37.n, var38)
		
		for byteOffset = 0, var39 - 1 do
			var46[var48[0][1] + byteOffset] = var37[byteOffset + 1]
		end
		var40 = var48[0][1] + var39
		list = var48[0][2]
		
		if var37.n < var38 then
			for _ = 1, var38 - var37.n do
				table.remove(var46, var40)
				var46 -= 1
				list -= 1
			end
		elseif var38 < var37.n then
			for i_3 = 1, var37.n - var38 do
				table.insert(var46, var40 + i_3 - 1, var37[var39 + i_3])
				var46 += 1
				list += 1
			end
		end
		if var38 <= 0 then
			list += 1
		end
		var47 += 1
	until p24 < var47 + 1
	return from_str_arr(var46), var47
end

local var49 = "sub"

function t_1.sub(...)
	-- upvalues: tbl (ref), var49 (ref), t (ref), var35 (ref)
	local var50 = select("#", ...)
	
	if var50 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var50 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var51, var52, var53, var54, var55, var56 = ...
	
	if not tbl[var51] or tbl[var51].name ~= "RegEx" then
		if type(var51) ~= "string" and type(var51) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var49, typeof(var51)), 2)
		end
		var51 = t.fromstring(var51)
	elseif var49 == "sub" then
		if type(var53) == "number" then
			var53 ..= ""
		elseif type(var53) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var53)), 2)
		end
	elseif type(var52) == "number" then
		var52 ..= ""
	elseif type(var52) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var49, typeof(var52)), 2)
	end
	if var49 ~= "sub" and var49 ~= "split" then
		local var50 = typeof(var67)
		
		if var50 ~= "nil" then
			var67 = tonumber(var67)
			
			if var67 then
				var67 = if var67 < 0 then #var66 + math.floor(var67 + 0.5) + 1 else math.max(math.floor(var67 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var49, var50), 2)
			end
		end
	end
	var65 = tbl[var65]
	
	if var49 == "match" or var49 == "matchiter" then
		var68 = ...
	elseif var49 == "sub" then
		var70 = ...
	end
	return var35(var65, var66, var67, var68, var69, var70)
end

local var51 = function(p27, p28, p29)
	-- upvalues: to_str_arr (ref), re_rawfind (ref)
	if tonumber(p29) then
		p29 = tonumber(p29)
		
		if p29 <= -1 or p29 ~= p29 then
			p29 = 1e999
		end
	elseif p29 == nil then
		p29 = 1e999
	else
		error(string.format("invalid argument #3 to 'split' (number expected, got %s)", typeof(p29)), 3)
	end
	local var52 = to_str_arr(p28)
	var52 = 1
	local var53 = 0
	local t = {}
	local var54 = 0
	while var52 <= var52.n + 1 do
		var53 += 1
		local var55 = var53 <= p29 and re_rawfind(p27.token, var52, var52, p27.flags, p27.verb_flags, false)
		
		if not var55 then break end
		local s = var52.s
		local byteOffset = utf8.offset(s, var55[0][1])
		table.insert(t, string.sub(s, utf8.offset(s, var52 - var54), byteOffset and byteOffset - 1))
		var54 = if var55[0][2] <= var55[0][1] then 1 else 0
		var52 = var55[0][2] + var54
	end
	table.insert(t, string.sub(var52.s, utf8.offset(var52.s, var52 - var54)))
	
	return t
end

local var56 = "split"

function t_1.split(...)
	-- upvalues: tbl (ref), var56 (ref), t (ref), var51 (ref)
	local var57 = select("#", ...)
	
	if var57 < 1 then
		error("missing argument #1 (RegEx expected)", 2)
	elseif var57 < 2 then
		error("missing argument #2 (string expected)", 2)
	end
	local var58, var59, var60, var61, var62, var63 = ...
	
	if not tbl[var58] or tbl[var58].name ~= "RegEx" then
		if type(var58) ~= "string" and type(var58) ~= "number" then
			error(string.format("invalid argument #1 to %q (RegEx expected, got %s)", var56, typeof(var58)), 2)
		end
		var58 = t.fromstring(var58)
	elseif var56 == "sub" then
		if type(var60) == "number" then
			var60 ..= ""
		elseif type(var60) ~= "string" then
			error(string.format("invalid argument #3 to 'sub' (string expected, got %s)", typeof(var60)), 2)
		end
	elseif type(var59) == "number" then
		var59 ..= ""
	elseif type(var59) ~= "string" then
		error(string.format("invalid argument #2 to %q (string expected, got %s)", var56, typeof(var59)), 2)
	end
	if var56 ~= "sub" and var56 ~= "split" then
		local var57 = typeof(var67)
		
		if var57 ~= "nil" then
			var67 = tonumber(var67)
			
			if var67 then
				var67 = if var67 < 0 then #var66 + math.floor(var67 + 0.5) + 1 else math.max(math.floor(var67 + 0.5), 1)
			else
				error(string.format("invalid argument #3 to %q (number expected, got %s)", var56, var57), 2)
			end
		end
	end
	var65 = tbl[var65]
	
	if var56 == "match" or var56 == "matchiter" then
		var68 = ...
	elseif var56 == "sub" then
		var70 = ...
	end
	return var51(var65, var66, var67, var68, var69, var70)
end

local _ = function(p30, p31)
	-- upvalues: t_1 (write), tbl (ref)
	return t_1[p31] or tbl[p30].flags[p31]
end

local function re_tostr(p30)
	-- upvalues: tbl (ref)
	return tbl[p30].pattern_repr .. tbl[p30].flag_repr
end

local t_9 = {
	[58] = true,
	[33] = true,
	[61] = true,
	[62] = true,
	[124] = true
}

local function tokenize_ptn(p30, p31)
	-- upvalues: t_8 (ref), t_9 (ref), list_3 (ref), list_1 (ref), t_5 (ref), t_4 (ref), t_6 (ref), list_2 (ref), list (ref)
	if p31.unicode then
		return "options.unicodeData cannot be turned off while having unicode flag"
	end
	local var58 = 1
	local n = p30.n
	local var59 = 0
	local t = {}
	local t_1 = {}
	local t_2 = { newline = 1, newline_seq = 1, not_empty = 0 }
	local var60, byteOffset, v
	while var58 <= n do
		local var61, var62, s, substring, s_1, byteOffset_1, i
		var60 = p30[var58]
		
		if var60 ~= 40 then
			if var60 ~= 41 then
				if var60 == 46 then
					table.insert(t, list_1)
				elseif var60 ~= 91 then
					if var60 == 92 then
						var58 += 1
						var61 = p30[var58]
						
						if var61 then
							if var61 >= 48 and var61 <= 57 then
								var62 = var58
								while p30[var58 + 1] and (p30[var58 + 1] >= 48 and p30[var58 + 1] <= 57) do
									var58 += 1
								end
								byteOffset = p30.s
								byteOffset_1 = utf8.offset(byteOffset, var58 + 1)
								substring = tonumber(string.sub(byteOffset, utf8.offset(byteOffset, var62), byteOffset_1 and byteOffset_1 - 1))
								
								if var59 < substring and var58 ~= var62 then
									var58 = var62
									s = nil
									byteOffset = nil
									s_1 = nil
									
									if p30[var58] <= 55 then
										s = p30[var58] - 48
										var58 += 1
										
										if p30[var58] and p30[var58] >= 48 and p30[var58] <= 55 then
											byteOffset = p30[var58] - 48
											var58 += 1
											
											if p30[var58] and p30[var58] >= 48 and p30[var58] <= 55 then
												s_1 = p30[var58] - 48
											else
												var58 -= 1
											end
										else
											var58 -= 1
										end
									end
									if s and byteOffset then
										v = if s_1 then 64 * s + 8 * byteOffset + s_1 else 8 * s + byteOffset or (s or p30[var62])
									end
									table.insert(t, v)
								else
									table.insert(t, { "backref", substring })
								end
							elseif var61 ~= 69 then
								if var61 == 81 then
									var62 = var58 + 1
									repeat
										var58 = table.find(p30, 92, var58 + 1)
									until not (var58 and p30[var58 + 1] ~= 69)
									table.move(p30, var62, if var58 then var58 - 1 else #p30, #t + 1, t)
									
									if not var58 then break end
									var58 += 1
								elseif var61 ~= 78 then
									if var61 ~= 80 and var61 ~= 112 then
										if var61 == 103 and (p30[var58 + 1] == 123 or p30[var58 + 1] >= 48 and p30[var58 + 1] <= 57) then
											var62 = false
											var58 += 1
											
											if p30[var58] == 123 then
												var58 += 1
												var62 = true
											elseif p30[var58] >= 48 and p30[var58] <= 57 then
												substring = var58
												while p30[var58] and (p30[var58] >= 48 and p30[var58] <= 57 or p30[var58] >= 65 and p30[var58] <= 70 or p30[var58] >= 97 and p30[var58] <= 102) do
													var58 += 1
												end
												if not var62 or p30[var58] == 125 then
													s_1 = p30.s
													i = utf8.offset(s_1, var58 + (if var62 then 0 else 1))
													table.insert(t, {
														"backref",
														tonumber(string.sub(s_1, utf8.offset(s_1, substring), i and i - 1))
													})
													
													if not var62 then
														var58 -= 1
													end
												end
												return "malformed reference code"
											end
											return "malformed reference code"
										elseif var61 == 111 then
											var58 += 1
											
											if p30[var58 + 1] == 123 then
												var58 += 1
												var62 = var58
												while p30[var58] and (p30[var58] >= 48 and p30[var58] <= 55) do
													var58 += 1
												end
												if p30[var58] == 125 and var58 ~= var62 then
													byteOffset = p30.s
													byteOffset_1 = utf8.offset(byteOffset, var58)
													substring = tonumber(string.sub(byteOffset, utf8.offset(byteOffset, var62), byteOffset_1 and byteOffset_1 - 1), 8)
													
													if substring <= 65535 then
														table.insert(t, substring)
													end
													return "character offset too large"
												end
												return "malformed octal code"
											end
											return "malformed octal code"
										elseif var61 == 120 then
											var62 = nil
											substring = nil
											var58 += 1
											
											if p30[var58] == 123 then
												var58 += 1
												s = var58
												while p30[var58] and (p30[var58] >= 48 and p30[var58] <= 57 or p30[var58] >= 65 and p30[var58] <= 70 or p30[var58] >= 97 and p30[var58] <= 102) do
													var58 += 1
												end
												if p30[var58] == 125 and var58 ~= s then
													if var58 - s <= 4 then
														v = p30.s
														local byteOffset_2 = utf8.offset(v, var58)
														table.insert(t, tonumber(string.sub(v, utf8.offset(v, s), byteOffset_2 and byteOffset_2 - 1), 16))
													end
													return "character offset too large"
												end
												return "malformed hexadecimal code"
											elseif p30[var58] and (p30[var58] >= 48 and p30[var58] <= 57 or p30[var58] >= 65 and p30[var58] <= 70 or p30[var58] >= 97 and p30[var58] <= 102) then
												s = p30[var58]
												byteOffset = if p30[var58] >= 65 and p30[var58] <= 90 then 55 elseif p30[var58] >= 97 and p30[var58] <= 122 then 87 else 48
												var62 = s - byteOffset
												var58 += 1
												
												if p30[var58] and (p30[var58] >= 48 and p30[var58] <= 57 or p30[var58] >= 65 and p30[var58] <= 70 or p30[var58] >= 97 and p30[var58] <= 102) then
													s = p30[var58]
													byteOffset = if p30[var58] >= 65 and p30[var58] <= 90 then 55 elseif p30[var58] >= 97 and p30[var58] <= 122 then 87 else 48
													substring = s - byteOffset
												else
													var58 -= 1
												end
											else
												var58 -= 1
											end
											if var62 then
												s_1 = if substring then 16 * var62 + substring else var62 or 0
											end
											table.insert(t, s_1)
										else
											table.insert(t, t_6[var61] or t_5[var61] or var61)
										end
									end
									return "options.unicodeData cannot be turned off when using \\p"
								elseif p30[var58 + 1] == 123 and p30[var58 + 2] == 85 and (p30[var58 + 3] == 43 and p31.unicode) then
									var58 += 4
									var62 = var58
									while p30[var58] and (p30[var58] >= 48 and p30[var58] <= 57 or p30[var58] >= 65 and p30[var58] <= 70 or p30[var58] >= 97 and p30[var58] <= 102) do
										var58 += 1
									end
									if p30[var58] == 125 and var58 ~= var62 then
										byteOffset = p30.s
										byteOffset_1 = utf8.offset(byteOffset, var58)
										table.insert(t, tonumber(string.sub(byteOffset, utf8.offset(byteOffset, var62), byteOffset_1 and byteOffset_1 - 1)))
									end
									return "malformed Unicode code point"
								else
									table.insert(t, t_5[78])
								end
							end
						end
						return "pattern may not end with a trailing backslash"
					elseif var60 == 42 or var60 == 43 or (var60 == 63 or var60 == 123) then
						var61 = nil
						var62 = nil
						
						if var60 == 123 then
							substring = var58 + 1
							s = nil
							while p30[var58 + 1] and (p30[var58 + 1] >= 48 and p30[var58 + 1] <= 57 or p30[var58 + 1] == 44 and not s and var58 + 1 ~= substring) do
								var58 += 1
								
								if p30[var58] == 44 then
									s = var58
								end
							end
							if p30[var58 + 1] == 125 then
								var58 += 1
								
								if s then
									byteOffset_1 = p30.s
									i = utf8.offset(byteOffset_1, s)
									var61 = tonumber(string.sub(byteOffset_1, utf8.offset(byteOffset_1, substring), i and i - 1))
									
									if s + 1 == var58 then
										byteOffset = 1e999
									else
										byteOffset_1 = p30.s
										v = utf8.offset(byteOffset_1, var58)
										byteOffset = tonumber(string.sub(byteOffset_1, utf8.offset(byteOffset_1, s + 1), v and v - 1))
									end
									var62 = byteOffset
									
									if var62 >= var61 then
										if var61 then
											substring = if p31.ungreedy then "lazy" else "greedy"
											
											if p30[var58 + 1] == 43 or p30[var58 + 1] == 63 then
												var58 += 1
												substring = if p30[var58] == 43 then "possessive" elseif p31.ungreedy then "greedy" else "lazy"
											end
											s = #t
											byteOffset = t[s]
											
											if byteOffset and (type(byteOffset) ~= "table" or byteOffset[1] ~= "quantifier" and byteOffset[1] ~= 40 and not t_6[byteOffset[1]]) and (byteOffset ~= list_3 and type(byteOffset) ~= "string") then
												if var62 == 0 then
													table.remove(t)
												elseif var61 ~= 1 or var62 ~= 1 then
													if type(byteOffset) == "table" and byteOffset[1] == 41 then
														s = byteOffset[3]
													end
													t[s] = {
														"quantifier",
														var61,
														var62,
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
									byteOffset_1 = p30.s
									i = utf8.offset(byteOffset_1, var58)
									var61 = tonumber(string.sub(byteOffset_1, utf8.offset(byteOffset_1, substring), i and i - 1))
									var62 = var61
								end
							else
								table.move(p30, substring - 1, var58, #t + 1, t)
							end
						else
							var61 = if var60 == 43 then 1 else 0
							var62 = if var60 == 63 then 1 else 1e999
						end
					elseif var60 == 124 then
						table.insert(t, list_3)
						var61 = #t
						repeat
							var61 -= 1
							var62 = t[var61]
							substring = type(t[var61]) == "table"
							if substring and var62[1] == 41 then
								var61 = t[var61][3]
							elseif substring and var62[1] == 40 then
								if var62[4] ~= 124 then break end
								var59 = var62[5]
								break
						until not var62
					elseif var60 == 36 or var60 == 94 then
						table.insert(t, if var60 == 94 then list_2 else list)
					elseif p31.ignoreCase and var60 >= 97 and var60 <= 122 then
						table.insert(t, var60 - 32)
					elseif not p31.extended or (var60 < 9 or var60 > 13) and (var60 ~= 32 and var60 ~= 35) then
						table.insert(t, var60)
					elseif var60 == 35 then
						repeat
							var58 += 1
						until not (p30[var58] and p30[var58] ~= 10 and p30[var58] ~= 13)
					end
				end
				var61 = false
				var62 = nil
				var58 += 1
				substring = var58
				
				if p30[var58] == 94 then
					var61 = true
					var58 += 1
				elseif p30[var58] == 46 or p30[var58] == 58 or p30[var58] == 61 then
					var62 = p30[var58]
				end
				s = nil
				
				if p30[var58] == 91 or p30[var58] == 92 then
					s = {}
				else
					s = { p30[var58] }
					var58 += 1
				end
				while p30[var58] ~= 93 do
					if p30[var58] then
						if p30[var58] == 45 and s[1] and type(s[1]) == "number" then
							if p30[var58 + 1] == 93 then
								table.insert(s, 1, 45)
							else
								var58 += 1
								byteOffset = p30[var58]
								
								if byteOffset == 91 then
									if p30[var58 + 1] == 46 or p30[var58 + 1] == 58 or p30[var58 + 1] == 61 then
										s_1 = var58 + 2
										repeat
											s_1 = table.find(p30, 93, s_1)
										until not (s_1 and p30[s_1 - 1] == 92)
										if s_1 then
											if p30[s_1 - 1] ~= p30[var58 + 1] or s_1 - 1 == var58 + 1 then
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
									var58 += 1
									
									if p30[var58] == 120 then
										s_1 = nil
										byteOffset_1 = nil
										var58 += 1
										
										if p30[var58] and p30[var58] >= 48 and p30[var58] <= 57 or (p30[var58] >= 65 and p30[var58] <= 70 or p30[var58] >= 97 and p30[var58] <= 102) then
											i = p30[var58]
											v = if p30[var58] >= 65 and p30[var58] <= 90 then 55 elseif p30[var58] >= 97 and p30[var58] <= 122 then 87 else 48
											s_1 = i - v
											var58 += 1
											
											if p30[var58] and p30[var58] >= 48 and p30[var58] <= 57 or (p30[var58] >= 65 and p30[var58] <= 70 or p30[var58] >= 97 and p30[var58] <= 102) then
												i = p30[var58]
												v = if p30[var58] >= 65 and p30[var58] <= 90 then 55 elseif p30[var58] >= 97 and p30[var58] <= 122 then 87 else 48
												byteOffset_1 = i - v
											else
												var58 -= 1
											end
										else
											var58 -= 1
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
									elseif p30[var58] >= 48 and p30[var58] <= 55 then
										s_1 = p30[var58] - 48
										byteOffset_1 = nil
										i = nil
										var58 += 1
										
										if p30[var58] and p30[var58] >= 48 and p30[var58] <= 55 then
											byteOffset_1 = p30[var58] - 48
											var58 += 1
											
											if p30[var58] and p30[var58] >= 48 and p30[var58] <= 55 then
												i = p30[var58] - 48
											else
												var58 -= 1
											end
										else
											var58 -= 1
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
										byteOffset = t_5[p30[var58]] or p30[var58]
										
										if type(byteOffset) == "number" then
										end
										return "invalid range in character class"
									end
								elseif byteOffset >= s[1] then
								end
								return "invalid range in character class"
							end
						elseif p30[var58] == 91 then
							if p30[var58 + 1] == 46 or p30[var58 + 1] == 58 or p30[var58 + 1] == 61 then
								byteOffset = var58 + 2
								repeat
									byteOffset = table.find(p30, 93, byteOffset)
								until not (byteOffset and p30[byteOffset - 1] == 92)
								if byteOffset then
									if p30[byteOffset - 1] == p30[var58 + 1] and byteOffset - 1 ~= var58 + 1 then
										if p30[byteOffset - 1] ~= 46 and p30[byteOffset - 1] ~= 61 then
											if p30[byteOffset - 1] == 58 then
												s_1 = p30[var58 + 3] == 94
												i = p30.s
												local byteOffset_2 = utf8.offset(i, byteOffset - 1)
												byteOffset_1 = string.sub(i, utf8.offset(i, var58 + (if s_1 then 3 else 2)), byteOffset_2 and byteOffset_2 - 1)
												
												if t_4[byteOffset_1] then
													table.insert(s, 1, { "class", byteOffset_1, s_1 })
													var58 = byteOffset
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
						elseif p30[var58] == 92 then
							var58 += 1
							
							if p30[var58] == 120 then
								byteOffset = nil
								s_1 = nil
								var58 += 1
								
								if p30[var58] == 123 then
									var58 += 1
									byteOffset_1 = var58
									while p30[var58] and (p30[var58] >= 48 and p30[var58] <= 57 or p30[var58] >= 65 and p30[var58] <= 70 or p30[var58] >= 97 and p30[var58] <= 102) do
										var58 += 1
									end
									if p30[var58] == 125 and var58 ~= byteOffset_1 then
										if var58 - byteOffset_1 <= 4 then
											local var63 = 1
											local s_2 = p30.s
											local byteOffset_2 = utf8.offset(s_2, var58)
											table.insert(s, var63, tonumber(string.sub(s_2, utf8.offset(s_2, byteOffset_1), byteOffset_2 and byteOffset_2 - 1), 16))
											continue
										end
										return "character offset too large"
									end
									return "malformed hexadecimal character"
								elseif p30[var58] and p30[var58] >= 48 and p30[var58] <= 57 or (p30[var58] >= 65 and p30[var58] <= 70 or p30[var58] >= 97 and p30[var58] <= 102) then
									byteOffset_1 = p30[var58]
									i = if p30[var58] >= 65 and p30[var58] <= 90 then 55 elseif p30[var58] >= 97 and p30[var58] <= 122 then 87 else 48
									byteOffset = byteOffset_1 - i
									var58 += 1
									
									if p30[var58] and p30[var58] >= 48 and p30[var58] <= 57 or (p30[var58] >= 65 and p30[var58] <= 70 or p30[var58] >= 97 and p30[var58] <= 102) then
										byteOffset_1 = p30[var58]
										i = if p30[var58] >= 65 and p30[var58] <= 90 then 55 elseif p30[var58] >= 97 and p30[var58] <= 122 then 87 else 48
										s_1 = byteOffset_1 - i
									else
										var58 -= 1
									end
								else
									var58 -= 1
								end
								local var64
								v = 1
								
								if byteOffset then
									var64 = if s_1 then 16 * byteOffset + s_1 else byteOffset or 0
								end
								table.insert(s, v, var64)
							elseif p30[var58] >= 48 and p30[var58] <= 55 then
								byteOffset = p30[var58] - 48
								s_1 = nil
								byteOffset_1 = nil
								var58 += 1
								
								if p30[var58] and p30[var58] >= 48 and p30[var58] <= 55 then
									s_1 = p30[var58] - 48
									var58 += 1
									
									if p30[var58] and p30[var58] >= 48 and p30[var58] <= 55 then
										byteOffset_1 = p30[var58] - 48
									else
										var58 -= 1
									end
								else
									var58 -= 1
								end
								local var65
								local var66 = 1
								
								if s_1 then
									var65 = if byteOffset_1 then 64 * byteOffset + 8 * s_1 + byteOffset_1 else 8 * byteOffset + s_1 or byteOffset
								end
								table.insert(s, var66, var65)
							elseif p30[var58] == 69 then
								var58 += 1
								continue
							elseif p30[var58] == 81 then
								byteOffset = var58 + 1
								repeat
									var58 = table.find(p30, 92, var58 + 1)
								until not (var58 and p30[var58 + 1] ~= 69)
								table.move(p30, byteOffset, if var58 then var58 - 1 else #p30, #t + 1, t)
								
								if not var58 then break end
								var58 += 1
							elseif p30[var58] == 78 then
								if p30[var58 + 1] == 123 and p30[var58 + 2] == 85 and (p30[var58 + 3] == 43 and p31.unicode) then
									var58 += 4
									byteOffset = var58
									while p30[var58] and (p30[var58] >= 48 and p30[var58] <= 57 or p30[var58] >= 65 and p30[var58] <= 70 or p30[var58] >= 97 and p30[var58] <= 102) do
										var58 += 1
									end
									if p30[var58] == 125 and var58 ~= byteOffset then
										i = p30.s
										local byteOffset_2 = utf8.offset(i, var58)
										table.insert(s, 1, tonumber(string.sub(i, utf8.offset(i, byteOffset), byteOffset_2 and byteOffset_2 - 1)))
										continue
									end
									return "malformed Unicode code point"
								end
								return "invalid escape sequence"
							elseif p30[var58] ~= 80 and p30[var58] ~= 112 then
								if p30[var58] == 111 then
									var58 += 1
									
									if p30[var58] == 123 then
										var58 += 1
										byteOffset = var58
										while p30[var58] and (p30[var58] >= 48 and p30[var58] <= 55) do
											var58 += 1
										end
										if p30[var58] == 125 and var58 ~= byteOffset then
											i = p30.s
											local byteOffset_2 = utf8.offset(i, var58)
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
									byteOffset = t_5[p30[var58]]
									table.insert(s, 1, if type(byteOffset) == "string" then { "class", byteOffset, false } else byteOffset or p30[var58])
								end
							end
							return "options.unicodeData cannot be turned off when using \\p"
						elseif p31.ignoreCase and p30[var58] >= 97 and p30[var58] <= 122 then
							table.insert(s, 1, p30[var58] - 32)
						else
							table.insert(s, 1, p30[var58])
						end
					end
					return "unterminated character class"
				end
				if p30[var58 - 1] ~= var62 or var58 - 1 == substring then
					if s[2] or var61 then
						table.insert(t, { "charset", var61, s })
					else
						table.insert(t, s[1])
					end
				end
				return if var62 == 58 then "POSIX named classes are only support within a character set" else "POSIX collating elements aren't supported"
				var58 += 1
				continue
			end
			var61 = #t + 1
			var62 = -1
			substring = 0
			s = 0
			byteOffset = 0
			repeat
				var61 -= 1
				s_1 = t[var61]
				byteOffset_1 = type(t[var61]) == "table"
				if byteOffset_1 and s_1[1] == 40 then
					byteOffset += 1
					
					if substring and s_1.count then
						substring += s_1.count
					end
					if not s_1[3] then
						if s_1[4] == 124 then
							var59 = s_1[5] + math.max(s, byteOffset)
						end
						if substring == var62 or var62 == -1 then
							var62 = substring
							break
						end
						var62 = nil
						break
				elseif s_1 == list_3 then
					if substring == var62 or var62 == -1 then
						var62 = substring
						substring = 0
					else
						var62 = nil
						substring = nil
					end
					s = math.max(s, byteOffset)
					byteOffset = 0
				elseif substring then
					substring = if byteOffset_1 and s_1[1] == "quantifier" then if s_1[2] == s_1[3] then substring + s_1[2] else nil else substring + 1
				end
			until var61 < 1
			if var61 >= 1 then
				s_1 = t[var61]
				byteOffset_1 = #t + 1
				i = {
					41,
					s_1[2],
					var61,
					s_1[4],
					s_1[5],
					count = var62
				}
				
				if s_1[4] ~= 33 and s_1[4] ~= 61 or (not s_1[5] or var62) then
					s_1[3] = byteOffset_1
					table.insert(t, i)
				end
				return "lookbehind assertion is not fixed width"
			end
			return "unmatched ) in regular expression"
		end
		var61 = nil
		
		if p30[var58 + 1] == 42 then
			var58 += 2
			var62 = var58
			while p30[var58] and (p30[var58] >= 48 and p30[var58] <= 57 or p30[var58] >= 65 and p30[var58] <= 90 or (p30[var58] >= 97 and p30[var58] <= 122 or (p30[var58] == 95 or p30[var58] == 58))) do
				var58 += 1
			end
			if p30[var58] == 41 or p30[var58 - 1] == 58 then
				s = p30.s
				byteOffset = utf8.offset(s, var58)
				substring = string.sub(s, utf8.offset(s, var62), byteOffset and byteOffset - 1)
				
				if substring == "positive_lookahead:" or substring == "negative_lookhead:" or (substring == "positive_lookbehind:" or substring == "negative_lookbehind:") or substring:find("^[pn]l[ab]:$") then
					var61 = {
						40,
						nil,
						nil,
						if substring:find("^n") then 33 else 61,
						substring:find("b", 3, true) and 1
					}
				elseif substring == "atomic:" then
					var61 = {
						40,
						nil,
						nil,
						62,
						nil
					}
				elseif substring == "ACCEPT" or substring == "FAIL" or (substring == "F" or substring == "PRUNE") or substring == "SKIP" then
					var61 = if substring == "F" then "FAIL" else substring
				elseif t_8[substring] then
					t_2.newline = substring
				elseif substring == "BSR_ANYCRLF" or substring == "BSR_UNICODE" then
					t_2.newline_seq = if substring == "BSR_UNICODE" then 1 else 0
				elseif substring == "NOTEMPTY" or substring == "NOTEMPTY_ATSTART" then
					t_2.not_empty = if substring == "NOTEMPTY" then 1 else 2
				end
				return "unknown or malformed verb"
				if not t[1] then
					if var61 then
						table.insert(t, var61)
					end
				end
				return "this verb must be placed at the beginning of the regex"
			end
			return "quantifier doesn't follow a repeatable pattern"
		elseif p30[var58 + 1] == 63 then
			var58 += 2
			
			if p30[var58] == 35 then
				var62 = table.find(p30, 41, var58)
				
				if var62 then
					var58 = var62 + 1
					continue
				end
				return "unterminated parenthetical"
			elseif p30[var58] then
				var61 = {
					40,
					nil,
					nil,
					p30[var58],
					nil
				}
				
				if p30[var58] == 48 and p30[var58 + 1] == 41 then
					var62 = "recurmatch"
					substring = 0
					s = 0
					byteOffset = nil
					var61[1] = var62
					var61[2] = substring
					var61[3] = s
					var61[5] = byteOffset
				elseif p30[var58] > 48 and p30[var58] <= 57 then
					var62 = var58
					var58 += 1
					while p30[var58] >= 48 and p30[var58] <= 48 do
						var58 += 1
					end
					if p30[var58] == 41 then
						substring = "recurmatch"
						s_1 = p30.s
						byteOffset_1 = utf8.offset(s_1, var58)
						s = tonumber(string.sub(s_1, utf8.offset(s_1, var62), byteOffset_1 and byteOffset_1 - 1))
						byteOffset = nil
						var61[1] = substring
						var61[2] = s
						var61[4] = byteOffset
					end
					return "invalid group structure"
				elseif p30[var58] == 60 and p30[var58 + 1] == 33 or p30[var58 + 1] == 61 then
					var58 += 1
					substring = 1
					var61[4] = p30[var58]
					var61[5] = substring
				elseif p30[var58] == 124 then
					var61[5] = var59
				elseif p30[var58] == 80 or p30[var58] == 60 or p30[var58] == 39 then
					if p30[var58] == 80 then
						var58 += 1
					end
					if p30[var58] == 61 then
						var62 = var58 + 1
						while p30[var58] and (p30[var58] >= 48 and p30[var58] <= 57 or p30[var58] >= 65 and p30[var58] <= 90 or (p30[var58] >= 97 and p30[var58] <= 122 or p30[var58] == 95)) do
							var58 += 1
						end
						if p30[var58] then
							if p30[var58] == 41 and var58 ~= var62 then
								substring = {}
								s = "backref"
								s_1 = p30.s
								byteOffset_1 = utf8.offset(s_1, var58)
								-- Unknown statement at pc 4: <SetList>
								var61 = substring
							end
							return "invalid group structure"
						end
						return "unterminated parenthetical"
					elseif p30[var58] == 60 or p30[var58 - 1] ~= 80 and p30[var58] == 39 then
						var62 = if p30[var58] == 39 then 39 else 62
						substring = var58 + 1
						var58 += 1
						
						if p30[var58] ~= 41 then
							if p30[var58] < 48 or p30[var58] > 57 then
								if p30[var58] >= 65 and p30[var58] <= 90 or p30[var58] >= 97 and p30[var58] <= 122 or p30[var58] == 95 then
									var58 += 1
									while p30[var58] and (p30[var58] >= 48 and p30[var58] <= 57 or p30[var58] >= 65 and p30[var58] <= 90 or (p30[var58] >= 97 and p30[var58] <= 122 or p30[var58] == 95)) do
										var58 += 1
									end
									if p30[var58] then
										if p30[var58] == var62 then
											byteOffset = p30.s
											byteOffset_1 = utf8.offset(byteOffset, var58)
											s = string.sub(byteOffset, utf8.offset(byteOffset, substring), byteOffset_1 and byteOffset_1 - 1)
											var59 += 1
											
											if (t_1[s] or var59) == var59 then
												for i, v in pairs(t_1) do
													if s ~= i and var59 == v then
														return "different names for subpatterns of the same number aren't permitted"
													end
												end
												t_1[s] = var59
												byteOffset = nil
												var61[2] = var59
												var61[4] = byteOffset
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
				elseif t_9[p30[var58]] then
				end
				return "invalid group structure"
			end
			return "unterminated parenthetical"
		else
			var59 += 1
			var61 = { 40, var59, nil, nil }
		end
	end
	var60 = 0
	
	for s, byteOffset in ipairs(t) do
		if type(byteOffset) ~= "table" or byteOffset[1] ~= 40 and (byteOffset[1] ~= "quantifier" or type(byteOffset[5]) ~= "table" or byteOffset[5][1] ~= 40) then
			if type(byteOffset) == "table" and (byteOffset[1] == "backref" or byteOffset[1] == "recurmatch") then
				if t_1[byteOffset[2]] or type(byteOffset[2]) == "number" and var59 >= byteOffset[2] then
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
				var60 = math.max(var60, byteOffset[2])
			end
		end
		return "unterminated parenthetical"
	end
	t.group_n = var60
	
	return t, t_1, t_2
end

if not tonumber(256) then
	error(string.format("expected number for options.cacheSize, got %s", "number"), 2)
end
local var67 = tonumber(256)
local list_4 = nil
local list_5 = nil

if var67 then
	if var67 < 0 or var67 ~= var67 then
		error("cache size cannot be a negative number or a NaN", 2)
	elseif var67 == 1e999 then
		list_4 = { nil }
		list_5 = { nil }
	elseif var67 >= 4294967296 then
		error("cache size too large", 2)
	else
		list_4 = table.create(256)
		list_5 = table.create(256)
	end
end
if var67 then
	function t.pruge()
		-- upvalues: list_5 (write), list_4 (write)
		table.clear(list_5)
		table.clear(list_4)
	end
end
local function new_re(p32, p33, p34, p35)
	-- upvalues: var67 (ref), list_4 (write), list_5 (write), tokenize_ptn (ref), tbl (ref), t_1 (write), re_tostr (ref), var1 (write)
	local var68, var69, var70
	local _ = nil
	local _ = nil
	local _ = nil
	local var71 = var67 and string.format("%s|%s", p32.s, p34)
	local var72 = var67 and list_4[table.find(list_5, var71)]
	
	if var72 then
		local unpacked, unpacked_1, unpacked_2 = table.unpack(var72, 1, 3)
		var68 = unpacked
		var69 = unpacked_1
		var70 = unpacked_2
	else
		local var73, var74, var75 = tokenize_ptn(p32, p33)
		var68 = var73
		var69 = var74
		var70 = var75
		
		if type(var68) == "string" then
			error(var68, 2)
		end
		if var67 and var68[1] then
			table.insert(list_5, 1, var71)
			table.insert(list_4, 1, { var68, var69, var70 })
			
			if var67 ~= 1e999 then
				table.remove(list_5, var67 + 1)
				table.remove(list_4, var67 + 1)
			end
		end
	end
	local var76 = newproxy(true)
	tbl[var76] = {
		name = "RegEx",
		flags = p33,
		flag_repr = p34,
		pattern_repr = p35,
		token = var68,
		group_id = var69,
		verb_flags = var70
	}
	local var77 = getmetatable(var76)
	var77.__index = setmetatable(p33, t_1)
	var77.__tostring = re_tostr
	var77.__metatable = var1
	
	return var76
end

local function escape_fslash(p32)
	return (if #p32 % 2 == 0 then "\\" else "") .. p71 .. "."
end

local function sort_flag_chr(p32, p33)
	return p32:lower() < p33:lower()
end

function t.new(...)
	-- upvalues: t_3 (ref), sort_flag_chr (ref), new_re (ref), to_str_arr (ref), escape_fslash (ref)
	if select("#", ...) == 0 then
		error("missing argument #1 (string expected)", 2)
	end
	local var68, var69 = ...
	
	if type(var68) == "number" then
		var68 ..= ""
	elseif type(var68) ~= "string" then
		error(string.format("invalid argument #1 (string expected, got %s)", typeof(var68)), 2)
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

function t.fromstring(...)
	-- upvalues: to_str_arr (ref), t_3 (ref), sort_flag_chr (ref), new_re (ref)
	if select("#", ...) == 0 then
		error("missing argument #1 (string expected)", 2)
	end
	local var68 = ...
	
	if type(var68) == "number" then
		var68 ..= ""
	elseif type(var68) ~= "string" then
		error(string.format("invalid argument #1 (string expected, got %s)", typeof(var68), 2))
	end
	local var68 = to_str_arr(var185)
	local var69 = var68[1]
	
	if not var69 then
		error("empty regex", 2)
	elseif var69 == 92 or var69 >= 48 and var69 <= 57 or (var69 >= 65 and var69 <= 90 or var69 >= 97 and var69 <= 122) then
		error("delimiter must not be alphanumeric or a backslash", 2)
	end
	local var70 = 1
	local var71
	repeat
		var70 = table.find(var68, var69, var70 + 1)
		if not var70 then
			error(string.format("no ending delimiter ('%s') found", utf8.char(var69)), 2)
		end
		var71 = 1
		while var68[var70 - var71] == 92 do
			var71 += 1
		end
	until var71 % 2 == 1
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
	while var70 < var68.n do
		local char = utf8.char(table.remove(var68))
		var68.n -= 1
		
		if t[t_3[char]] ~= false then
			error("invalid regular expression flag " .. char, 3)
		end
		t[t_3[char]] = true
		table.insert(t_1, char)
	end
	table.sort(t_1, sort_flag_chr)
	local joined = table.concat(t_1)
	table.remove(var68, 1)
	table.remove(var68)
	var68.n -= 2
	var68.s = string.sub(var68.s, 2, 1 + var68.n)
	
	return new_re(var68, t, joined, string.sub(var185, 1, 2 + var68.n))
end

local t_10 = {
	["\0"] = "\\x00",
	["\n"] = "\\n",
	["\t"] = "\\t",
	["\r"] = "\\r",
	["\f"] = "\\f"
}

function t.escape(...)
	-- upvalues: t_10 (ref)
	if select("#", ...) == 0 then
		error("missing argument #1 (string expected)", 2)
	end
	local var72, var73, var74 = ...
	
	if type(var72) == "number" then
		var72 ..= ""
	elseif type(var72) ~= "string" then
		error(string.format("invalid argument #1 to 'escape' (string expected, got %s)", typeof(var72)), 2)
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

function t.type(...)
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
var1 = t.fromstring("/The\\s*metatable\\s*is\\s*(?:locked|inaccessible)(?#Nice try :])/i")
getmetatable(var1).__metatable = var1

local function readonly_table()
	error("Attempt to modify a readonly table", 2)
end

t.Match = setmetatable({}, {
	__index = t_2,
	__metatable = var1,
	__newindex = readonly_table
})

return setmetatable({}, {
	__index = t,
	__metatable = var1,
	__newindex = readonly_table
})