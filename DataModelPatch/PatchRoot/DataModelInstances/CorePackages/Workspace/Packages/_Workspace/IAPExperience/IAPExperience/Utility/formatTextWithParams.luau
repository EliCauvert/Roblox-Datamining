return function(Text: string, List): string
	if List ~= nil then
		for i, value in pairs(List) do
			Text = string.gsub(Text, ("{%s}"):format(i), function()
				-- upvalues: value (copy)
				return value
			end)
		end
	end
	return Text
end