return function(Text: string, p1, p2, p3, p4) --[[ Line: 7 | Named "checkAndFormatPossibleLink" ]]
	if Text == nil or Text == "" or typeof(Text) ~= "string" then
		return false, Text
	end
	assert(Text ~= nil, "Text can't be nil")
	assert(typeof(Text) == "string", "Text must be a string")
	local Pattern = p1 or "{linkStart}"
	local Pattern1 = p2 or "{linkEnd}"
	local Replacement = p3 or "<u><b>"
	local P3 = p4 or "</b></u>"
	local HasFoundAt: boolean = string.find(Text, Pattern) ~= nil and string.find(Text, Pattern1) ~= nil
	
	if HasFoundAt then
		return HasFoundAt, (string.gsub(Text, Pattern, Replacement):gsub(Pattern1, P3))
	else
		return HasFoundAt, Text
	end
end