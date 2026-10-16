local List = {}

return {
	register = function(Value) --[[ Line: 5 ]]
		-- upvalues: List (copy)
		table.insert(List, Value)
		
		return function() --[[ Line: 8 ]]
			-- upvalues: List (upval), Value (copy)
			local FoundIndex: number? = table.find(List, Value)
			
			if FoundIndex then
				table.remove(List, FoundIndex)
			end
		end
	end,
	consume = function(): boolean --[[ Line: 16 ]]
		-- upvalues: List (copy)
		local Entry: () -> () = List[#List]
		
		if Entry then
			Entry()
			
			return true
		else
			return false
		end
	end
}