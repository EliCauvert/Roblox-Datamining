return {
	Filter = function(p0, p1)
		local t = {}
		
		for i = 1, #p0 do
			local var1 = p0[i]
			
			if p1(var1, i) then
				table.insert(t, var1)
			end
		end
		return t
	end,
	Map = function(p2, p3)
		local t = {}
		
		for i = 1, #p2 do
			t[i] = p3(p2[i], i)
		end
		return t
	end,
	MapReverse = function(p4, p5)
		local t = {}
		
		for i = #p4, 1, -1 do
			t[i] = p5(p4[i], i)
		end
		return t
	end,
	FilterMap = function(p6, p7)
		local t = {}
		
		for i = 1, #p6 do
			local var5 = p7(p6[i], i)
			
			if var5 ~= nil then
				table.insert(t, var5)
			end
		end
		return t
	end,
	Fold = function(p8, p9, p10)
		local var6 = p9
		
		for i = 1, #p8 do
			var6 = p10(var6, p8[i], i)
		end
		return var6
	end,
	FoldDictionary = function(p11, p12, p13)
		local var7 = p12
		
		for i, v in pairs(p11) do
			var7 = p13(var7, i, v)
		end
		return var7
	end,
	Take = function(p14, p15, p16)
		p16 = p16 or 1
		local var8 = p15 + (p16 - 1)
		
		if #p14 < var8 then
			var8 = #p14
		end
		local t = {}
		
		for i = p16, var8 do
			t[i - (p16 - 1)] = p14[i]
		end
		return t
	end,
	Find = function(p17, p18)
		for i, v in ipairs(p17) do
			if v == p18 then
				return i
			end
		end
		return nil
	end
}