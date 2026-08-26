return {
	JoinDictionaries = function(...)
		local t = {}
		
		for i_1 = 1, select("#", ...) do
			for i, v in pairs(select(i_1, ...)) do
				t[i] = v
			end
		end
		return t
	end,
	JoinLists = function(...)
		local t = {}
		
		for i_1 = 1, select("#", ...) do
			local var1 = select(i_1, ...)
			local tCount = #t
			
			for i = 1, #var1 do
				t[tCount + i] = var1[i]
			end
		end
		return t
	end,
	Set = function(value, p1, p2)
		local t = {}
		
		for i, v in pairs(value) do
			t[i] = v
		end
		t[p1] = p2
		
		return t
	end,
	Append = function(p3, ...)
		local t = {}
		local p2Count = #p3
		
		for i = 1, p2Count do
			t[i] = p3[i]
		end
		for i_1 = 1, select("#", ...) do
			t[p2Count + i_1] = select(i_1, ...)
		end
		return t
	end,
	RemoveFromDictionary = function(p4, ...)
		local var2
		local t = {}
		
		for i, v in pairs(p4) do
			var2 = false
			
			for i_1 = 1, select("#", ...) do
				if i ~= select(i_1, ...) then
					continue
				end
				var2 = true
				break
			end
			if not var2 then
				t[i] = v
			end
		end
		return t
	end,
	RemoveFromList = function(p5, p6)
		local t = {}
		
		for i = 1, #p5 do
			if i ~= p6 then
				table.insert(t, p5[i])
			end
		end
		return t
	end,
	RemoveRangeFromList = function(p7, p8, p9)
		local t = {}
		
		for i = 1, #p7 do
			if i < p8 or p8 + p9 <= i then
				table.insert(t, p7[i])
			end
		end
		return t
	end,
	RemoveValueFromList = function(p10, p11)
		local t = {}
		
		for i = 1, #p10 do
			if p10[i] ~= p11 then
				table.insert(t, p10[i])
			end
		end
		return t
	end
}