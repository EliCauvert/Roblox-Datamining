local immutableJoinDictionariesUseTableClone = game:DefineFastFlag("ImmutableJoinDictionariesUseTableClone", false)

return {
	JoinDictionaries = function(...) --[[ line: 12 ]]
		-- upvalues: immutableJoinDictionariesUseTableClone (ref)
		local var1 = select("#", ...)
		
		if immutableJoinDictionariesUseTableClone and var1 > 0 then
			local cloned = table.clone(select(1, ...))
			
			for i_1 = 2, var1 do
				for i, v in select(i_1, ...) do
					cloned[i] = v
				end
			end
			return cloned
		else
			local t = {}
			
			for i_2 = 1, var1 do
				for i, v in pairs(select(i_2, ...)) do
					t[i] = v
				end
			end
			return t
		end
	end,
	JoinLists = function(...) --[[ line: 44 ]]
		local t = {}
		
		for i_1 = 1, select("#", ...) do
			local var5 = select(i_1, ...)
			local tCount = #t
			
			for i = 1, #var5 do
				t[tCount + i] = var5[i]
			end
		end
		return t
	end,
	Set = function(value, p0, p1) --[[ line: 62 ]]
		local cloned = table.clone(value)
		cloned[p0] = p1
		
		return cloned
	end,
	Append = function(p2, ...) --[[ line: 71 ]]
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
	RemoveFromDictionary = function(p3, ...) --[[ line: 89 ]]
		local var11
		local t = {}
		
		for i, v in pairs(p3) do
			var11 = false
			
			for i_1 = 1, select("#", ...) do
				if i ~= select(i_1, ...) then
					continue
				end
				var11 = true
				break
			end
			if not var11 then
				t[i] = v
			end
		end
		return t
	end,
	RemoveFromList = function(p4, p5) --[[ line: 111 ]]
		local t = {}
		
		for i = 1, #p4 do
			if i ~= p5 then
				table.insert(t, p4[i])
			end
		end
		return t
	end,
	RemoveRangeFromList = function(p6, p7, p8) --[[ line: 126 ]]
		local t = {}
		
		for i = 1, #p6 do
			if i < p7 or p7 + p8 <= i then
				table.insert(t, p6[i])
			end
		end
		return t
	end,
	RemoveValueFromList = function(p9, p10) --[[ line: 141 ]]
		local t = {}
		
		for i = 1, #p9 do
			if p9[i] ~= p10 then
				table.insert(t, p9[i])
			end
		end
		return t
	end
}