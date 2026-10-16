local function splitStringWithMarks(p1, List) --[[ Line: 19 ]]
	if type(p1) ~= "string" or type(List) ~= "table" then
		return p1, ""
	end
	local FindResult = nil
	local FindResult2 = nil
	for _, value in ipairs(List) do
		FindResult, FindResult2 = p1.find(p1, value, nil, true)
		
		if FindResult ~= nil then
			return p1.sub(p1, 1, FindResult - 1), (p1.sub(p1, FindResult2 + 1))
		end
	end
	return p1, ""
end

local function _(Text: string): string --[[ Line: 37 | Named "findFileNameFromPath" ]]
	return if type(Text) == "string" then string.match(Text, "([^.]*)$") else ""
end

return function(Text2: string, Count: number) --[[ Line: 45 | Named "ProcessErrorStack" ]]
	-- upvalues: splitStringWithMarks (copy)
	local List = {}
	local t = {}
	
	if not Count then
		Count = 0
	end
	if type(Text2) ~= "string" then
		return List, t
	end
	for i in Text2:gmatch("[^\r\n]+") do
		local Text1, SplitStringWithMarksResult2 = splitStringWithMarks(i, { ", line ", ", Line ", ":" })
		local Text, SplitStringWithMarksResult2_1 = splitStringWithMarks(SplitStringWithMarksResult2, { " - " })
		
		if SplitStringWithMarksResult2_1 == "" and Text ~= "" then
			local Match, Match2 = string.match(Text, "^(%d+)%s*(.*)")
			
			if Match then
				Text = Match
				
				if Match2 ~= "" then
					SplitStringWithMarksResult2_1 = Match2
				end
			end
		end
		if Text ~= "" and Text1 ~= "" then
			local _, _, FoundAt3 = string.find(Text1, "Script '(.*)'")
			
			if FoundAt3 ~= nil then
				Text1 = FoundAt3
			end
			local Entry = t[Text1]
			
			if Entry == nil then
				Count += 1
				Entry = Count
				t[Text1] = Entry
			end
			if SplitStringWithMarksResult2_1 == "" then
				SplitStringWithMarksResult2_1 = if type(Text1) == "string" then string.match(Text1, "([^.]*)$") else ""
			end
			table.insert(List, {
				line = Text,
				funcName = SplitStringWithMarksResult2_1,
				sourceCode = tostring(Entry)
			})
		end
	end
	local t1 = {}
	
	for Path, value in pairs(t) do
		t1[tostring(value)] = { path = Path }
	end
	return List, t1, Count
end