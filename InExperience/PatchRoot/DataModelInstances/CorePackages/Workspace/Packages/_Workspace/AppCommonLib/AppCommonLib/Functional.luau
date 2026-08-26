return {
	Filter = function(p1, p2)
		local t = {}
		
		for i = 1, #p1 do
			local var1 = p1[i]
			
			if p2(var1, i) then
				table.insert(t, var1)
			end
		end
		return t
	end,
	Map = function(p3, p4)
		local t = {}
		
		for i = 1, #p3 do
			t[i] = p4(p3[i], i)
		end
		return t
	end,
	MapReverse = function(p5, p6)
		local t = {}
		
		for i = #p5, 1, -1 do
			t[i] = p6(p5[i], i)
		end
		return t
	end,
	FilterMap = function(p7, p8)
		local t = {}
		
		for i = 1, #p7 do
			local var2 = p8(p7[i], i)
			
			if var2 ~= nil then
				table.insert(t, var2)
			end
		end
		return t
	end,
	Fold = function(p9, p10, p11)
		local var3 = p10
		
		for i = 1, #p9 do
			var3 = p11(var3, p9[i], i)
		end
		return var3
	end,
	FoldDictionary = function(p12, p13, p14)
		local var4 = p13
		
		for i, v in pairs(p12) do
			var4 = p14(var4, i, v)
		end
		return var4
	end,
	Take = function(p15, p16, p17)
		p17 = p17 or 1
		local var5 = p16 + (p17 - 1)
		
		if #p15 < var5 then
			var5 = #p15
		end
		local t = {}
		
		for i = p17, var5 do
			t[i - (p17 - 1)] = p15[i]
		end
		return t
	end,
	Find = function(p18, p19)
		for i, v in ipairs(p18) do
			if v == p19 then
				return i
			end
		end
		return nil
	end
}