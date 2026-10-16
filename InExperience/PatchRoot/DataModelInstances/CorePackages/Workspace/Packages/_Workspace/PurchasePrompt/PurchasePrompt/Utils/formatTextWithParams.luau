return function(Text: string, List): string --[[ Line: 1 | Named "formatTextWithParams" ]]
	if List ~= nil then
		for i, value in pairs(List) do
			Text = string.gsub(Text, ("{%s}"):format(i), function() --[[ Line: 5 ]]
				-- upvalues: value (copy)
				return value
			end)
		end
	end
	return Text
end