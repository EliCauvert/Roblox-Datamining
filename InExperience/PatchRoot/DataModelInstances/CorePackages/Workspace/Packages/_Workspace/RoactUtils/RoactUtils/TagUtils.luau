return {
	combineReactTags = function(...) --[[ Line: 15 ]]
		local Packed = table.pack(...)
		local List = {}
		
		for i = 1, Packed.n do
			local Entry = Packed[i]
			
			if Entry and Entry ~= "" then
				table.insert(List, Entry)
			end
		end
		return if #List > 0 then table.concat(List, " ") else nil
	end
}