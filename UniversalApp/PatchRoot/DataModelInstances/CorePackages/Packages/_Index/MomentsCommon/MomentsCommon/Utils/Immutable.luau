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
			local var2 = select(i_1, ...)
			local tCount = #t
			
			for i = 1, #var2 do
				t[tCount + i] = var2[i]
			end
		end
		return t
	end,
	Set = function(value, p0, p1)
		local cloned = table.clone(value)
		cloned[p0] = p1
		
		return cloned
	end,
	Append = function(p2, ...)
		local t = {}
		local p2Count = #p2
		
		for i = 1, p2Count do
			t[i] = p2[i]
		end
		for i_1 = 1, select("#", ...) do
			t[p2Count + i_1] = select(i_1, ...)
		end
		return t
	end,
	RemoveFromDictionary = function(p3, ...)
		local var8
		local t = {}
		
		for i, v in pairs(p3) do
			var8 = false
			
			for i_1 = 1, select("#", ...) do
				if i ~= select(i_1, ...) then
					continue
				end
				var8 = true
				break
			end
			if not var8 then
				t[i] = v
			end
		end
		return t
	end,
	RemoveFromList = function(p4, p5)
		local t = {}
		
		for i = 1, #p4 do
			if i ~= p5 then
				table.insert(t, p4[i])
			end
		end
		return t
	end,
	RemoveRangeFromList = function(p6, p7, p8)
		local t = {}
		
		for i = 1, #p6 do
			if i < p7 or p7 + p8 <= i then
				table.insert(t, p6[i])
			end
		end
		return t
	end,
	RemoveValueFromList = function(p9, p10)
		local t = {}
		
		for i = 1, #p9 do
			if p9[i] ~= p10 then
				table.insert(t, p9[i])
			end
		end
		return t
	end
}