local t = {
	MakeEncoder = function(p1, p2, p3)
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
			p1 or "+",
			p2 or "/",
			p3 or "="
		}) do
			t[i] = v:byte()
		end
		return t
	end
}

function t.MakeDecoder(p4, p5, p6)
	-- upvalues: t (ref)
	local t_1 = {}
	
	for i, v in pairs(t.MakeEncoder(p4, p5, p6)) do
		t_1[v] = i
	end
	return t_1
end

local var1 = t.MakeEncoder()
local var2 = t.MakeDecoder()
local char = string.char
local concat = table.concat
local extract = bit32.extract

function t.Encode(p7, p8, p9)
	-- upvalues: var1 (ref), extract (ref), char (ref), concat (ref)
	p8 = p8 or var1
	local t = {}
	local var3 = 1
	local p6Count = #p7
	local var4 = p6Count % 3
	local t_1 = {}
	
	for i = 1, p6Count - var4, 3 do
		local var5
		local var6, var7, var8 = p7:byte(i, i + 2)
		local var9 = var6 * 65536 + var7 * 256 + var8
		local _ = nil
		
		if p9 then
			var5 = t_1[var9]
			
			if not var5 then
				var5 = char(p8[extract(var9, 18, 6)], p8[extract(var9, 12, 6)], p8[extract(var9, 6, 6)], p8[extract(var9, 0, 6)])
				t_1[var9] = var5
			end
		else
			var5 = char(p8[extract(var9, 18, 6)], p8[extract(var9, 12, 6)], p8[extract(var9, 6, 6)], p8[extract(var9, 0, 6)])
		end
		t[var3] = var5
		var3 += 1
	end
	if var4 == 2 then
		local var10, var11 = p7:byte(p6Count - 1, p6Count)
		local var12 = var10 * 65536 + var11 * 256
		t[var3] = char(p8[extract(var12, 18, 6)], p8[extract(var12, 12, 6)], p8[extract(var12, 6, 6)], p8[64])
	elseif var4 == 1 then
		local var13 = p7:byte(p6Count) * 65536
		t[var3] = char(p8[extract(var13, 18, 6)], p8[extract(var13, 12, 6)], p8[64], p8[64])
	end
	return concat(t)
end

function t.EncodeUrl(p10, p11)
	-- upvalues: t (ref)
	return t.ToUrlSafeBase64(t.Encode(p10, nil, p11))
end

function t.Decode(p10, p11, p12)
	-- upvalues: var2 (ref), char (ref), extract (ref), concat (ref)
	p11 = p11 or var2
	local var14 = nil
	local var15 = nil
	
	for i, v in pairs(p11) do
		if v == 62 then
			var14 = i
		elseif v == 63 then
			var15 = i
		end
	end
	local var16 = p10:gsub(("[^%%w%%%s%%%s%%=]"):format(char(var14), char(var15)), "")
	local t = {}
	local t_1 = {}
	local var17 = 1
	local var23Count = #var16
	local var18 = if var16:sub(-2) == "==" then 2 elseif var16:sub(-1) == "=" then 1 else 0
	
	for i_1 = 1, if var18 > 0 then var23Count - 4 else var23Count, 4 do
		local var19
		local var20, var21, var22, var23 = var16:byte(i_1, i_1 + 3)
		local _ = nil
		
		if p12 then
			local var24 = var20 * 16777216 + var21 * 65536 + var22 * 256 + var23
			var19 = t[var24]
			
			if not var19 then
				local var25 = p11[var20] * 262144 + p11[var21] * 4096 + p11[var22] * 64 + p11[var23]
				var19 = char(extract(var25, 16, 8), extract(var25, 8, 8), extract(var25, 0, 8))
				t[var24] = var19
			end
		else
			local var26 = p11[var20] * 262144 + p11[var21] * 4096 + p11[var22] * 64 + p11[var23]
			var19 = char(extract(var26, 16, 8), extract(var26, 8, 8), extract(var26, 0, 8))
		end
		t_1[var17] = var19
		var17 += 1
	end
	if var18 == 1 then
		local var27, var28, var29 = var16:byte(var23Count - 3, var23Count - 1)
		local var30 = p11[var27] * 262144 + p11[var28] * 4096 + p11[var29] * 64
		t_1[var17] = char(extract(var30, 16, 8), extract(var30, 8, 8))
	elseif var18 == 2 then
		local var31, var32 = var16:byte(var23Count - 3, var23Count - 2)
		t_1[var17] = char(extract(p11[var31] * 262144 + p11[var32] * 4096, 16, 8))
	end
	return concat(t_1)
end

function t.DecodeUrl(p13, p14)
	-- upvalues: t (ref)
	return t.Decode(t.FromUrlSafeBase64(p13), nil, p14)
end

function t.ToUrlSafeBase64(p13)
	return string.gsub(string.gsub(string.gsub(p13, "+", "-"), "/", "_"), "=", "")
end

function t.FromUrlSafeBase64(p13)
	local var33 = p13:gsub("[^%w%-_]", "")
	
	return string.gsub(string.gsub(var33 .. string.rep("=", (4 - #var33 % 4) % 4), "_", "/"), "-", "+")
end

return t