local function StringSplit(Text: string, Pattern: string, p1: number) --[[ Line: 7 ]]
	-- upvalues: StringSplit (copy)
	if #Text == 0 then
		return if string.find(Text, Pattern) then {} else { "" }
	end
	if not p1 then
		p1 = -1
	end
	if p1 == 1 then
		return { Text }
	end
	if not Pattern then
		Pattern = "%s+"
	end
	local StartIndex, EndIndex = string.find(Text, Pattern)
	
	if not StartIndex then
		return { Text }
	end
	if EndIndex < 1 then
		local StartIndex1, EndIndex1 = string.find(string.sub(Text, 2), Pattern)
		StartIndex = StartIndex1 + 1
		EndIndex = EndIndex1 + 1
	end
	local Segment = string.sub(Text, 1, StartIndex - 1)
	local Segment1 = string.sub(Text, EndIndex + 1)
	
	if #Segment1 == 0 and StartIndex <= EndIndex then
		return { Segment, Segment1 }
	else
		local StringSplitResult = StringSplit(Segment1, Pattern, p1 - 1)
		table.insert(StringSplitResult, 1, Segment)
		
		return StringSplitResult
	end
end

return StringSplit