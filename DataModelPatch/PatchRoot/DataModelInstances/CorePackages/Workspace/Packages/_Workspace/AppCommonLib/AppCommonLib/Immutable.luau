local ImmutableJoinDictionariesUseTableClone = game:DefineFastFlag("ImmutableJoinDictionariesUseTableClone", false)

return {
	JoinDictionaries = function(...)
		-- upvalues: ImmutableJoinDictionariesUseTableClone (copy)
		local Selected: number = select("#", ...)
		
		if ImmutableJoinDictionariesUseTableClone and Selected > 0 then
			local Copy = table.clone(select(1, ...))
			
			for i1 = 2, Selected do
				for i2, value in select(i1, ...) do
					Copy[i2] = value
				end
			end
			return Copy
		else
			local t = {}
			
			for i = 1, Selected do
				for i3, value1 in pairs((select(i, ...))) do
					t[i3] = value1
				end
			end
			return t
		end
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
	Set = function(Tbl, Key, p1)
		local Copy = table.clone(Tbl)
		Copy[Key] = p1
		
		return Copy
	end,
	Append = function(p1, ...)
		local t = {}
		local CountP2 = #p1
		
		for i = 1, CountP2 do
			t[i] = p1[i]
		end
		for i1 = 1, select("#", ...) do
			t[CountP2 + i1] = select(i1, ...)
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
	RemoveFromList = function(p2, p3)
		local List = {}
		
		for i = 1, #p2 do
			if i ~= p3 then
				table.insert(List, p2[i])
			end
		end
		return List
	end,
	RemoveRangeFromList = function(p4, p5, p6)
		local List = {}
		
		for i = 1, #p4 do
			if i < p5 or p5 + p6 <= i then
				table.insert(List, p4[i])
			end
		end
		return List
	end,
	RemoveValueFromList = function(p7, p8)
		local List = {}
		
		for i = 1, #p7 do
			if p7[i] ~= p8 then
				table.insert(List, p7[i])
			end
		end
		return List
	end
}