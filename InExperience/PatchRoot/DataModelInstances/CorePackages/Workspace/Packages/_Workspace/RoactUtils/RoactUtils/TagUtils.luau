return {
	combineReactTags = function(...) --[[ line: 15 ]]
		local packed = table.pack(...)
		local t = {}
		
		for i = 1, packed.n do
			local var2 = packed[i]
			
			if var2 and var2 ~= "" then
				table.insert(t, var2)
			end
		end
		return if #t > 0 then table.concat(t, " ") else nil
	end
}