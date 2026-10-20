return {
	JoinDictionaries = function(...)
		local t = {}
		
		for i = 1, select("#", ...) do
			for i1, value in pairs((select(i, ...))) do
				t[i1] = value
			end
		end
		return t
	end,
	JoinLists = function(...)
		local t = {}
		
		for i = 1, select("#", ...) do
			local Selected = select(i, ...)
			local CountT = #t
			
			for i1 = 1, #Selected do
				t[CountT + i1] = Selected[i1]
			end
		end
		return t
	end,
	Set = function(List, Key, p1)
		local t = {}
		
		for i, value in pairs(List) do
			t[i] = value
		end
		t[Key] = p1
		
		return t
	end,
	Append = function(p2, ...)
		local t = {}
		local CountP3 = #p2
		
		for i = 1, CountP3 do
			t[i] = p2[i]
		end
		for i1 = 1, select("#", ...) do
			t[CountP3 + i1] = select(i1, ...)
		end
		return t
	end,
	RemoveFromDictionary = function(List, ...)
		local t = {}
		local Flag = nil
		
		for i1, value in pairs(List) do
			Flag = false
			
			for i = 1, select("#", ...) do
				if i1 ~= select(i, ...) then
					continue
				end
				Flag = true
				break
			end
			if not Flag then
				t[i1] = value
			end
		end
		return t
	end,
	RemoveFromList = function(p3, p4)
		local List = {}
		
		for i = 1, #p3 do
			if i ~= p4 then
				table.insert(List, p3[i])
			end
		end
		return List
	end,
	RemoveRangeFromList = function(p5, p6, p7)
		local List = {}
		
		for i = 1, #p5 do
			if i < p6 or p6 + p7 <= i then
				table.insert(List, p5[i])
			end
		end
		return List
	end,
	RemoveValueFromList = function(p8, p9)
		local List = {}
		
		for i = 1, #p8 do
			if p8[i] ~= p9 then
				table.insert(List, p8[i])
			end
		end
		return List
	end
}