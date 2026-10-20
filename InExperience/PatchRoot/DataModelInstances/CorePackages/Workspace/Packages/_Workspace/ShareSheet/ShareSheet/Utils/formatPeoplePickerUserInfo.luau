return {
	formatDescription = function(List): string
		local List1 = {}
		
		for _, value in List do
			if value.username ~= nil and value.username ~= "" then
				table.insert(List1, `@{value.username}`)
			end
		end
		return table.concat(List1, ", ")
	end,
	formatTitle = function(List): string
		local Buffer = table.create(#List)
		
		for i, value in List do
			Buffer[i] = value.displayName
		end
		return table.concat(Buffer, ", ")
	end
}