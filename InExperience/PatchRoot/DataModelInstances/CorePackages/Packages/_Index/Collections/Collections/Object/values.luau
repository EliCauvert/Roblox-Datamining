local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(Text: string) --[[ Line: 23 ]]
	if Text == nil then
		error("cannot extract values from a nil value")
	end
	local ValueType = typeof(Text)
	local List = nil
	
	if ValueType == "table" then
		List = {}
		
		for _, value in pairs(Text) do
			table.insert(List, value)
		end
		return List
	else
		if ValueType == "string" then
			local Length = Text:len()
			List = table.create(Length)
			
			for i = 1, Length do
				List[i] = Text:sub(i, i)
			end
		end
		return List
	end
end