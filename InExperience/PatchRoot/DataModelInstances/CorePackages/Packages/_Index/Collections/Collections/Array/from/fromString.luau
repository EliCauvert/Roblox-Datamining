local _ = require(script.Parent.Parent.Parent.Parent.ES7Types)

return function(Text: string, Callback, p1) --[[ Line: 25 ]]
	local CountText = #Text
	local Buffer = table.create(CountText)
	
	if Callback then
		for i = 1, CountText do
			if p1 == nil then
				Buffer[i] = Callback(string.sub(Text, i, i), i)
			else
				Buffer[i] = Callback(p1, string.sub(Text, i, i), i)
			end
		end
		return Buffer
	else
		for i1 = 1, CountText do
			Buffer[i1] = string.sub(Text, i1, i1)
		end
		return Buffer
	end
end