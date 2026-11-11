return {
	resolve = function(Tbl, p1)
		local Copy = table.clone(Tbl)
		table.sort(Copy, function(A, B): boolean
			return if A.priority == B.priority then A.id < B.id else B.priority < A.priority
		end)
		local PreviouslyHidden = p1.previouslyHidden or {}
		local Hysteresis = p1.hysteresis or 0
		local List = {}
		local t = {}
		local Flag = nil
		
		for _, value in Copy do
			local NewMinDistance = p1.minDistance + (if PreviouslyHidden[value.id] then Hysteresis else 0)
			Flag = false
			
			for _, value1 in List do
				if (value.position - value1.position).Magnitude < NewMinDistance then
					Flag = true
					break
				end
			end
			if Flag then
				t[value.id] = true
			else
				table.insert(List, value)
			end
		end
		return t
	end,
	pinStatesEqual = function(List, List1): boolean
		for i, value in List do
			local Entry = List1[i]
			
			if not Entry or Entry.position ~= value.position or Entry.opacity ~= value.opacity or Entry.isFocused ~= value.isFocused then
				return false
			end
		end
		for i1 in List1 do
			if not List[i1] then
				return false
			end
		end
		return true
	end
}