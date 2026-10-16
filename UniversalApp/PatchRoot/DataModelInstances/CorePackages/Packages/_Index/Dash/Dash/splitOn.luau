local InsertFunction = table.insert

return function(Text: string, p1) --[[ Line: 10 | Named "splitOn" ]]
	-- upvalues: InsertFunction (copy)
	local t = {}
	local t1 = {}
	local v1 = 1
	
	if p1 then
		local StartIndex, EndIndex = Text:find(p1, v1)
		while StartIndex do
			InsertFunction(t1, Text:sub(StartIndex, EndIndex))
			InsertFunction(t, Text:sub(v1, StartIndex - 1))
			v1 = EndIndex + 1
			StartIndex, EndIndex = Text:find(p1, v1)
		end
		InsertFunction(t, Text:sub(v1))
		
		return t, t1
	else
		for i = 1, #Text do
			InsertFunction(t, Text:sub(i, i))
		end
		return t
	end
end