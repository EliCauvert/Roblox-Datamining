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
local var1 = t.MakeEncoder()
local char = string.char
local concat = table.concat
local extract = bit32.extract

function t.Encode(p4, p5, p6)
	-- upvalues: var1 (ref), extract (ref), char (ref), concat (ref)
	p5 = p5 or var1
	local t = {}
	local var2 = 1
	local p3Count = #p4
	local var3 = p3Count % 3
	local t_1 = {}
	
	for i = 1, p3Count - var3, 3 do
		local var4
		local var5, var6, var7 = p4:byte(i, i + 2)
		local var8 = var5 * 65536 + var6 * 256 + var7
		local _ = nil
		
		if p6 then
			var4 = t_1[var8]
			
			if not var4 then
				var4 = char(p5[extract(var8, 18, 6)], p5[extract(var8, 12, 6)], p5[extract(var8, 6, 6)], p5[extract(var8, 0, 6)])
				t_1[var8] = var4
			end
		else
			var4 = char(p5[extract(var8, 18, 6)], p5[extract(var8, 12, 6)], p5[extract(var8, 6, 6)], p5[extract(var8, 0, 6)])
		end
		t[var2] = var4
		var2 += 1
	end
	if var3 == 2 then
		local var9, var10 = p4:byte(p3Count - 1, p3Count)
		local var11 = var9 * 65536 + var10 * 256
		t[var2] = char(p5[extract(var11, 18, 6)], p5[extract(var11, 12, 6)], p5[extract(var11, 6, 6)], p5[64])
	elseif var3 == 1 then
		local var12 = p4:byte(p3Count) * 65536
		t[var2] = char(p5[extract(var12, 18, 6)], p5[extract(var12, 12, 6)], p5[64], p5[64])
	end
	return concat(t)
end

return t