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
		local cloned = table.clone(value)
		cloned[p1] = p2
		
		return cloned
	end,
	Append = function(p1, ...)
		local t = {}
		local p2Count = #p1
		
		for i = 1, p2Count do
			t[i] = p1[i]
		end
		for i_1 = 1, select("#", ...) do
			t[p2Count + i_1] = select(i_1, ...)
		end
		return t
	end,
	RemoveFromDictionary = function(p2, ...)
		local var2
		local t = {}
		
		for i, v in pairs(p2) do
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
	RemoveFromList = function(p3, p4)
		local t = {}
		
		for i = 1, #p3 do
			if i ~= p4 then
				table.insert(t, p3[i])
			end
		end
		return t
	end,
	RemoveRangeFromList = function(p5, p6, p7)
		local t = {}
		
		for i = 1, #p5 do
			if i < p6 or p6 + p7 <= i then
				table.insert(t, p5[i])
			end
		end
		return t
	end,
	RemoveValueFromList = function(p8, p9)
		local t = {}
		
		for i = 1, #p8 do
			if p8[i] ~= p9 then
				table.insert(t, p8[i])
			end
		end
		return t
	end
}