local function _(p1) --[[ Line: 14 | Named "TypeError" ]]
	return p1
end

return function(Text: string, Text1: string) --[[ Line: 18 | Named "splitOnFirst" ]]
	if type(Text) ~= "string" or type(Text1) ~= "string" then
		error("Expected the arguments to be of type `string`")
	end
	if Text1 == "" then
		return { Text }
	else
		local StartIndex: number = Text:find(Text1, 1, true)
		
		return if StartIndex == nil then { Text } else {
			Text:sub(1, StartIndex - 1),
			Text:sub(StartIndex + Text1:len())
		}
	end
end