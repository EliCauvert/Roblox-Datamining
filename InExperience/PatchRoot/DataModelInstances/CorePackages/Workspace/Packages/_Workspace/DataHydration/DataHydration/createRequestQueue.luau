return function() --[[ Line: 1 | Named "createRequestQueue" ]]
	local Tbl = {}
	local Count = 1
	
	return {
		push = function(Key) --[[ Line: 8 ]]
			-- upvalues: Tbl (copy), Count (ref)
			if Tbl[Key] == nil then
				Tbl[Key] = Count
				Count += 1
			end
		end,
		pop = function(p1) --[[ Line: 15 ]]
			-- upvalues: Tbl (copy)
			local List = {}
			
			for i, _ in Tbl do
				table.insert(List, i)
			end
			table.sort(List, function(A, B): boolean --[[ Line: 20 ]]
				-- upvalues: Tbl (upval)
				return Tbl[A] < Tbl[B]
			end)
			
			if p1 >= #List then
				table.clear(Tbl)
				
				return List
			end
			local List1 = {}
			
			for i1 = 1, p1 do
				local Entry = List[i1]
				table.insert(List1, Entry)
				Tbl[Entry] = nil
			end
			return List1
		end,
		isEmpty = function(): boolean --[[ Line: 38 ]]
			-- upvalues: Tbl (copy)
			for _, _ in Tbl do
				return false
			end
			return true
		end,
		hasItem = function(p2): boolean --[[ Line: 45 ]]
			-- upvalues: Tbl (copy)
			return Tbl[p2] ~= nil
		end,
		clear = function() --[[ Line: 49 ]]
			-- upvalues: Tbl (copy), Count (ref)
			table.clear(Tbl)
			Count = 1
		end
	}
end