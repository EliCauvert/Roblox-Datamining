local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function() --[[ Line: 5 | Named "useTagsState" ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	
	return UseStateResult, (ReactModule.useCallback(function(...) --[[ Line: 8 ]]
		-- upvalues: UseStateResult2 (copy)
		local List = {}
		
		for _, value in { ... } do
			for _, value1 in string.split(value, " ") do
				table.insert(List, value1)
			end
		end
		UseStateResult2(function(Tbl) --[[ Line: 20 ]]
			-- upvalues: List (copy)
			local Flag = false
			
			for _, value in List do
				if Tbl[value] ~= true then
					Flag = true
					break
				end
			end
			if not Flag then
				return Tbl
			end
			local Copy = table.clone(Tbl)
			
			for _, value1 in List do
				Copy[value1] = true
			end
			return Copy
		end)
	end, { UseStateResult2 }))
end