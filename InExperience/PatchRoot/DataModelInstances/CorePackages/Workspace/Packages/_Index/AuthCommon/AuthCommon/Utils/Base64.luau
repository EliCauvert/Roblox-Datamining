local t = {
	MakeEncoder = function(p0, p1, p2) --[[ line: 8 ]]
		local t = {}
		
		for i, v in pairs({
			[0] = "A",
			"B",
			"C",
			"D",
			"E",
			"F",
			"G",
			"H",
			"I",
			"J",
			"K",
			"L",
			"M",
			"N",
			"O",
			"P",
			"Q",
			"R",
			"S",
			"T",
			"U",
			"V",
			"W",
			"X",
			"Y",
			"Z",
			"a",
			"b",
			"c",
			"d",
			"e",
			"f",
			"g",
			"h",
			"i",
			"j",
			"k",
			"l",
			"m",
			"n",
			"o",
			"p",
			"q",
			"r",
			"s",
			"t",
			"u",
			"v",
			"w",
			"x",
			"y",
			"z",
			"0",
			"1",
			"2",
			"3",
			"4",
			"5",
			"6",
			"7",
			"8",
			"9",
			p0 or "+",
			p1 or "/",
			p2 or "="
		}) do
			t[i] = v:byte()
		end
		return t
	end
}

function t.MakeDecoder(p3, p4, p5) --[[ line: 82 ]]
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in pairs(t.MakeEncoder(p3, p4, p5)) do
		t_1[v] = i
	end
	return t_1
end

local var1 = t.MakeEncoder()
local var2 = t.MakeDecoder()
local char = string.char
local concat = table.concat
local extract = bit32.extract

function t.Encode(p6, p7, p8) --[[ line: 97 ]]
	-- upvalues: var1 (ref), extract (ref), char (ref), concat (ref)
	p7 = p7 or var1
	local t = {}
	local var7 = 1
	local p6Count = #p6
	local var9 = p6Count % 3
	local t_1 = {}
	
	for i = 1, p6Count - var9, 3 do
		local var15
		local var11, var12, var13 = p6:byte(i, i + 2)
		local var14 = var11 * 65536 + var12 * 256 + var13
		local _ = nil
		
		if p8 then
			var15 = t_1[var14]
			
			if not var15 then
				var15 = char(p7[extract(var14, 18, 6)], p7[extract(var14, 12, 6)], p7[extract(var14, 6, 6)], p7[extract(var14, 0, 6)])
				t_1[var14] = var15
			end
		else
			var15 = char(p7[extract(var14, 18, 6)], p7[extract(var14, 12, 6)], p7[extract(var14, 6, 6)], p7[extract(var14, 0, 6)])
		end
		t[var7] = var15
		var7 += 1
	end
	if var9 == 2 then
		local var16, var17 = p6:byte(p6Count - 1, p6Count)
		local var18 = var16 * 65536 + var17 * 256
		t[var7] = char(p7[extract(var18, 18, 6)], p7[extract(var18, 12, 6)], p7[extract(var18, 6, 6)], p7[64])
	elseif var9 == 1 then
		local var19 = p6:byte(p6Count) * 65536
		t[var7] = char(p7[extract(var19, 18, 6)], p7[extract(var19, 12, 6)], p7[64], p7[64])
	end
	return concat(t)
end

function t.EncodeUrl(p9, p10) --[[ line: 152 ]]
	-- upvalues: t (ref)
	return t.ToUrlSafeBase64(t.Encode(p9, nil, p10))
end

function t.Decode(p11, p12, p13) --[[ line: 158 ]]
	-- upvalues: var2 (ref), char (ref), extract (ref), concat (ref)
	p12 = p12 or var2
	local var21 = nil
	local var22 = nil
	
	for i, v in pairs(p12) do
		if v == 62 then
			var21 = i
		elseif v == 63 then
			var22 = i
		end
	end
	local var23 = p11:gsub(("[^%%w%%%s%%%s%%=]"):format(char(var21), char(var22)), "")
	local t = {}
	local t_1 = {}
	local var26 = 1
	local var23Count = #var23
	local var28 = if var23:sub(-2) == "==" then 2 elseif var23:sub(-1) == "=" then 1 else 0
	
	for i_1 = 1, if var28 > 0 then var23Count - 4 else var23Count, 4 do
		local var34
		local var29, var30, var31, var32 = var23:byte(i_1, i_1 + 3)
		local _ = nil
		
		if p13 then
			local var33 = var29 * 16777216 + var30 * 65536 + var31 * 256 + var32
			var34 = t[var33]
			
			if not var34 then
				local var35 = p12[var29] * 262144 + p12[var30] * 4096 + p12[var31] * 64 + p12[var32]
				var34 = char(extract(var35, 16, 8), extract(var35, 8, 8), extract(var35, 0, 8))
				t[var33] = var34
			end
		else
			local var36 = p12[var29] * 262144 + p12[var30] * 4096 + p12[var31] * 64 + p12[var32]
			var34 = char(extract(var36, 16, 8), extract(var36, 8, 8), extract(var36, 0, 8))
		end
		t_1[var26] = var34
		var26 += 1
	end
	if var28 == 1 then
		local var37, var38, var39 = var23:byte(var23Count - 3, var23Count - 1)
		local var40 = p12[var37] * 262144 + p12[var38] * 4096 + p12[var39] * 64
		t_1[var26] = char(extract(var40, 16, 8), extract(var40, 8, 8))
	elseif var28 == 2 then
		local var41, var42 = var23:byte(var23Count - 3, var23Count - 2)
		t_1[var26] = char(extract(p12[var41] * 262144 + p12[var42] * 4096, 16, 8))
	end
	return concat(t_1)
end

function t.DecodeUrl(p14, p15) --[[ line: 213 ]]
	-- upvalues: t (ref)
	return t.Decode(t.FromUrlSafeBase64(p14), nil, p15)
end

function t.ToUrlSafeBase64(p16) --[[ line: 218 ]]
	return string.gsub(string.gsub(string.gsub(p16, "+", "-"), "/", "_"), "=", "")
end

function t.FromUrlSafeBase64(p17) --[[ line: 225 ]]
	local var43 = p17:gsub("[^%w%-_]", "")
	
	return string.gsub(string.gsub(var43 .. string.rep("=", (4 - #var43 % 4) % 4), "_", "/"), "-", "+")
end

return t