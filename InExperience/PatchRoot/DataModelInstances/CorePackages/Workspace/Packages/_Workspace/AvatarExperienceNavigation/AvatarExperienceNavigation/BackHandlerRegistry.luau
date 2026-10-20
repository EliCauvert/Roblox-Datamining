local List = {}

return {
	register = function(Value)
		-- upvalues: List (copy)
		table.insert(List, Value)
		
		return function()
			-- upvalues: List (upval), Value (copy)
			local FoundIndex: number? = table.find(List, Value)
			
			if FoundIndex then
				table.remove(List, FoundIndex)
			end
		end
	end,
	consume = function(): boolean
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