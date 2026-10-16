local _ = require(script:FindFirstAncestor("InExperienceShop").Types)

local function _(Text: string) --[[ Line: 41 | Named "tokenize" ]]
	local List = {}
	
	for i in string.gmatch(Text, "%S+") do
		table.insert(List, i)
	end
	return List
end

local _ = function(Text: string): string --[[ Line: 49 | Named "trim" ]]
	return string.match(Text, "^%s*(.-)%s*$") or ""
end

local _ = function(Text: string, Segment): boolean --[[ Line: 53 | Named "startsWith" ]]
	return #Text >= #Segment and string.sub(Text, 1, #Segment) == Segment
end

local _ = function(List, p1): boolean --[[ Line: 60 | Named "anyWordEquals" ]]
	for _, value in List do
		if value == p1 then
			return true
		end
	end
	return false
end

local _ = function(List, Segment): boolean --[[ Line: 69 | Named "anyWordStartsWith" ]]
	for _, value in List do
		if #Segment <= #value and string.sub(value, 1, #Segment) == Segment then
			return true
		end
	end
	return false
end

local function anyWordIncludes(List, Pattern): boolean --[[ Line: 78 ]]
	for _, value in List do
		if string.find(value, Pattern, 1, true) ~= nil then
			return true
		end
	end
	return false
end

local _ = function(p2: number): number --[[ Line: 87 | Named "maxEditsFor" ]]
	return if p2 >= 8 then 2 else 1
end

local function editDistanceWithin(Text: string, Text1: string, p2): boolean --[[ Line: 95 ]]
	if Text == Text1 then
		return true
	end
	local CountText = #Text
	local CountText1 = #Text1
	
	if p2 < math.abs(CountText - CountText1) then
		return false
	end
	if CountText < CountText1 then
		local Text2: string = Text1
		Text1 = Text
		Text = Text2
		local Count: number = CountText1
		CountText1 = CountText
		CountText = Count
	end
	if CountText1 == 0 then
		return CountText <= p2
	end
	local Buffer = table.create(CountText1 + 1)
	local Buffer1 = table.create(CountText1 + 1)
	local Buffer2 = table.create(CountText1 + 1)
	
	for i = 0, CountText1 do
		Buffer1[i + 1] = i
	end
	for i1 = 1, CountText do
		Buffer2[1] = i1
		local Index: number = i1
		local ByteValue = string.byte(Text, i1)
		local ByteValue1: number = if i1 >= 2 then string.byte(Text, i1 - 1) else 0
		for i2 = 1, CountText1 do
			local ByteValue2 = string.byte(Text1, i2)
			local NewBufferEntry = Buffer2[i2] + 1
			local NewBufferEntry1 = Buffer1[i2] + (if ByteValue == ByteValue2 then 0 else 1)
			local NewBufferEntry2 = Buffer1[i2 + 1] + 1
			
			if NewBufferEntry < NewBufferEntry2 then
				NewBufferEntry2 = NewBufferEntry
			end
			if NewBufferEntry1 < NewBufferEntry2 then
				NewBufferEntry2 = NewBufferEntry1
			end
			if i1 >= 2 and i2 >= 2 and ByteValue == string.byte(Text1, i2 - 1) and ByteValue1 == ByteValue2 then
				local NewBufferEntry3 = Buffer[i2 - 1] + 1
				
				if NewBufferEntry3 < NewBufferEntry2 then
					NewBufferEntry2 = NewBufferEntry3
				end
			end
			Buffer2[i2 + 1] = NewBufferEntry2
			
			if NewBufferEntry2 < Index then
				Index = NewBufferEntry2
			end
		end
		if p2 < Index then
			return false
		end
		local Buffer3 = Buffer1
		Buffer1 = Buffer2
		Buffer2 = Buffer
		Buffer = Buffer3
	end
	return Buffer1[CountText1 + 1] <= p2
end

local _ = function(List, p3, p4): boolean --[[ Line: 164 | Named "anyWordWithinEditDistance" ]]
	-- upvalues: editDistanceWithin (copy)
	for _, value in List do
		if editDistanceWithin(p3, value, p4) then
			return true
		end
	end
	return false
end

local function anyWordHasFuzzyPrefix(List, Pattern, p5): boolean --[[ Line: 176 ]]
	-- upvalues: editDistanceWithin (copy)
	local CountPattern = #Pattern
	
	for _, value in List do
		if CountPattern <= #value and editDistanceWithin(Pattern, string.sub(value, 1, CountPattern), p5) then
			return true
		end
	end
	return false
end

local function scoreToken(Text: string, List, Pattern, Count: number): number --[[ Line: 215 ]]
	-- upvalues: anyWordHasFuzzyPrefix (copy), anyWordIncludes (copy), editDistanceWithin (copy)
	if Text == Pattern then
		return 100
	end
	local Flag = false
	
	for _, value in List do
		if value == Pattern then
			Flag = true
			break
		end
	end
	if Flag then
		return 50
	end
	local Flag1 = false
	
	for _, value1 in List do
		if #Pattern <= #value1 and string.sub(value1, 1, #Pattern) == Pattern then
			Flag1 = true
			break
		end
	end
	if Flag1 then
		return 20
	end
	if #Pattern >= 5 and anyWordHasFuzzyPrefix(List, Pattern, if #Pattern >= 8 then 2 else 1) then
		return 8
	end
	if #Pattern > 1 and string.find(Text, Pattern, 1, true) ~= nil then
		return 5
	end
	if #Pattern == 1 and Count > 1 and anyWordIncludes(List, Pattern) then
		return 5
	end
	if #Pattern >= 4 then
		local v1: number = if #Pattern >= 8 then 2 else 1
		local Flag2 = false
		
		for _, value2 in List do
			if editDistanceWithin(Pattern, value2, v1) then
				Flag2 = true
				break
			end
		end
		if Flag2 then
			return 12
		end
	end
	return 0
end

return {
	substringMatch = function(List, Text: string, p6: number) --[[ Line: 191 ]]
		if p6 <= 0 then
			return {}
		end
		if Text == "" then
			return {}
		end
		local Lowered = string.lower(Text)
		local List1 = {}
		
		for _, value in List do
			if string.find(string.lower(value.name), Lowered, 1, true) ~= nil then
				table.insert(List1, value)
				
				if p6 <= #List1 then break end
			else
				continue
			end
		end
		return List1
	end,
	fuzzyMatch = function(Items, Text: string, p7: number) --[[ Line: 256 ]]
		-- upvalues: scoreToken (copy)
		if p7 <= 0 then
			return {}
		end
		local Lowered = string.lower(string.match(Text, "^%s*(.-)%s*$") or "")
		
		if Lowered == "" then
			return Items
		end
		local List = {}
		
		for i in string.gmatch(Lowered, "%S+") do
			table.insert(List, i)
		end
		local CountList = #List
		local List1 = {}
		local Flag = nil
		
		for Index, item in Items do
			local Lowered1 = string.lower(item.name)
			local List2 = {}
			
			for i1 in string.gmatch(Lowered1, "%S+") do
				table.insert(List2, i1)
			end
			local Score = 0
			Flag = false
			
			for _, value in List do
				local ScoreTokenResult: number = scoreToken(Lowered1, List2, value, CountList)
				
				if ScoreTokenResult == 0 then
					Flag = true
					break
				else
					Score += ScoreTokenResult
					continue
				end
			end
			if not Flag then
				table.insert(List1, { item = item, score = Score, index = Index })
			end
		end
		table.sort(List1, function(A, B): boolean --[[ Line: 294 ]]
			return if A.score == B.score then A.index < B.index else B.score < A.score
		end)
		local Smallest = math.min(p7, #List1)
		local Buffer = table.create(Smallest)
		
		for i2 = 1, Smallest do
			Buffer[i2] = List1[i2].item
		end
		return Buffer
	end
}