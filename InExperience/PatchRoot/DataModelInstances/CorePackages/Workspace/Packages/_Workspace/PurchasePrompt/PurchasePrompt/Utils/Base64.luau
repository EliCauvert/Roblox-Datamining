local t = {
	MakeEncoder = function(p0, p1, p2)
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
local var1 = t.MakeEncoder()
local char = string.char
local concat = table.concat
local extract = bit32.extract

function t.Encode(p3, p4, p5)
	-- upvalues: var1 (ref), extract (ref), char (ref), concat (ref)
	p4 = p4 or var1
	local t = {}
	local var5 = 1
	local p3Count = #p3
	local var7 = p3Count % 3
	local t_1 = {}
	
	for i = 1, p3Count - var7, 3 do
		local var13
		local var9, var10, var11 = p3:byte(i, i + 2)
		local var12 = var9 * 65536 + var10 * 256 + var11
		local _ = nil
		
		if p5 then
			var13 = t_1[var12]
			
			if not var13 then
				var13 = char(p4[extract(var12, 18, 6)], p4[extract(var12, 12, 6)], p4[extract(var12, 6, 6)], p4[extract(var12, 0, 6)])
				t_1[var12] = var13
			end
		else
			var13 = char(p4[extract(var12, 18, 6)], p4[extract(var12, 12, 6)], p4[extract(var12, 6, 6)], p4[extract(var12, 0, 6)])
		end
		t[var5] = var13
		var5 += 1
	end
	if var7 == 2 then
		local var14, var15 = p3:byte(p3Count - 1, p3Count)
		local var16 = var14 * 65536 + var15 * 256
		t[var5] = char(p4[extract(var16, 18, 6)], p4[extract(var16, 12, 6)], p4[extract(var16, 6, 6)], p4[64])
	elseif var7 == 1 then
		local var17 = p3:byte(p3Count) * 65536
		t[var5] = char(p4[extract(var17, 18, 6)], p4[extract(var17, 12, 6)], p4[64], p4[64])
	end
	return concat(t)
end

return t