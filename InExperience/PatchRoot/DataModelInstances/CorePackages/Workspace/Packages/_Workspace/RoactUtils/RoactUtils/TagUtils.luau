return {
	combineReactTags = function(...)
		local packed = table.pack(...)
		local t = {}
		
		for i = 1, packed.n do
			local var1 = packed[i]
			
			if var1 and var1 ~= "" then
				table.insert(t, var1)
			end
		end
		return if #t > 0 then table.concat(t, " ") else nil
	end
}